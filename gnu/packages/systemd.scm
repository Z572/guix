(define-module (gnu packages systemd)
  #:use-module (gnu packages display-managers)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages base)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages apparmor)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages crypto)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages file)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)                ;intltool
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages hunspell)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xml))


(define util-linux/fix
  (package
    (inherit util-linux)
    (arguments
     (substitute-keyword-arguments (package-arguments util-linux)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'fix-login
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "include/pathnames.h"
                  (("\"/bin/login\"")
                   (string-append "\"" (search-input-file inputs "/bin/login") "\"")))))))))
    (inputs (modify-inputs (package-inputs util-linux)
              (append shadow)))))

(define-public sddm/systemd
  (package
    (inherit sddm)
    (arguments
     (substitute-keyword-arguments (package-arguments sddm)
       ((#:configure-flags flags)
        #~(delete
           "-DNO_SYSTEMD=ON"
           (delete "-DUSE_ELOGIND=ON"
                   #$flags)))
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'service-install
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "services/CMakeLists.txt"
                  (("\\$\\{SYSTEMD_SYSTEM_UNIT_DIR\\}")
                   (string-append #$output "/lib/systemd/system")))))))))
    (inputs (modify-inputs (package-inputs sddm)
              (replace "elogind" systemd)))))

(define-public systemd-minimal
  (package
    (name "systemd-minimal")
    (version "254")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/systemd/systemd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (patches (search-patches "systemd-pkg-config-derive-prefix-from-prefix.patch"
                                       "systemd-add-rootprefix-to-lookup-dir-paths.patch"))
              (sha256
               (base32
                "1xdw8zdayhz2pabfn89almp5ajc57v2vcqkgh9y9csbi518aqvr2"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:tests? #f ;; TODO: 37 fail
      #:configure-flags
      #~(let* ((out #$output)
               (sysconf (string-append out "/etc"))
               (rootpkglibdir (string-append out "/lib/systemd"))
               (dbuspolicy (string-append out "/etc/dbus-1/system.d"))
               (kexec-tools #$(this-package-input "kexec-tools"))
               (shadow #$(this-package-input "shadow"))
               (kexec-path (string-append kexec-tools "/sbin/kexec"))
               (nologin-path (string-append shadow "/sbin/nologin")))
          (list
           "-Dinstall-sysconfdir=false"
           (string-append "-Drootprefix=" out)
           (string-append "-Dsysconfdir=" sysconf)
           ;; (string-append "-Drootlibexecdir=" libexec)
           (string-append "-Ddbuspolicydir=" dbuspolicy)
           (string-append "-Dc_link_args=-Wl,-rpath=" rootpkglibdir)
           (string-append "-Dcpp_link_args=-Wl,-rpath=" rootpkglibdir)
           ;; (string-append "-Dhalt-path=" halt-path)
           (string-append "-Dkexec-path=" kexec-path)
           ;; (string-append "-Dpoweroff-path=" poweroff-path)
           ;; (string-append "-Dreboot-path=" reboot-path)
           "-Dsysvinit-path="
           "-Dsysvrcnd-path="
           "-Dcreate-log-dirs=false"
           "-Dhwdb=false"
           "-Dmode=release"
           "-Drpmmacrosdir=no"
           "-Dsbat-distro='Guix System'"
           "-Dsbat-distro-summary='guix'"
           "-Dsbat-distro-url='https://lists.gnu.org/mailman/listinfo/bug-guix'"
           "-Dbootloader=true"
           (string-append "-Dnologin-path=" nologin-path)
           (string-append "-Dloadkeys-path=" #$(this-package-input "kbd") "/bin/loadkeys")
           ;; "-Dcgroup-controller=elogind"
           "-Dman=true"
           ;; Disable some tests.
           "-Dslow-tests=false"

           "-Dldconfig=false"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "meson.build"
                (("join_paths\\(bindir, 'pkttyagent'\\)")
                 "'\"/run/current-system/profile/bin/pkttyagent\"'"))
              (substitute* "meson.build"
                (("'HAVE_DBUS', have")
                 "'HAVE_DBUS', false"))
              (substitute* "src/basic/path-util.h"
                (("^#define DEFAULT_PATH_NORMAL .*$")
                 (string-append "#define DEFAULT_PATH_NORMAL \"" #$output "/bin:"
                                #$coreutils-minimal "/bin" "\"\n"))
                (("^#define DEFAULT_PATH_NORMAL_NULSTR.*$")
                 (string-append "#define DEFAULT_PATH_NORMAL_NULSTR \"" #$output "/bin\\0\"\n"))
                (("^#define\\ DEFAULT_PATH_COMPAT .*")
                 "#define DEFAULT_PATH_COMPAT DEFAULT_PATH_NORMAL\n"))
              (with-directory-excursion "units"
                (substitute* "modprobe@.service"
                  (("/sbin/modprobe")
                   (search-input-file inputs "/bin/modprobe")))
                (substitute* '("console-getty.service.in"
                               "container-getty@.service.in"
                               "getty@.service.in"
                               "serial-getty@.service.in")
                  (("/sbin/agetty")
                   (search-input-file inputs "/sbin/agetty")))
                (substitute* '("systemd-tmpfiles-clean.service"
                               "systemd-tmpfiles-setup.service"
                               "systemd-tmpfiles-setup-dev.service")
                  (("ExecStart=systemd-tmpfiles")
                   (string-append "ExecStart=" #$output "/bin/systemd-tmpfiles")))
                (substitute* '("systemd-journal-catalog-update.service"
                               "systemd-journal-flush.service")
                  (("=journalctl")
                   (string-append "=" #$output "/bin/journalctl")))
                (substitute* "systemd-sysusers.service"
                  (("=systemd-sysusers")
                   (string-append "=" #$output "/bin/systemd-sysusers")))
                (substitute* "systemd-firstboot.service"
                  (("=systemd-firstboot")
                   (string-append "=" #$output "/bin/systemd-firstboot")))
                (substitute* "systemd-machine-id-commit.service"
                  (("=systemd-machine-id-setup")
                   (string-append "=" #$output "/bin/systemd-machine-id-setup"))))
              ))
          (add-after 'unpack 'adjust-tests
            (lambda _
              ;; Skip the following test, which depends on users such as 'root'
              ;; existing in the build environment.
              ;; (invoke "sed" "/src\\/test\\/test-user-util.c/,+2s/^/#/g"
              ;;         "-i" "src/test/meson.build")
              ;; This test tries to copy some bytes from /usr/lib/os-release,
              ;; which does not exist in the build container.  Choose something
              ;; more likely to be available.
              (substitute* "src/test/test-copy.c"
                (("/usr/lib/os-release")
                 "/etc/passwd"))
              (substitute* '("src/test/test-copy.c"
                             "src/test/test-xattr-util.c")
                (("/var/tmp")
                 "/tmp"))
              ;; Use a shebang that works in the build container.
              (substitute* "src/test/test-exec-util.c"
                (("#!/bin/sh")
                 (string-append "#!" (which "sh"))))
              (substitute* '("src/test/test-cgroup-util.c"
                             "src/test/test-cgroup.c")
                ;; skip test
                (("r == -ENOMEDIUM") "1"))
              ;; Do not look for files or directories that do not exist.
              (substitute* "src/test/test-fs-util.c"
                (("usr") "etc")
                (("/etc/machine-id") "/etc/passwd")
                (("/bin/sh") (which "sh")))
              ;; (substitute* "src/test/test-fileio.c"
              ;;   (("\"/etc/nsswitch.conf\",") "")
              ;;   (("\"/proc/kcore\",") "")
              ;;   (("\"/sys/kernel/uevent_seqnum\",") ""))
              (substitute* '("src/test/test-execve.c")
                (("/bin/true") (which "true")))
              (substitute* "src/libsystemd/sd-bus/test-bus-creds.c"
                ;; skip test
                (("\\(cg_unified\\(\\) == -ENOMEDIUM\\)") "(true)"))
              (substitute* '("src/test/test-load-fragment.c"
                             "src/test/test-fileio.c"
                             "src/test/test-env-file.c"
                             "src/analyze/test-verify.c"
                             "test/units/testsuite-15.sh"
                             "test/testsuite-03.units/hello.service"
                             "test/testsuite-03.units/unstoppable.service"
                             "test/testsuite-06.units/hola.service"
                             "test/testsuite-23.units/testsuite-23-retry-upheld.service"
                             "test/test-execute/exec-systemcallfilter-failing3.service"
                             "test/test-execute/exec-systemcallfilter-failing2.service"
                             "test/test-execute/exec-systemcallfilter-failing.service"
                             "test/test-udev.py")
                (("/bin/echo") (which "echo")))
              (substitute* "src/test/test-mountpoint-util.c"
                (("assert_se\\(path_is_mount_point\\(\"/sys.*")
                 ""))
              ;; /bin/sh does not exist in the build container.
              (substitute* "src/test/test-path-util.c"
                (("/bin/sh") (which "sh")))))
          (add-after 'unpack 'no-create-/var/lib/systemd
            (lambda _
              (substitute* "meson.build"
                (("meson.add_install_script\\('sh', '-c', mkdir_p\\.format\\(systemdstatedir\\)\\)")
                 ""))))
          (add-after 'install 'remove-99-environment.conf
            (lambda _
              (delete-file (string-append #$output "/lib/environment.d/99-environment.conf"))))
          (add-after 'patch-source-shebangs 'unpatch-shebangs
            (lambda _
              (substitute* '("src/ukify/ukify.py" "src/kernel-install/60-ukify.install.in")
                (("^#!.*/bin/python3") "#!/usr/bin/env python3")))))))
    (native-inputs
     (list
      docbook-xml-4.5
      docbook-xml-4.2
      docbook-xsl
      gettext-minimal
      gperf
      libxml2
      m4
      pkg-config
      python
      libxslt
      python-jinja2
      python-pyelftools
      glib))
    (inputs
     (list kexec-tools
           linux-pam
           passwdqc
           libpwquality
           libseccomp
           libbpf
           libcap
           ;; curl
           ;; pcre2
           p11-kit
           kmod
           ;; audit
           lz4
           xz
           ;; (list bzip2 "static")
           ;; (list zstd "lib")
           ;; qrencode
           util-linux/fix
           (list util-linux/fix "lib")
           ;; gnutls
           ;; openssl
           shadow         ; for 'nologin'
           ;; acl; to add individual users to ACLs on /dev nodes

           kbd))
    (home-page "https://github.com/systemd/systemd")
    (synopsis "")
    (description "")
    (license license:lgpl2.1+)))

(define-public dbus/systemd
  (package
    (inherit dbus)
    (name "dbus-with-systemd")
    (arguments
     (substitute-keyword-arguments (package-arguments dbus)
       ((#:configure-flags configure-flags ''())
        #~(cons*
           "--enable-systemd"
           "--with-system-socket=/run/dbus/system_bus_socket"
           "--enable-inotify"
           "--with-system-pid-file=/run/dbus/pid"
           (string-append "--with-systemdsystemunitdir=" #$output "/lib/systemd/system")
           #$configure-flags))))
    (inputs (modify-inputs (package-inputs dbus)
              (append systemd-minimal)))))

(define-public systemd
  (package
    (inherit systemd-minimal)
    (name "systemd")
    (inputs (modify-inputs (package-inputs systemd-minimal)
              (append dbus/systemd
                      (list bzip2 "static")
                      (list zstd "lib")
                      gnutls
                      openssl
                      acl
                      libidn2
                      cryptsetup
                      libgcrypt
                      libmicrohttpd
                      libselinux
                      libapparmor
                      libxkbcommon
                      qrencode
                      curl
                      pcre2
                      audit)))))

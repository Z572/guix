(define-module (gnu services systemd)
  #:use-module (guix ui)
  #:use-module (guix sets)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu services configuration)
  #:use-module (gnu services dbus)
  #:use-module (gnu packages systemd)
  #:use-module (gnu packages base)
  #:use-module ((guix diagnostics)
                #:select (define-with-syntax-properties formatted-message))
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services herd)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages file-systems)
  #:use-module (ice-9 match)
  #:use-module (ice-9 vlist)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:export (systemd-configuration
            systemd-configuration-package
            systemd-configuration?
            systemd-configuration-services
            systemd-configuration-upstream-units

            systemd-root-service-type))

(define list-of-shepherd-service?
  (list-of (@@ (gnu services shepherd) shepherd-service?)))

(define-configuration/no-serialization systemd-configuration
  (package
    (file-like systemd)
    "The SYSTEMD package.")
  (services
   (list-of-shepherd-service '())
   "The services.")
  (upstream-units
   (list-of-strings
    '("basic.target"
      "sysinit.target"
      "sockets.target"
      "exit.target"
      "graphical.target"
      "multi-user.target"
      "network.target"
      "network-pre.target"
      "network-online.target"
      "nss-lookup.target"
      "nss-user-lookup.target"
      "time-sync.target"

      "sigpwr.target"
      "timers.target"
      "paths.target"
      "rpcbind.target"

      "rescue.target"
      "rescue.service"

      "systemd-udevd-control.socket"
      "systemd-udevd-kernel.socket"
      "systemd-udevd.service"
      "systemd-udev-settle.service"

      "getty.target"
      "getty-pre.target"
      "getty@.service"
      "serial-getty@.service"
      "console-getty.service"
      "container-getty@.service"
      "systemd-vconsole-setup.service"


      "sound.target"
      "bluetooth.target"
      "printer.target"
      "smartcard.target"


      "systemd-modules-load.service"
      "kmod-static-nodes.service"
      "modprobe@.service"

      "systemd-fsck@.service"
      "systemd-fsck-root.service"
      "systemd-growfs@.service"
      "systemd-growfs-root.service"
      "systemd-remount-fs.service"
      "systemd-pstore.service"
      "local-fs.target"
      "local-fs-pre.target"
      "remote-fs.target"
      "remote-fs-pre.target"
      "swap.target"
      "dev-hugepages.mount"
      "dev-mqueue.mount"
      "sys-fs-fuse-connections.mount"

      "sys-kernel-config.mount"

      "systemd-random-seed.service"
      "systemd-backlight@.service"
      "systemd-rfkill.service"
      "systemd-rfkill.socket"

      "hibernate.target"
      "suspend.target"
      "suspend-then-hibernate.target"
      "sleep.target"
      "hybrid-sleep.target"
      "systemd-hibernate.service"
      "systemd-hybrid-sleep.service"
      "systemd-suspend.service"
      "systemd-suspend-then-hibernate.service"

      "reboot.target"
      "systemd-reboot.service"
      "poweroff.target"
      "systemd-poweroff.service"
      "halt.target"
      "systemd-halt.service"
      "shutdown.target"
      "umount.target"
      "final.target"
      "kexec.target"
      "systemd-kexec.service"

      "systemd-ask-password-console.path"
      "systemd-ask-password-console.service"
      "systemd-ask-password-wall.path"
      "systemd-ask-password-wall.service"

      "slices.target"

      "machine.slice"
      "machines.target"
      "systemd-machined.service"

      "systemd-nspawn@.service"

      "systemd-sysctl.service"

      "systemd-exit.service"
      "systemd-update-done.service"))
   "upstream units"))

(define (systemd-boot-gexp config)
  "Return a gexp starting the systemd service."
  (let ((systemd (systemd-configuration-package config))
        (services (systemd-configuration-services config)))
    ;; (pk 'services services)
    #~(begin
        (false-if-exception (delete-file "/run/booted-system"))
        (mkdir-p "/etc/systemd/system")
        (mkdir-p "/run/systemd")
        (mkdir-p "/var/log/journal")
        (execl #$(file-append systemd "/lib/systemd/systemd") "systemd"))))

(define (systemd-activation config)
  "Return the activation gexp for CONFIG."
  (let* ((systemd (systemd-configuration-package config))
         (units (systemd-configuration-upstream-units config)))
    #~(begin
        (rmdir "/etc/systemd/system")
        (mkdir-p "/etc/systemd/system")
        (map
         (lambda (x) (copy-file (string-append #$systemd "/lib/systemd/system/" x )
                                (string-append "/etc/systemd/system/" x)))
         (list #$@units))
        ;; (execl #$(file-append systemd "/bin/systemctl") "systemctl"
        ;;        "daemon-reload")
        )))

(define systemd-root-service-type
  (service-type
   (name 'systemd-root)
   (compose concatenate)
   (extend (lambda (config extra-services)
             (systemd-configuration
              (inherit config)
              (services (append (systemd-configuration-services config)
                                extra-services)))))
   (extensions (list (service-extension boot-service-type
                                        systemd-boot-gexp)
                     (service-extension dbus-root-service-type
                                        (const (list systemd)))
                     (service-extension profile-service-type
                                        (lambda (c) (list autofs
                                                          (systemd-configuration-package c))))
                     (service-extension
                      special-files-service-type
                      (lambda (config)
                        (let ((systemd (systemd-configuration-package config)))
                          `(("/lib/systemd" ,(file-append dbus/systemd
                                                          "/lib/systemd"))
                            ("/lib/tmpfiles.d" ,(file-append dbus/systemd
                                                             "/lib/tmpfiles.d"))))))
                     ;; (service-extension
                     ;;  etc-service-type
                     ;;  (lambda (config)
                     ;;    (let ((systemd (systemd-configuration-package config)))
                     ;;      (list `("systemd" ,(file-append dbus/systemd
                     ;;                                      "/lib/systemd"))
                     ;;            `("tmpfiles.d" ,(file-append dbus/systemd
                     ;;                                         "/lib/tmpfiles.d"))
                     ;;            ;; `("dbus-1" ,(file-append systemd "/etc/dbus-1"))
                     ;;            ))))
                     (service-extension activation-service-type
                                        systemd-activation)
                     ))
   (default-value (systemd-configuration))
   (description
    "Run the systemd as PID 1.")))

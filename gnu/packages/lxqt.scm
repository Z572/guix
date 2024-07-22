;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2015, 2022 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2016 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2016, 2023 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2017 Nikita <nikita@n0.is>
;;; Copyright © 2018, 2019 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018, 2019 Meiyo Peng <meiyo@riseup.net>
;;; Copyright © 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2019, 2020 Reza Alizadeh Majd <r.majd@pantherx.org>
;;; Copyright © 2020 Fakhri Sajadi <f.sajadi@pantherx.org>
;;; Copyright © 2020 André Batista <nandre@riseup.net>
;;; Copyright © 2021, 2022 Brendan Tildesley <mail@brendan.scot>
;;; Copyright © 2024 Zheng Junjie <873216071@qq.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages lxqt)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages compton)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages lxde)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages openbox)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))


;; Third party libraries

(define-public libstatgrab
  (package
    (name "libstatgrab")
    (version "0.92.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ftp.i-scream.org/pub/i-scream/libstatgrab/"
                           name "-" version ".tar.gz"))
       (sha256
        (base32 "04bcbln3qlilxsyh5hrwdrv7x4pfv2lkwdwa98bxfismd15am22n"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--enable-tests"
                           "--disable-static")))
    (native-inputs
     ;; For testing.
     (list perl))
    (home-page "https://www.i-scream.org/libstatgrab/")
    (synopsis "Provides access to statistics about the system")
    (description "libstatgrab is a library that provides cross platform access
to statistics about the system on which it's run.")
    ;; Libraries are under LGPL2.1+, and programs under GPLv2+.
    (license license:gpl2+)))


;; Base

(define-public lxqt-build-tools
  (package
    (name "lxqt-build-tools")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-build-tools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0srhr4j133vxy9zdm8sfqww4kz6bbncr0zqpwjqp4rd4frj1whjv"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                       ; no tests
      #:modules `((ice-9 regex)
                  (guix build cmake-build-system)
                  (guix build utils))
      ;; In phases and configure-flags: Set LXQT_TRANSLATIONS_DIR,
      ;; LXQT_DATA_DIR, etc. to relative paths, so that packages using
      ;; LXQtConfigVars.cmake from lxqt-build-tools will install translations
      ;; and data files into their outputs, remove the need to patch their
      ;; cmake files.
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-LXQtConfigVars.cmake
            (lambda _
              (substitute* (string-append #$output
                                          "/share/cmake/lxqt2-build-tools"
                                          "/modules/LXQtConfigVars.cmake")
                (((regexp-quote (string-append #$output "/"))) "")))))
      #:configure-flags
      #~(list "-DLXQT_ETC_XDG_DIR=etc/xdg")))
    (native-inputs
     (list pkg-config glib))
    (inputs
     (list qtbase))
    (propagated-inputs
     ;; Dependent projects require Perl via the CMake files.
     (list perl))
    (synopsis "LXQt Build tools")
    (description
     "Lxqt-build-tools is providing several tools needed to build LXQt
itself as well as other components maintained by the LXQt project.")
    (home-page "https://lxqt-project.org")
    (license license:lgpl2.1+)))

(define-public libqtxdg
  (package
    (name "libqtxdg")
    (version "4.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/libqtxdg")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19iz06zjy5gf41cf5iagz14r7jgm3m1mvbz1hicixfqq13mqws2l"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:qtbase qtbase
      #:configure-flags
      #~(list "-DBUILD_TESTS=ON"
              "-DQTXDGX_ICONENGINEPLUGIN_INSTALL_PATH=lib/qt6/plugins/iconengines")))
    (propagated-inputs
     ;; required by Qt6XdgIconLoader.pc
     (list glib qtsvg))
    (native-inputs
     (list lxqt-build-tools pkg-config))
    (home-page "https://github.com/lxqt/libqtxdg")
    (synopsis "Qt implementation of freedesktop.org xdg specifications")
    (description "Libqtxdg implements the freedesktop.org xdg specifications
in Qt.")
    (license license:lgpl2.1+)))

(define-public qtxdg-tools
  (package
    (name "qtxdg-tools")
    (version "4.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qtxdg-tools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x17kv5msz35ic2jv06ly7595xfd2k1z7q5pvkvq9nmadwf4bnn3"))))
    (build-system qt-build-system)
    (arguments (list
                #:qtbase qtbase
                #:tests? #f))          ; no tests
    (propagated-inputs (list libqtxdg))
    (native-inputs (list lxqt-build-tools))
    (home-page "https://github.com/lxqt/qtxdg-tools")
    (synopsis "User tools for libqtxdg")
    (description "This package contains a CLI MIME tool, @command{qtxdg-mat},
for handling file associations and opening files with their default
applications.")
    (license license:lgpl2.1+)))

(define-public lxqt-menu-data
  (package
    (name "lxqt-menu-data")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-menu-data")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1m9krvybzk5v4f6vawqzgicq3sqc633ikzcp505392252zgkdmh8"))))
    (build-system cmake-build-system)
    (inputs
     (list qtbase))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))
    (home-page "https://lxqt-project.org")
    (synopsis "Menu files for LXQt Panel, Configuration Center and
PCManFM-Qt/libfm-qt")
    (description
     "This package provides menu files for LXQt Panel, Configuration Center and
PCManFM-Qt/libfm-qt.")
    (license license:gpl2+)))

(define-public liblxqt
  (package
    (name "liblxqt")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/liblxqt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jjp5ynhnw4d97kjfmqijq4xlncnhcbzddi5nfarla1aar9hk9wp"))))
    (build-system qt-build-system)
    (arguments
     (list #:qtbase qtbase
           #:tests? #f                      ; no tests
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-source
                 (lambda _
                   (substitute* "CMakeLists.txt"
                     (("DESTINATION \"\\$\\{POLKITQT-1_POLICY_FILES_INSTALL_DIR\\}")
                      "DESTINATION \"share/polkit-1/actions")))))))
    (inputs
     (list kwindowsystem
           libqtxdg
           libxscrnsaver
           polkit-qt6
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (home-page "https://lxqt-project.org")
    (synopsis "Core utility library for all LXQt components")
    (description "liblxqt provides the basic libraries shared by the
components of the LXQt desktop environment.")
    (license license:lgpl2.1+)))

(define-public libsysstat
  (package
    (name "libsysstat")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/libsysstat")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cxfpchqwphqqys3z5i3snxg9djj3gqvp03y9mhcpcnkgdg21p0b"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))          ; no tests
    (inputs
     (list qtbase))
    (native-inputs
     (list lxqt-build-tools))
    (home-page "https://lxqt-project.org")
    (synopsis "Library used to query system info and statistics")
    (description "libsysstat is a library to query system information like CPU
and memory usage or network traffic.")
    (license license:lgpl2.1+)))


;; Core

(define-public lxqt-about
  (package
    (name "lxqt-about")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-about")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q18ib3xd48wxyblpb0l220ddq08y93vl801zfpbsrfy6ykbiq7l"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           qtbase
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     (list #:tests? #f                      ; no tests
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'build 'setenv
                 (lambda _
                   (setenv "QT_RCC_SOURCE_DATE_OVERRIDE" "1"))))))
    (home-page "https://lxqt-project.org")
    (synopsis "Provides information about LXQt and the system")
    (description "lxqt-about is a dialogue window providing information about
LXQt and the system it's running on.")
    (license license:lgpl2.1+)))

(define-public lxqt-admin
  (package
    (name "lxqt-admin")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-admin")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "180yn1yh0hbrz26wbvn3lgvm1hsnrxb1xcyphszfk4ahkzv0ywpg"))))
    (build-system qt-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           polkit-qt6
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     (list #:tests? #f                      ; no tests
           #:qtbase qtbase
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-source
                 (lambda _
                   (substitute* '("lxqt-admin-user/CMakeLists.txt"
                                  "lxqt-admin-time/CMakeLists.txt")
                     (("DESTINATION \"\\$\\{POLKITQT-1_POLICY_FILES_INSTALL_DIR\\}")
                      "DESTINATION \"share/polkit-1/actions")))))))
    (home-page "https://lxqt-project.org")
    (synopsis "LXQt system administration tool")
    (description "lxqt-admin is providing two GUI tools to adjust settings of
the operating system LXQt is running on.")
    (license license:lgpl2.1+)))

(define-public lxqt-config
  (package
    (name "lxqt-config")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-config")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04krha0iyys048bjhamdg3z894pxjjrc47yh8pjsw5jhppnpi6iw"))))
    (build-system cmake-build-system)
    (inputs
     (list eudev
           kwindowsystem
           lxqt-menu-data
           liblxqt
           libqtxdg
           libxcursor
           libxi
           qtbase
           qtsvg
           solid
           xf86-input-libinput
           xkeyboard-config
           zlib))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    ;; XXX: This is a workaround so libkscreen can find the backends as we
    ;; dont have a way specify them. We may want to  patch like Nix does.
    (propagated-inputs
     (list libkscreen))
    (arguments
     (list #:tests? #f                      ; no tests
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'set-xkeyboard-config-file-name
                 (lambda* (#:key inputs #:allow-other-keys)
                   ;; Set the file name to xkeyboard-config.
                   (let ((xkb (assoc-ref inputs "xkeyboard-config")))
                     (substitute* "lxqt-config-input/keyboardlayoutconfig.h"
                       (("/usr/share/X11/xkb/rules/base.lst")
                        (string-append xkb "/share/X11/xkb/rules/base.lst")))))))))
    (home-page "https://lxqt-project.org")
    (synopsis "Tools to configure LXQt and the underlying operating system")
    (description "lxqt-config is providing several tools involved in the
configuration of both LXQt and the underlying operating system.")
    (license license:lgpl2.1+)))

(define-public lxqt-globalkeys
  (package
    (name "lxqt-globalkeys")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-globalkeys")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1drcclszadm6cibvbcj3ck2l057g4xr9ddxfwpml5x1azbnk16pm"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           qtbase
           qtsvg))
    (native-inputs
     (list pkg-config qttools lxqt-build-tools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Daemon used to register global keyboard shortcuts")
    (description "lxqt-globalkeys is providing tools to set global keyboard
shortcuts in LXQt sessions, that is shortcuts which apply to the LXQt session
as a whole and are not limited to distinct applications.")
    (license license:lgpl2.1+)))

(define-public lxqt-notificationd
  (package
    (name "lxqt-notificationd")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-notificationd")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01pdssf17rpbad16nsaa72dq5izwiwwxffgi4r131vjbqrzw5bhs"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           layer-shell-qt
           liblxqt
           libqtxdg
           qtbase
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments '(#:tests? #f))          ; no test target
    (home-page "https://lxqt-project.org")
    (synopsis "The LXQt notification daemon")
    (description "lxqt-notificationd is LXQt's implementation of a daemon
according to the Desktop Notifications Specification.")
    (license license:lgpl2.1+)))

(define-public lxqt-openssh-askpass
  (package
    (name "lxqt-openssh-askpass")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-openssh-askpass")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "196q7mvn709sqardjhyv3xm19j2q9rjlqc8vnm4x0wrggbl0d7d7"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           qtbase
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "GUI to query passwords on behalf of SSH agents")
    (description "lxqt-openssh-askpass is a GUI to query credentials on behalf
of other programs.")
    (license license:lgpl2.1+)))

(define-public libdbusmenu-lxqt
  (package
    (name "libdbusmenu-lxqt")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/libdbusmenu-lxqt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0j9nci0h80pdmbn5sp1mn7naqdi8srrsikns3ix642ldmm9jy1kz"))))
    (build-system cmake-build-system)
    (arguments
     ;; XXX: Tests require a dbus session and some icons.
     '(#:tests? #f))
    (native-inputs
     (list doxygen))
    (inputs
     (list qtbase))
    (home-page "https://github.com/lxqt/libdbusmenu-lxqt")
    (synopsis "Qt6 implementation of the DBusMenu spec")
    (description "This library provides a Qt6 implementation of the DBusMenu
protocol.  The DBusMenu protocol makes it possible for applications to export
and import their menus over DBus.")
    (license license:lgpl2.1+)))

(define-public lxqt-panel
  (package
    (name "lxqt-panel")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-panel")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04w2da0z8slhl6qrqz4pqkrwwai0j80f2s93ixzi5fnpykh1ygzs"))))
    (build-system cmake-build-system)
    (inputs
     (list alsa-lib
           kguiaddons
           libdbusmenu-lxqt
           layer-shell-qt
           liblxqt
           libqtxdg
           libstatgrab
           libsysstat
           libxcomposite
           libxdamage
           libxkbcommon
           libxrender
           libxtst
           `(,lm-sensors "lib")
           lxqt-globalkeys
           pcre
           pulseaudio
           qtbase
           qtsvg
           solid
           xcb-util
           xcb-util-image
           xkeyboard-config))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (propagated-inputs
     ;; Propagating KWINDOWSYSTEM so that the list of opened applications
     ;; shows up in lxqt-panel's taskbar plugin.
     (list kwindowsystem
           lxqt-menu-data))
    (arguments
     (list #:tests? #f                      ; no tests
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'set-xkeyboard-config-file-path
                 (lambda* (#:key inputs #:allow-other-keys)
                   ;; Set the path to xkeyboard-config.
                   (let ((xkb (assoc-ref inputs "xkeyboard-config")))
                     (substitute* "plugin-kbindicator/src/x11/kbdlayout.cpp"
                       (("/usr/share/X11/xkb/rules/evdev.xml")
                        (string-append xkb "/share/X11/xkb/rules/evdev.xml")))))))))
    (home-page "https://lxqt-project.org")
    (synopsis "The LXQt desktop panel")
    (description "lxqt-panel represents the taskbar of LXQt.")
    (license license:lgpl2.1+)))

(define-public lxqt-policykit
  (package
    (name "lxqt-policykit")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-policykit")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1p0w7f6j6072gglfa6jb0wpg4357670vwflyqsj634v2bkm082gm"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           pcre
           polkit-qt6
           qtbase
           qtsvg))
    (native-inputs
     (list pkg-config polkit lxqt-build-tools qttools))
    (arguments '(#:tests? #f))          ; no test target
    (home-page "https://lxqt-project.org")
    (synopsis "The LXQt PolicyKit agent")
    (description "lxqt-policykit is the polkit authentication agent of
LXQt.")
    (license license:lgpl2.1+)))

(define-public lxqt-powermanagement
  (package
    (name "lxqt-powermanagement")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-powermanagement")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15hjf127v1zv76bgnn8pq3bx4g12xhg78ad20fb52y7rslijd6cr"))))
    (build-system cmake-build-system)
    (inputs
     (list kidletime
           kwindowsystem
           liblxqt
           libqtxdg
           lxqt-globalkeys
           qtbase
           qtsvg
           solid))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Power management module for LXQt")
    (description "lxqt-powermanagement is providing tools to monitor power
management events and optionally trigger actions like e. g. shut down a system
when laptop batteries are low on power.")
    (license license:lgpl2.1+)))

(define-public lxqt-qtplugin
  (package
    (name "lxqt-qtplugin")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-qtplugin")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bya80k88qmv625afnskdgi5dz9pkgfpsnb05makk9psx4lmdzb5"))))
    (build-system cmake-build-system)
    (inputs
     (list libdbusmenu-lxqt
           libfm-qt
           libqtxdg
           qtbase
           qtsvg))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     (list #:tests? #f                      ; no tests
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-source
                 (lambda _
                   (substitute* '("src/CMakeLists.txt")
                     (("DESTINATION \"\\$\\{QT_PLUGINS_DIR\\}")
                      "DESTINATION \"lib/qt6/plugins")))))))
    (home-page "https://lxqt-project.org")
    (synopsis "LXQt Qt platform integration plugin")
    (description "lxqt-qtplugin is providing a library libqtlxqt to integrate
Qt with LXQt.")
    (license license:lgpl2.1+)))

(define-public lxqt-runner
  (package
    (name "lxqt-runner")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-runner")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h8x8y067jlvqvx8l4znljdpd42qn2mlx0lhsgqnxywfygirs4pc"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           layer-shell-qt
           liblxqt
           libqtxdg
           lxqt-globalkeys
           muparser
           pcre
           qtbase
           qtsvg))
    (native-inputs
     (list pkg-config qttools lxqt-build-tools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Tool used to launch programs quickly by typing their names")
    (description "lxqt-runner provides a GUI that comes up on the desktop and
allows for launching applications or shutting down the system.")
    (license license:lgpl2.1+)))

(define-public lxqt-session
  (package
    (name "lxqt-session")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-session")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y8qxddxfwfj0m5yrafww6hkc549k22dd672pyhkbmkay0mhvvq6"))))
    (build-system cmake-build-system)
    (inputs
     (list eudev
           kwindowsystem
           layer-shell-qt
           liblxqt
           qtxdg-tools
           procps
           qtbase
           qtsvg
           xdg-user-dirs))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-source
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (substitute* '("xsession/lxqt.desktop.in")
                 (("Exec=startlxqt") (string-append "Exec=" out "/bin/startlxqt"))
                 (("TryExec=lxqt-session") (string-append "TryExec=" out "/bin/startlxqt"))))))

         (add-after 'unpack 'patch-openbox-permission
           (lambda _
             (substitute* "startlxqt.in"
               ;; Don't add 'etc/xdg' to XDG_CONFIG_DIRS, and 'share' to XDG_DATA_DIRS.
               (("! contains .*;") "false;")
               ;; Add write permission to lxqt-rc.xml file which is stored as
               ;; read-only in store.
               (("cp \"\\$LXQT_DEFAULT_OPENBOX_CONFIG\" \"\\$XDG_CONFIG_HOME/openbox\"")
                (string-append "cp \"$LXQT_DEFAULT_OPENBOX_CONFIG\" \"$XDG_CONFIG_HOME/openbox\"\n"
                               "        # fix openbox permission issue\n"
                               "        chmod u+w  \"$XDG_CONFIG_HOME/openbox\"/*"))))))))
    (native-search-paths
     (list (search-path-specification
            ;; LXQt applications install their default config files into
            ;; 'share/lxqt' and search them from XDG_CONFIG_DIRS/lxqt.
            (variable "XDG_CONFIG_DIRS")
            (files '("share")))))
    (home-page "https://lxqt-project.org")
    (synopsis "Session manager for LXQt")
    (description "lxqt-session provides the standard session manager
for the LXQt desktop environment.")
    (license license:lgpl2.1+)))

(define-public lxqt-sudo
  (package
    (name "lxqt-sudo")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-sudo")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rm68vm50lf1h71f8vbnnzayb0jqnc85v2fsl82ibm53c8jgjzvd"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           liblxqt
           libqtxdg
           qtbase
           qtsvg
           sudo))
    (native-inputs
     (list pkg-config qttools lxqt-build-tools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "GUI frontend for sudo/su")
    (description "lxqt-sudo is a graphical front-end of commands sudo and su
respectively.  As such it enables regular users to launch applications with
permissions of other users including root.")
    (license license:lgpl2.1+)))

(define-public lxqt-themes
  (package
    (name "lxqt-themes")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-themes")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aml3dandyxb650lqq5dlyvc11095l69jin54rdfyr72z7dll1wr"))))
    (build-system cmake-build-system)
    (native-inputs
     (list lxqt-build-tools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Themes, graphics and icons for LXQt")
    (description "This package comprises a number of graphic files and themes
for LXQt.")
    ;; The whole package is released under LGPL 2.1+, while the LXQt logo is
    ;; licensed under CC-BY-SA 3.0.
    (license license:lgpl2.1+)))


;; File Manager

(define-public libfm-qt
  (package
    (name "libfm-qt")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/libfm-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0v69vry95637rgygqwvfj4qj2x6796jlman12s9ajn42b0c3273x"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f))                    ; no tests
    (inputs
     (list glib
           libexif
           libfm
           libxcb
           menu-cache
           lxqt-menu-data
           pcre
           qtbase))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (home-page "https://lxqt-project.org")
    (synopsis "Qt binding for libfm")
    (description "libfm-qt is the Qt port of libfm, a library providing
components to build desktop file managers which belongs to LXDE.")
    (license license:lgpl2.1+)))

(define-public pcmanfm-qt
  (package
    (name "pcmanfm-qt")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/pcmanfm-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yi6j307mgmqlsg8rmravj5fdqjdbj5dsj0ms64sv8vkwizz64x9"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                       ; no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'patch-settings.conf.in
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((wallpaper
                     (search-input-file inputs
                                        "share/lxqt/wallpapers/waves-logo.png")))
                (substitute* "config/pcmanfm-qt/lxqt/settings.conf.in"
                  (("Wallpaper=.*")
                   (string-append "Wallpaper=" wallpaper "\n")))))))))
    (inputs
     (list libfm-qt qtbase lxqt-themes layer-shell-qt))
    (native-inputs
     (list pkg-config qttools lxqt-build-tools))
    (home-page "https://lxqt-project.org")
    (synopsis "File manager and desktop icon manager")
    (description "PCManFM-Qt is the Qt port of PCManFM, the file manager of
LXDE.")
    (license license:gpl2+)))


;; Extra

(define-public compton-conf
  (package
    (name "compton-conf")
    (version "0.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/compton-conf")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04w2da0z8slhl6qrqz4pqkrwwai0j80f2s93ixzi5fnpykh1ygzs"))))
    (build-system cmake-build-system)
    (inputs
     (list libconfig qtbase))
    (native-inputs
     (list lxqt-build-tools pkg-config qttools))
    (arguments '(#:tests? #f))          ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "GUI configuration tool for compton X composite manager")
    (description "@code{compton-conf} is a configuration tool for X composite
manager Compton.")
    (license license:lgpl2.1+)))

(define-public lximage-qt
  (package
    (name "lximage-qt")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lximage-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fk94sgcwq4vyap7r3cp6379f7y9f2bi332z06h87d2fkbd6jq1g"))))
    (build-system cmake-build-system)
    (inputs
     (list libexif libfm-qt qtbase qtsvg))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "The image viewer and screenshot tool for lxqt")
    (description "LXImage-Qt is the Qt port of LXImage, a simple and fast
image viewer.")
    (license license:gpl2+)))

(define-public obconf-qt
  (package
    (name "obconf-qt")
    (version "0.16.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/obconf-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0aiszckd6zndfbc6g37cp4v9q12vqrj83bvfqx29dndcip41w554"))))
    (build-system cmake-build-system)
    (inputs
     (list imlib2
           libsm
           (librsvg-for-system)
           libxft
           libxml2
           openbox
           pango
           pcre
           qtbase))
    (native-inputs
     (list lxqt-build-tools pkg-config qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Openbox configuration tool")
    (description "ObConf-Qt is a Qt port of ObConf, a configuration editor for
window manager OpenBox.")
    (license license:gpl2+)))

(define-public pavucontrol-qt
  (package
    (name "pavucontrol-qt")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/pavucontrol-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r369xmgzl4r3m6xb394whszmkc07f8gn86ww8y98qw94zw7v2d6"))))
    (build-system cmake-build-system)
    (inputs
     (list glib pcre pulseaudio qtbase))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Pulseaudio mixer in Qt")
    (description "@code{pavucontrol-qt} is the Qt port of volume control
@code{pavucontrol} of sound server @code{PulseAudio}.")
    (license license:gpl2+)))

(define-public qps
  (package
    (name "qps")
    (version "2.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qps")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pcd6g80mq446aaymakgks1dii2p281wk2lxk2q9ijsk1z2fshr8"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem
           libxrender
           liblxqt
           libqtxdg
           qtbase))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Qt-based visual process status monitor")
    (description "@code{qps} is a monitor that displays the status of the
processes currently in existence, much like code{top} or code{ps}.")
    (license license:gpl2+)))

(define-public qtermwidget
  (package
    (name "qtermwidget")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qtermwidget")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0i8mdhzcf3al5a2s7yx4h981vv4lnmzxxlp8w5gzc8blan5w3ikb"))))
    (build-system cmake-build-system)
    (inputs
     (list qtbase utf8proc))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "The terminal widget for QTerminal")
    (description "QTermWidget is a terminal emulator widget for Qt 5.")
    (license license:gpl2+)))

(define-public qterminal
  (package
    (name "qterminal")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qterminal")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "179j3v11wz00dxaf9z50krfawyyd17x94w3rklja29kgalq9lddb"))))
    (build-system cmake-build-system)
    (inputs
     (list qtbase qtermwidget layer-shell-qt))
    (native-inputs
     (list lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))                      ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Lightweight Qt-based terminal emulator")
    (description "QTerminal is a lightweight Qt terminal emulator based on
QTermWidget.")
    (license license:gpl2+)))

(define-public screengrab
  (package
    (name "screengrab")
    (version "2.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/screengrab")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19pvk399rrf7nns77jfd874db76lxfkbwaj1z74r9z7jf0k9bghl"))))
    (build-system cmake-build-system)
    (inputs
     (list kwindowsystem libqtxdg qtbase qtsvg))
    (native-inputs
     (list pkg-config perl qttools))
    (arguments
     '(#:tests? #f))                    ; no tests
    (home-page "https://lxqt-project.org")
    (synopsis "Crossplatform tool for fast making screenshots")
    (description "ScreenGrab is a program for fast creating screenshots, and
easily publishing them on internet image hosting services.")
    (license license:gpl2+)))


(define-public lxqt-archiver
  (package
    (name "lxqt-archiver")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-archiver")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ziihf1jnmzd64nynsydmnqfv2fqbpysnv0fy1ajxz62hd576hmq"))))
    (build-system cmake-build-system)
    (inputs
     (list glib json-glib libfm-qt qtbase))
    (native-inputs
     (list pkg-config lxqt-build-tools qttools))
    (arguments
     '(#:tests? #f))
    (home-page "https://lxqt-project.org")
    (synopsis "Simple & lightweight desktop-agnostic Qt file archiver")
    (description
     "This package provides a Qt graphical interface to archiving programs
like @command{tar} and @command{zip}.")
    (license license:gpl2+)))

;; The LXQt Desktop Environment

(define-public lxqt
  (package
    (name "lxqt")
    (version (package-version liblxqt))
    (source #f)
    (build-system trivial-build-system)
    (arguments '(#:builder (begin (mkdir %output) #t)))
    (propagated-inputs
     (list ;; XDG
           desktop-file-utils
           hicolor-icon-theme
           xdg-user-dirs
           xdg-utils
           ;; Base
           ;; TODO: qtsvg-5 is needed for lxqt apps to display icons. Maybe it
           ;; should be added to their propagated-inputs?
           qtsvg-5
           ;; Core
           lxqt-about
           lxqt-admin
           lxqt-config
           lxqt-globalkeys
           lxqt-notificationd
           lxqt-openssh-askpass
           lxqt-panel
           lxqt-policykit
           lxqt-powermanagement
           lxqt-qtplugin
           lxqt-runner
           lxqt-session
           lxqt-sudo
           lxqt-themes
           pcmanfm-qt
           ;; Extra
           picom
           font-dejavu
           lximage-qt
           obconf-qt
           openbox
           breeze-icons       ; default by <lxqt-session>/share/lxqt/lxqt.conf
           pavucontrol-qt
           qps
           qterminal))
    (synopsis "The Lightweight Qt Desktop Environment")
    (description "LXQt is a lightweight Qt desktop environment.")
    (home-page "https://lxqt-project.org")
    (license license:gpl2+)))

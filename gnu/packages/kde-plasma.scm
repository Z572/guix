;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Thomas Danckaert <post@thomasdanckaert.be>
;;; Copyright © 2018 Meiyo Peng <meiyo.peng@gmail.com>
;;; Copyright © 2019 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2017, 2019, 2020 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2019 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2020 Zheng Junjie <873216071@qq.com>
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

(define-module (gnu packages kde-plasma)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (gnu packages)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages ibus))

(define-public breeze
  (package
    (name "breeze")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version "/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32
                "0dpk1w7zcafrzf46j060i1qb0fwqpsflkfzr6gcar81llmjnc4b1"))))
    (build-system qt-build-system)
    ;; TODO: Warning at /gnu/store/…-kpackage-5.34.0/…/KF5PackageMacros.cmake:
    ;;   warnings during generation of metainfo for org.kde.breezedark.desktop:
    ;;   Package type "Plasma/LookAndFeel" not found
    ;; TODO: Check whether is makes sence splitting into several outputs, like
    ;; Debian does:
    ;; - breeze-cursor-theme
    ;; - "out", "devel"
    ;; - kde-style-breeze - Widget style
    ;; - kde-style-breeze-qt4 - propably not useful
    ;; - kwin-style-breeze
    ;; - qml-module-qtquick-controls-styles-breeze - QtQuick style
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("kcmutils" ,kcmutils) ; optional
       ("kconfigwidgets" ,kconfigwidgets)
       ("kcoreaddons" ,kcoreaddons)
       ("kde-frameworkintegration" ,kde-frameworkintegration) ; optional
       ("kdecoration" ,kdecoration)
       ("kguiaddons" ,kguiaddons)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes) ; for optional kde-frameworkintegration
       ("kpackage" ,kpackage)
       ("kwayland" ,kwayland) ; optional
       ("kwindowsystem" ,kwindowsystem)
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative) ; optional
       ("qtx11extras" ,qtx11extras)))
    (home-page "https://invent.kde.org/plasma/breeze")
    (synopsis "Default KDE Plasma theme")
    (description "Artwork, styles and assets for the Breeze visual style for
the Plasma Desktop.  Breeze is the default theme for the KDE Plasma desktop.")
    (license license:gpl2+)))

(define-public plasma-wayland-protocols
  (package
    (name "plasma-wayland-protocols")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma-wayland-protocols/"
                                  "plasma-wayland-protocols-" version ".tar.xz"))

              (sha256
               (base32
                "0f0xllv092aliyngyi25hhm66q38jsrj36pa6ls1q5qms61k6jf5"))))
    (arguments
     `(;; no target
       #:tests? #f))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtbase" ,qtbase)))
    (build-system qt-build-system)
    (home-page "https://kde.org/plasma-desktop/")
    (synopsis "Plasma Specific Protocols for Wayland")
    (description "Plasma Specific Protocols for Wayland.")
    (license license:lgpl3)))

(define-public plasma-desktop
  (package
    (name "plasma-desktop")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/plasma-desktop-" version ".tar.xz"))

              (sha256
               (base32
                "17yz895jvnrhg0z25c994226m1420a44si1wiafaf3friw0hdcdf"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list "-DBUILD_TESTING=OFF")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-hwclock
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "kcms/dateandtime/helper.cpp"
               (("static const QString exePath.*;$")
                "")
               (("KStandardDirs::findExe\\(QStringLiteral\\(\"hwclock\"\\), exePath\\)")
                (string-append "QLatin1String(\"" (assoc-ref inputs "util-linux") "/sbin/hwclock" "\")")))))
         (add-after 'unpack 'fix-tzdir
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "kcms/dateandtime/helper.cpp"
               (("QString tz =.*;$")
                "QString tz = QString::fromLocal8Bit(qgetenv(\"TZDIR\")) + selectedzone;")
               ))))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtx11extras" ,qtx11extras)
       ("qtsvg" ,qtsvg)
       ("kauth" ,kauth)
       ("plasma-framework" ,plasma-framework)
       ("ki18n" ,ki18n)
       ("kcmutils" ,kcmutils)
       ("knewstuff" ,knewstuff)

       ("kdelibs4support" ,kdelibs4support)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("attica" ,attica)
       ("kwallet" ,kwallet)
       ("krunner" ,krunner)
       ("kglobalaccel" ,kglobalaccel)
       ("kdeclarative" ,kdeclarative)
       ("kdbusaddons" ,kdbusaddons)
       ("kactivities" ,kactivities)
       ("kactivities-stats" ,kactivities-stats)
       ("kconfig" ,kconfig)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kirigami" ,kirigami)
       ("qqc2-desktop-style" ,qqc2-desktop-style)
       ("plasma-workspace" ,plasma-workspace)
       ("kwin" ,kwin)
       ("kscreenlocker" ,kscreenlocker)
       ("libksysguard" ,libksysguard)
       ("xcb-util-image" ,xcb-util-image)
       ("xf86-input-evdev" ,xf86-input-evdev)
       ("xf86-input-synaptics" ,xf86-input-synaptics)
       ("xf86-input-libinput" ,xf86-input-libinput)
       ("xkeyboard-config" ,xkeyboard-config)
       ("breeze" ,breeze)
       ;;("scim" ,scim)
       ("ibus" ,ibus)
       ("glib" ,glib)
       ("freetype" ,freetype)
       ("libxkbcommon" ,libxkbcommon)
       ("phonon" ,phonon)
       ("libxkbfile" ,libxkbfile)
       ("udev" ,eudev)
       ("fontconfig" ,fontconfig)
       ("baloo" ,baloo)
       ("libxcb" ,libxcb)
       ("libxft" ,libxft)
       ("xcb-util-keysyms" ,xcb-util-keysyms)

       ("kded" ,kded)

       ("util-linux" ,util-linux)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public kwayland-server
  (package
    (name "kwayland-server")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kwayland-server-" version ".tar.xz"))
              (sha256
               (base32
                "06jlr24f3vhla8rjyygd7r51byksfv46apnh3bylslgxd2grrzah"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f ;; TODO: pass tests
       #:configure-flags
       (list "-DBUILD_TESTING=OFF" "-DBUILD_QCH=ON")
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'set-build-path
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (include (string-append out "/include")))
               (mkdir-p (string-append include "/KF5"))
               (symlink (string-append include "/KWaylandServer")
                        (string-append include "/KF5/KWaylandServer")))
             #t)))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)
       ("qttools" ,qttools)
       ("doxygen" ,doxygen)
       ;; test
       ;;("weston" ,weston)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtwayland" ,qtwayland)
       ("wayland" ,wayland)
       ("wayland-protocols" ,wayland-protocols)
       ("plasma-wayland-protocols" ,plasma-wayland-protocols)
       ("kwayland" ,kwayland)))
    (home-page "https://invent.kde.org/plasma/kwayland-server")
    (synopsis "Wayland Server Components built on KDE Frameworks" )
    (description "KWayland is a Qt-style API to interact with the wayland-client
and wayland-server API.")
    (license license:lgpl2.0+)))

(define-public kwin
  (package
    (name "kwin")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kwin-" version ".tar.xz"))
              (sha256
               (base32 "0fwh6khbn87i6sx2krq0mlakxhvcy2hjzqzlp2yc0c9xfxxs7brn"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list "-DCMAKE_SKIP_BUILD_RPATH=OFF")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-symlink
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "plugins/kdecorations/aurorae/src/aurorae.cpp"
               (("QDirIterator::Subdirectories" all)
                (string-append all "| QDirIterator::FollowSymlinks")))
             #t)))))
    (native-inputs
     `(("kdoctools" ,kdoctools)
       ("qttools" ,qttools)
       ("pkg-config" ,pkg-config)
       ("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtquickcontrols" ,qtquickcontrols)
       ("libcap" ,libcap)
       ("kwayland-server" ,kwayland-server)
       ("plasma-wayland-protocols" ,plasma-wayland-protocols)
       ("breeze-icons" ,breeze-icons)
       ("xorg-server-xwayland" ,xorg-server-xwayland)
       ("qtmultimedia" ,qtmultimedia)
       ("breeze" ,breeze)
       ("freetype" ,freetype)
       ("libxkbcommon" ,libxkbcommon)
       ("libice" ,libice)
       ("libsm" ,libsm)
       ("fontconfig" ,fontconfig)
       ("qtbase" ,qtbase)
       ("qtscript" ,qtscript)
       ("qtdeclarative" ,qtdeclarative)
       ("qtsensors" ,qtsensors)
       ("qtx11extras" ,qtx11extras)
       ("kconfig" ,kconfig)
       ("xcb-util" ,xcb-util)
       ("kcoreaddons" ,kcoreaddons)
       ("kcrash" ,kcrash)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("kidletime" ,kidletime)
       ("kinit" ,kinit)
       ("knotifyconfig" ,knotifyconfig)
       ("plasma-framework" ,plasma-framework)
       ("kcompletion" ,kcompletion)
       ("ktexteditor" ,ktexteditor)
       ("kxmlgui" ,kxmlgui)
       ("kio" ,kio)
       ("libinput" ,libinput)
       ("knewstuff" ,knewstuff)
       ("kdecoration" ,kdecoration)
       ("kscreenlocker" ,kscreenlocker)
       ("kactivities" ,kactivities)
       ("xcb-util-wm" ,xcb-util-wm)
       ("xcb-util-cursor" ,xcb-util-cursor)
       ("xcb-util-keysyms" ,xcb-util-keysyms)
       ("kirigami" ,kirigami)
       ("libepoxy" ,libepoxy)
       ("wayland" ,wayland)
       ("kcmutils" ,kcmutils)
       ("kdeclarative" ,kdeclarative)
       ("knotifications" ,knotifications)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kpackage" ,kpackage)
       ("kwayland" ,kwayland)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)))
    (home-page "https://invent.kde.org/plasma/kwin")
    (synopsis "KDE Window Manager")
    (description "KWin is an easy to use, but flexible, composited Window
Manager for Xorg windowing systems (Wayland, X11) on Linux.  Its primary usage
is in conjunction with a Desktop Shell (e.g. KDE Plasma Desktop).  KWin is
designed to go out of the way; users should not notice that they use a window
manager at all.  Nevertheless KWin provides a steep learning curve for advanced
features, which are available, if they do not conflict with the primary mission.
KWin does not have a dedicated targeted user group, but follows the targeted
user group of the Desktop Shell using KWin as it's window manager.")
    (license license:gpl2+)))

(define-public bluedevil
  (package
    (name "bluedevil")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/bluedevil-" version ".tar.xz"))
              (sha256
               (base32
                "0rlsr2gfgi4m3rnlf02mn1dd91krxfnb4sz9a7a8ziq1xsxfyl2k"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("shared-mime-info" ,shared-mime-info)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("kcoreaddons" ,kcoreaddons)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kdbusaddons" ,kdbusaddons)
       ("knotifications" ,knotifications)
       ("kwindowsystem" ,kwindowsystem)
       ("kiconthemes" ,kiconthemes)
       ("plasma-framework" ,plasma-framework)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("bluez-qt" ,bluez-qt)
       ("kded" ,kded)))
    (home-page "https://invent.kde.org/plasma/bluedevil")
    (synopsis "Bluedevil adds Bluetooth capabilities to KDE Plasma")
    (description "Bluedevil adds Bluetooth capabilities to KDE Plasma.")
    (license ;; COPYING  ;; COPYING.LIB
     (list license:gpl2+ license:lgpl2.1+))))

(define-public kactivitymanagerd
  (package
    (name "kactivitymanagerd")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kactivitymanagerd-" version ".tar.xz"))

              (sha256
               (base32
                "1ivsa275dcmlizn6nkb4c9f0hlvk0lpzma885vk7whjxb2s2xwr4"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("boost" ,boost)))
    (inputs
     `(("qtbase" ,qtbase)
       ("kdbusaddons" ,kdbusaddons)
       ("ki18n" ,ki18n)
       ("kglobalaccel" ,kglobalaccel)
       ("kcrash" ,kcrash)
       ("kio" ,kio)))
    (home-page "https://invent.kde.org/plasma/kactivitymanagerd")
    (synopsis "Core components for the KDE Activity concept")
    (description "System service to manage user's activities and track the usage
patterns.")
    (license (list license:gpl2 license:gpl3))))

(define-public drkonqi
  (package
    (name "drkonqi")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/drkonqi-" version ".tar.xz"))

              (sha256
               (base32
                "1lgsdv7pyqj79rkpg13b90bsr9kzgs1dhn9kpkwfi79gxp22d9mi"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f  ;; need network
       #:configure-flags
       (list "-DBUILD_TESTING=OFF")))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtbase" ,qtbase)
       ("ki18n" ,ki18n)
       ("kcoreaddons" ,kcoreaddons)
       ("kservice" ,kservice)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kjobwidgets" ,kjobwidgets)
       ("kio" ,kio)
       ("kcrash" ,kcrash)
       ("kcompletion" ,kcompletion)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwallet" ,kwallet)
       ("knotifications" ,knotifications)
       ("kidletime" ,kidletime)
       ("kwindowsystem" ,kwindowsystem)))
    (home-page "https://invent.kde.org/plasma/drkonqi")
    (synopsis "Crash handler for KDE software")
    (description "Crash handler for KDE software.")
    (license (list license:lgpl2.1+ license:gpl2+))))

(define-public milou
  (package
    (name "milou")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/milou-" version ".tar.xz"))

              (sha256
               (base32
                "03h4m7wfl7ffsklngx5fwxd4mj082df9j0m8mlz6z3x98v3fbipd"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("ki18n" ,ki18n)
       ("kdeclarative" ,kdeclarative)
       ("kitemmodels" ,kitemmodels)
       ("qtdeclarative" ,qtdeclarative)
       ("krunner" ,krunner)
       ("plasma-framework" ,plasma-framework)
       ("kwindowsystem" ,kwindowsystem)))
    (home-page "https://invent.kde.org/plasma/milou")
    (synopsis "Dedicated search application built on top of Baloo")
    (description "A dedicated search application built on top of Baloo.")
    (license license:lgpl2.1+)))

(define-public khotkeys
  (package
    (name "khotkeys")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/khotkeys-" version ".tar.xz"))

              (sha256
               (base32
                "0rp7h7nqy5797rr5rrlm070nvjif7cmzwxn20p1k3p7cpgrzs0lg"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("kxmlgui" ,kxmlgui)
       ("kdelibs4support" ,kdelibs4support)
       ("kdbusaddons" ,kdbusaddons)
       ("kcmutils" ,kcmutils)
       ("plasma-framework" ,plasma-framework)
       ("plasma-workspace" ,plasma-workspace)
       ("qtx11extras" ,qtx11extras)
       ("kinit" ,kinit)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public kde-cli-tools
  (package
    (name "kde-cli-tools")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kde-cli-tools-" version ".tar.xz"))

              (sha256
               (base32
                "1a5ab9z082jw21zd22navd7pzx3z3n26wykq9cl4w7qi2wd1v673"))))
    (build-system qt-build-system)
    (native-inputs
     `(("kdoctools" ,kdoctools)
       ("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("kactivities" ,kactivities)
       ("qtbase" ,qtbase)
       ("ki18n" ,ki18n)
       ("kwindowsystem" ,kwindowsystem)
       ("kiconthemes" ,kiconthemes)
       ("qtdeclarative" ,qtdeclarative)
       ("kdeclarative" ,kdeclarative)
       ("plasma-workspace" ,plasma-workspace)
       ("kinit" ,kinit)
       ("kio" ,kio)
       ("qtsvg" ,qtsvg)
       ("kcmutils" ,kcmutils)
       ("kdesu" ,kdesu)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-test
           (lambda _
             (substitute* "processcore/CMakeLists.txt"
               (("KAUTH_HELPER_INSTALL_DIR") "KDE_INSTALL_LIBEXECDIR")))))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public plasma-workspace-wallpapers
  (package
    (name "plasma-workspace-wallpapers")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/plasma-workspace-wallpapers-" version ".tar.xz"))

              (sha256
               (base32
                "0vadm2ii0y1nhcckwca6aa80i857p01h71nhkril96bsp7bkpnpq"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtbase" ,qtbase)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(use-modules (gnu packages cups))
(define-public xdg-desktop-portal-kde
  (package
    (name "xdg-desktop-portal-kde")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/xdg-desktop-portal-kde-" version ".tar.xz"))

              (sha256
               (base32
                "0932jzrvcysp1kbi91sxmhffa7bd05zfrya33gibh603i9q54x40"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtbase" ,qtbase)
       ("libepoxy" ,libepoxy)
       ("kirigami" ,kirigami)
       ("qtdeclarative" ,qtdeclarative) ;; qtquick
       ("pipewire" ,pipewire)
       ("kcoreaddons" ,kcoreaddons)
       ("kconfig" ,kconfig)
       ("ki18n" ,ki18n)
       ("kdeclarative" ,kdeclarative)
       ("kio" ,kio)
       ("knotifications" ,knotifications)
       ("plasma-framework" ,plasma-framework)
       ("kwayland" ,kwayland)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)

       ("cups-minimal" ,cups-minimal)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public plasma-workspace
  (package
    (name "plasma-workspace")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/plasma-workspace-" version ".tar.xz"))

              (sha256
               (base32
                "0m13p64l203lr4mhjmhhldg2j4k0r3i1klvhdas4spvlpqrj1s0l"))
              (patches (search-patches "plasma-workspace-startkde.patch"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f ;; TODO: pass tests
       #:configure-flags
       (list "-DBUILD_TESTING=OFF"
             "-DINSTALL_SDDM_THEME=OFF"
             ;; (string-append "-DKDE_INSTALL_DATADIR="
             ;;                (assoc-ref %outputs "out") "/share")
             )
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-paths
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Set patched-in values:
             (substitute* (list "startkde/startplasma-waylandsession.cpp"
                                "startkde/startplasma-x11.cpp"
                                "startkde/startplasma.cpp")
               (("GUIX_XMESSAGE") (string-append (assoc-ref inputs "xmessage") "/bin/xmessage"))
               (("GUIX_XRDB") (string-append (assoc-ref inputs "xrdb") "/bin/xrdb"))
               (("GUIX_XSETROOT") (string-append (assoc-ref inputs "xsetroot") "/bin/xsetroot"))
               (("GUIX_XPROP") (string-append (assoc-ref inputs "xprop") "/bin/xprop"))
               (("GUIX_DBUS_UPDATE_ACTIVATION_ENVIRONMENT") (string-append (assoc-ref inputs "dbus") "/bin/dbus-update-activation-environment"))
               (("GUIX_START_KDEINIT_WAPPER") (string-append (assoc-ref inputs "kinit") "/lib/libexec/kf5/start_kdeinit_wrapper"))
               (("GUIX_KDEINIT5_SHUTDOWN") (string-append (assoc-ref inputs "kinit") "/bin/kdeinit5_shutdown")))
             #t)))))
    (native-inputs
     `(("kdoctools" ,kdoctools)
       ("pkg-config" ,pkg-config)
       ("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("dbus" ,dbus)
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("krunner" ,krunner)
       ("breeze-icons" ,breeze-icons)
       ("libxtst" ,libxtst)
       ("libxrender" ,libxrender)
       ("kded" ,kded)
       ("prison" ,prison)
       ("kdesu" ,kdesu)
       ("kuserfeedback" ,kuserfeedback)
       ("kcmutils" ,kcmutils)
       ("xcb-util" ,xcb-util)
       ("xcb-util-image" ,xcb-util-image)
       ("kactivities" ,kactivities)
       ("libsm" ,libsm)
       ("kirigami" ,kirigami)
       ("kqtquickcharts" ,kqtquickcharts)
       ("networkmanager-qt" ,networkmanager-qt)
       ("kdelibs4support" ,kdelibs4support)
       ("ki18n" ,ki18n)
       ("kwallet" ,kwallet)
       ("knewstuff" ,knewstuff)
       ("libksysguard" ,libksysguard)
       ("baloo" ,baloo)
       ("ktexteditor" ,ktexteditor)
       ("knotifyconfig" ,knotifyconfig)
       ("kidletime" ,kidletime)
       ("kactivities-stats" ,kactivities-stats)
       ("kdeclarative" ,kdeclarative)
       ("ktextwidgets" ,ktextwidgets)
       ("libkscreen" ,libkscreen)
       ("kscreenlocker" ,kscreenlocker)
       ("kholidays" ,kholidays)
       ("phonon" ,phonon)
       ("qtx11extras" ,qtx11extras)
       ("kglobalaccel" ,kglobalaccel)
       ("kdbusaddons" ,kdbusaddons)
       ("kwayland" ,kwayland)
       ("kcoreaddons" ,kcoreaddons)
       ("kpeople" ,kpeople)
       ("kwin" ,kwin)))
    (propagated-inputs
     `(("xsetroot" ,xsetroot)
       ("xprop" ,xprop)
       ("xrdb" ,xrdb)
       ("xmessage" ,xmessage)
       ;; ("milou" ,milou)
       ))
    (home-page "https://invent.kde.org/plasma/plasma-workspace")
    (synopsis "KDE Plasma Workspace")
    (description "Various components needed to run a Plasma-based environment.")
    (license license:lgpl2.0+)))

(define-public powerdevil
  (package
    (name "powerdevil")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/powerdevil-" version ".tar.xz"))
              (sha256
               (base32
                "0j7m95glplr2zn96fqnjyk3q4v3ladipssl953z83zqvwrg1h070"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("networkmanager-qt" ,networkmanager-qt)
       ("qtx11extras" ,qtx11extras)
       ("kactivities" ,kactivities)
       ("kauth" ,kauth)
       ("kidletime" ,kidletime)
       ("kconfig" ,kconfig)
       ("kdbusaddons" ,kdbusaddons)
       ("solid" ,solid)
       ("ki18n" ,ki18n)
       ("kglobalaccel" ,kglobalaccel)
       ("kio" ,kio)
       ("knotifyconfig" ,knotifyconfig)
       ("kwayland" ,kwayland)
       ("kcrash" ,kcrash)
       ("knotifications" ,knotifications)
       ("libkscreen" ,libkscreen)
       ("plasma-workspace" ,plasma-workspace)
       ("bluez-qt" ,bluez-qt)
       ("udev" ,eudev)))
    (home-page "https://invent.kde.org/plasma/powerdevil")
    (synopsis "Manages the power consumption settings of a Plasma shell")
    (description "Manages the power consumption settings of a Plasma shell.")
    (license license:gpl2+)))
;; FAIL: build is pass, but display:
;; System Settings was unable to find any views, and hence has nothing to
;; display.
(define-public systemsettings
  (package
    (name "systemsettings")
    (version "5.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/systemsettings-" version ".tar.xz"))
              (sha256
               (base32
                "0fvqwidh7rly2n4vjj3l8k2i8j77sg1mfxl86zwm9ahs4qabgrfd"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("kcrash" ,kcrash)
       ("kitemviews" ,kitemviews)
       ("kitemmodels" ,kitemmodels)
       ("kcmutils" ,kcmutils)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("kservice" ,kservice)
       ("kiconthemes" ,kiconthemes)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("kdbusaddons" ,kdbusaddons)
       ("kconfig" ,kconfig)
       ("kpackage" ,kpackage)
       ("kdeclarative" ,kdeclarative)
       ("kactivities" ,kactivities)
       ("kactivities-stats" ,kactivities-stats)
       ("kguiaddons" ,kguiaddons)
       ("kirigami" ,kirigami)
       ("plasma-workspace" ,plasma-workspace)))
    (home-page "https://kde.org/workspaces/plasmadesktop")
    (synopsis "KDE system manager for hardware, software, and workspaces")
    (description "KDE system manager for hardware, software, and workspaces")
    (license license:lgpl2.0+)))

(define-public kdecoration
  (package
    (name "kdecoration")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kdecoration-" version ".tar.xz"))
              (sha256
               (base32
                "0pn8n7zyb0adzjnn92vmbcf7pmpss60k9k1rk5llamj016xzfgnf"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("ki18n" ,ki18n)
       ("qtbase" ,qtbase)))
    (home-page "https://invent.kde.org/plasma/kdecoration")
    (synopsis "Plugin based library to create window decorations")
    (description "KDecoration is a library to create window decorations.
These window decorations can be used by for example an X11 based window
manager which re-parents a Client window to a window decoration frame.")
    (license license:lgpl3+)))

(define-public kscreenlocker
  (package
    (name "kscreenlocker")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kscreenlocker-" version ".tar.xz"))
              (sha256
               (base32
                "1fd5sqaqx9kj3kr0bgxpllhcm5arf8bc9pkpd9yk9c8xjy0j0fxi"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f ;; TODO: make tests pass
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'check-setup
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (system (string-append (assoc-ref inputs "xorg-server")
                                   "/bin/Xvfb :1 -screen 0 640x480x24 &"))
             (setenv "DISPLAY" ":1")
             #t))
         (delete 'check)
         ;; Tests use the installed library and require a DBus session.
         (add-after 'install 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (if tests?
                 (begin
                   (setenv "CTEST_OUTPUT_ON_FAILURE" "1")
                   (invoke "dbus-launch" "ctest" ".")))
             #t)))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)
       ;; For tests.
       ("dbus" ,dbus)
       ("xorg-server" ,xorg-server-for-tests)))
    (inputs
     `(("kcmutils" ,kcmutils)
       ("kcrash" ,kcrash)
       ("kdeclarative" ,kdeclarative)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kidletime" ,kidletime)
       ("knotifications" ,knotifications)
       ("ktextwidgets" ,ktextwidgets)
       ("kwayland" ,kwayland)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("libseccomp" ,libseccomp) ;for sandboxing the look'n'feel package
       ("libxcursor" ,libxcursor) ;missing in CMakeList.txt
       ("libxi" ,libxi)           ;XInput, required for grabbing XInput2 devices
       ("linux-pam" ,linux-pam)
       ("logind" ,elogind)        ;optional loginctl support
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtx11extras" ,qtx11extras)
       ("solid" ,solid)
       ("wayland" ,wayland)
       ("xcb-util-keysyms" ,xcb-util-keysyms)))
    (home-page "https://invent.kde.org/plasma/kscreenlocker")
    (synopsis "Screen locking library")
    (description
     "@code{kscreenlocker} is a library for creating secure lock screens.")
    (license license:gpl2+)))

(define-public libkscreen
  (package
    (name "libkscreen")
    (version "5.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/plasma/" version "/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32 "0rf1pm0yyc069f4n5s9ipdx4glzfr9zvv5cbrmn4q9i4v6z1qd8i"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ;; For testing.
       ("dbus" ,dbus)))
    (inputs
     `(("kwayland" ,kwayland)
       ("libxrandr" ,libxrandr)
       ("qtbase" ,qtbase)
       ("qtx11extras" ,qtx11extras)))
    (arguments
     '(#:tests? #f)) ; FIXME: 55% tests passed, 5 tests failed out of 11
    (home-page "https://community.kde.org/Solid/Projects/ScreenManagement")
    (synopsis "KDE's screen management software")
    (description "KScreen is the new screen management software for KDE Plasma
Workspaces which tries to be as magic and automatic as possible for users with
basic needs and easy to configure for those who want special setups.")
    (license license:gpl2+)))

(define-public kscreen
  (package
    (name "kscreen")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kscreen-" version ".tar.xz"))

              (sha256
               (base32
                "1s2ngg86128665mf6q7dnwv953jf2d4ad25klrm8wd85lj3wcwhd"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f
       ;; #:phases
       ;; (modify-phases %standard-phases
       ;;   (add-before 'check 'check-setup
       ;;     (lambda* (#:key inputs #:allow-other-keys)
       ;;       (system (string-append (assoc-ref inputs "xorg-server")
       ;;                              "/bin/Xvfb :1 -screen 0 640x480x24 &"))
       ;;       (setenv "DISPLAY" ":1")
       ;;       #t)))
       ))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("qtbase" ,qtbase)
       ("libkscreen" ,libkscreen)
       ("kdeclarative" ,kdeclarative)
       ("qtgraphicaleffects" ,qtgraphicaleffects)
       ("qtsensors" ,qtsensors)
       ("kcmutils" ,kcmutils)
       ("qtdeclarative" ,qtdeclarative)
       ("kdbusaddons" ,kdbusaddons)
       ("kdeclarative" ,kdeclarative)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("kwindowsystem" ,kwindowsystem)
       ("plasma-framework" ,plasma-framework)
       ("kxmlgui" ,kxmlgui)
       ;;; test
       ("xorg-server" ,xorg-server)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public libksysguard
  (package
    (name "libksysguard")
    (version "5.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde//stable/plasma/" version
                           "/libksysguard-" version ".tar.xz"))
       (sha256
        (base32 "1kd0h3p8bf9k5pqp0frhr81pa0yyrpkckg9zznirk9p1v88v7bfq"))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("kconfigwidgets" ,kconfigwidgets)
       ("kiconthemes" ,kiconthemes)
       ("kwindowsystem" ,kwindowsystem)
       ("ki18n" ,ki18n)
       ("kauth" ,kauth)
       ("kcompletion" ,kcompletion)
       ("kconfig" ,kconfig)
       ("kcoreaddons" ,kcoreaddons)
       ("kdeclarative" ,kdeclarative)
       ("kglobalaccel" ,kglobalaccel)
       ("kio" ,kio)
       ("knewstuff" ,knewstuff)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kservice" ,kservice)
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtscript" ,qtscript)
       ("qtwebkit" ,qtwebkit)
       ("qtx11extras" ,qtx11extras)
       ("plasma" ,plasma-framework)
       ("zlib" ,zlib)))
    (build-system qt-build-system)
    (arguments
     `(#:configure-flags
       `(,(string-append "-DKDE_INSTALL_DATADIR="
                         (assoc-ref %outputs "out") "/share"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'patch-cmakelists
           (lambda _
             ;; TODO: Verify: This should no longer be necessary, since
             ;; KF5AuthConfig.cmake.in contains this already.
             (substitute* "processcore/CMakeLists.txt"
               (("KAUTH_HELPER_INSTALL_DIR") "KDE_INSTALL_LIBEXECDIR"))))
         (replace 'check
           (lambda _
             ;; TODO: Fix this failing test-case
             (invoke "ctest" "-E" "processtest"))))))
    (home-page "https://userbase.kde.org/KSysGuard")
    (synopsis "Network enabled task and system monitoring")
    (description "KSysGuard can obtain information on system load and
manage running processes.  It obtains this information by interacting
with a ksysguardd daemon, which may also run on a remote system.")
    (license license:gpl3+)))


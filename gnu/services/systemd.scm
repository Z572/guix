(define-module (gnu services systemd)
  #:use-module (guix ui)
  #:use-module (guix sets)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu services configuration)

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
            systemd-configuration-upstream-unit-files
            systemd-configuration-upstream-unit-files

            systemd-root-service-type))

(define list-of-shepherd-service?
  (list-of (@@ (gnu services shepherd) shepherd-service?)))

(define list-of-file-likes?
  (list-of file-like?))

(define-record-type* <systemd-unit>
  systemd-unit make-systemd-unit
  systemd-unit?
  (description systemd-unit-description
               (default #f))
  (documentation systemd-unit-documentation
                 (default #f))
  (before systemd-unit--before
          (default '()))
  (after systemd-unit-after
         (default '()))
  (wants systemd-unit-wants
         (default '()))
  ;; conflicts
  (extra-config systemd-unit-extra-config
                (default '()))

  )

(define-record-type* <systemd-service>
  systemd-service make-systemd-service
  systemd-service?
  (unit systemd-service-unit
        (default #f))
  (type systemd-service-type
        (default #f))
  (exec-start systemd-service-exec-start
              (default #f))
  (exec-reload systemd-service-exec-reload
               (default #f))
  (restart systemd-service-restart
           (default #f))
  (extra-config systemd-service-extra-config
                (default '())))

(define-record-type* <systemd-socket>
  systemd-socket make-systemd-socket
  systemd-socket?
  (name systemd-socket-name)
  (unit systemd-socket-unit
        (default #f))
  (listen-stream systemd-socket-listen-stream
                 (default #f))
  (extra-config systemd-service-extra-config
                (default '())))

;; (define (unit->string unit)
;;   (match-record
;;       unit <systemd-unit>
;;       (description documentation extra-config)
;;     ()))

(define-configuration/no-serialization systemd-configuration
  (package
    (file-like systemd)
    "The SYSTEMD package.")
  (services
   (list-of-shepherd-service '())
   "The services.")
  (unit-files
   (list-of-file-likes '())
   "upstream units")
  (upstream-unit-files
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
        ;; (mkdir-p "/etc/systemd/system")
        ;; (mkdir-p "/run/systemd")
        (mkdir-p "/var/log/journal")
        (execl #$(file-append systemd "/lib/systemd/systemd") "systemd"))))

(define (systemd-etc config)
  "Return the activation gexp for CONFIG."
  (let
      ((systemd (systemd-configuration-package config))
       (upstream-unit-files (systemd-configuration-upstream-unit-files config))
       (unit-files (systemd-configuration-unit-files config)))
    (define build
      (with-imported-modules '((guix build utils))
        #~(begin
            (use-modules (guix build utils))
            (mkdir-p #$output)
            (define upstream-unit-files
              (map
               (lambda (x)
                 (let ((o (string-append #$systemd "/lib/systemd/system/" x )))
                   (if (file-exists? o)
                       o
                       (error x))))
               (list #$@upstream-unit-files)))
            (define other-units (pk 'oth (list #$@unit-files)))
            (map (lambda (f)
                   (install-file f #$output)
                   (if (file-exists? (string-append f ".wants"))
                       (copy-recursively
                        (string-append f ".wants")
                        (string-append #$output "/" (basename (string-append f ".wants"))))))
                 (append other-units upstream-unit-files)))))
    `(("systemd"
       ,(file-union "systemd"
                    `(("system"
                       ,(computed-file "systemd-etc" build))))))))

(define (systemd-configuration-merge a b)
  (systemd-configuration
   (inherit a)
   (services (append (systemd-configuration-services a)
                     (systemd-configuration-services b)
                     ))
   (unit-files (append (systemd-configuration-unit-files a)
                       (systemd-configuration-unit-files b)))))


(define systemd-root-service-type
  (service-type
   (name 'systemd-root)
   (compose (lambda (args) (fold systemd-configuration-merge (systemd-configuration) args)))
   (extend systemd-configuration-merge
           ;; (lambda (config other-config)
           ;;   (systemd-configuration
           ;;    (inherit config)
           ;;    (services (append (systemd-configuration-services config)
           ;;                      (systemd-configuration-services other-config)))
           ;;    (unit-files (append (systemd-configuration-unit-files config)
           ;;                        (systemd-configuration-unit-files other-config)))
           ;;    )
           ;;   )
           )
   (extensions (list (service-extension boot-service-type
                                        systemd-boot-gexp)
                     ;; (service-extension dbus-root-service-type
                     ;;                    (const (list systemd)))
                     (service-extension profile-service-type
                                        (lambda (c)
                                          (list (systemd-configuration-package c)))
                                        )
                     ;; (service-extension
                     ;;  special-files-service-type
                     ;;  (lambda (config)
                     ;;    (let ((systemd (systemd-configuration-package config)))
                     ;;      `(("/lib/systemd" ,(file-append dbus/systemd
                     ;;                                      "/lib/systemd"))
                     ;;        ("/lib/tmpfiles.d" ,(file-append dbus/systemd
                     ;;                                         "/lib/tmpfiles.d"))))))
                     ;; (service-extension
                     ;;  etc-service-type
                     ;;  (lambda (config)
                     ;;    (let ((systemd (systemd-configuration-package config)))
                     ;;      (list ;; `("systemd" ,(file-append dbus/systemd
                     ;;       ;;                           "/lib/systemd"))
                     ;;       ;; `("tmpfiles.d" ,(file-append dbus/systemd
                     ;;       ;;                              "/lib/tmpfiles.d"))
                     ;;       ;; `("dbus-1" ,(file-append systemd "/etc/dbus-1"))
                     ;;       ))))
                     (service-extension etc-service-type
                                        systemd-etc)
                     ))
   (default-value (systemd-configuration))
   (description
    "Run the systemd as PID 1.")))

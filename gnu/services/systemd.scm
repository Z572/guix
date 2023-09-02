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

            systemd-root-service-type))

(define list-of-shepherd-service?
  (list-of shepherd-service?))

(define-configuration/no-serialization systemd-configuration
  (package
    (file-like systemd)
    "The SYSTEMD package.")
  (services
   (list-of-shepherd-service '())
   "The services."))

(define (systemd-boot-gexp config)
  "Return a gexp starting the systemd service."
  (let ((systemd (systemd-configuration-package config)))
    #~(begin
        ;; Keep track of the booted system.

        (false-if-exception (delete-file "/run/booted-system"))
        ;; systemd require

        ;; Make /run/booted-system, an indirect GC root, point to the store item
        ;; /run/current-system points to.  Use 'canonicalize-path' rather than
        ;; 'readlink' to make sure we get the store item.
        (symlink (canonicalize-path "/run/current-system")
                 "/run/booted-system")
        (mkdir-p "/run/systemd")
        ;; (mkdir-p "/run/systemd/generator")

        ;; (invoke #$(file-append systemd "/lib/systemd/system-generators/systemd-fstab-generator")
        ;;         "/run/systemd/generator")
        (mkdir-p "/var/log/journal")
        ;; (let loop ((fd 3))
        ;;   (when (< fd 1024)
        ;;     (false-if-exception
        ;;      (let ((flags (fcntl fd F_GETFD)))
        ;;        (when (zero? (logand flags FD_CLOEXEC))
        ;;          (fcntl fd F_SETFD (logior FD_CLOEXEC flags)))))
        ;;     (loop (+ fd 1))))
        (execl #$(file-append systemd "/lib/systemd/systemd") "systemd"))))

(define (systemd-activation config)
  "Return the activation gexp for CONFIG."
  (let* ((systemd (systemd-configuration-package config)))
    #~(execl #$(file-append systemd "/bin/systemctl") "systemctl"
             '("daemon-reload"))))

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
                      etc-service-type
                      (lambda (config)
                        (let ((systemd (systemd-configuration-package config)))
                          (list `("systemd" ,(file-append dbus/systemd
                                                          "/lib/systemd"))
                                `("tmpfiles.d" ,(file-append dbus/systemd
                                                             "/lib/tmpfiles.d"))
                                ;; `("dbus-1" ,(file-append systemd "/etc/dbus-1"))
                                ))))
                     ;; (service-extension activation-service-type
                     ;;                    systemd-activation)
                     ))
   (default-value (systemd-configuration))
   (description
    "Run the systemd as PID 1.")))

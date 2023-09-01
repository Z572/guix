(define-module (gnu services systemd)
  #:use-module (guix ui)
  #:use-module (guix sets)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix diagnostics)
                #:select (define-with-syntax-properties formatted-message))
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services herd)
  #:use-module (gnu packages admin)
  #:use-module (ice-9 match)
  #:use-module (ice-9 vlist)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:export (shepherd-configuration
            shepherd-configuration?
            shepherd-configuration-shepherd
            shepherd-configuration-services

            shepherd-root-service-type
            %shepherd-root-service
            shepherd-service-type

            shepherd-service
            shepherd-service?
            shepherd-service-documentation
            shepherd-service-provision
            shepherd-service-canonical-name
            shepherd-service-requirement
            shepherd-service-one-shot?
            shepherd-service-respawn?
            shepherd-service-start
            shepherd-service-stop
            shepherd-service-auto-start?
            shepherd-service-modules

            shepherd-action
            shepherd-action?
            shepherd-action-name
            shepherd-action-documentation
            shepherd-action-procedure

            shepherd-configuration-action

            %default-modules

            shepherd-service-file

            shepherd-service-lookup-procedure
            shepherd-service-back-edges
            shepherd-service-upgrade

            user-processes-service-type

            assert-valid-graph))

(define list-of-shepherd-service?
  (list-of shepherd-service?))

(define-configuration systemd-configuration
  (package
    (file-like systemd)
    "The SYSTEMD package.")
  (services
   (list-of-shepherd-service? '())
   "The services."))

(define (systemd-boot-gexp config)
  "Return a gexp starting the systemd service."
  (let ((systemd (systemd-configuration-package config)))
    #~(begin
        ;; Keep track of the booted system.
        (false-if-exception (delete-file "/run/booted-system"))
        ;; systemd require
        (mkdir-p "/run")

        ;; Make /run/booted-system, an indirect GC root, point to the store item
        ;; /run/current-system points to.  Use 'canonicalize-path' rather than
        ;; 'readlink' to make sure we get the store item.
        (symlink (canonicalize-path "/run/current-system")
                 "/run/booted-system")

        (let loop ((fd 3))
          (when (< fd 1024)
            (false-if-exception
             (let ((flags (fcntl fd F_GETFD)))
               (when (zero? (logand flags FD_CLOEXEC))
                 (fcntl fd F_SETFD (logior FD_CLOEXEC flags)))))
            (loop (+ fd 1))))

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
                     (service-extension profile-service-type
                                        systemd-configuration-packages)
                     (service-extension profile-service-type
                                        systemd-configuration-packages)
                     ;; (service-extension activation-service-type
                     ;;                    systemd-activation)
                     ))
   (default-value (systemd-configuration))
   (description
    "Run the systemd as PID 1.")))

;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014, 2015, 2018, 2020 Ludovic Courtès <ludo@gnu.org>
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

(define-module (gnu build systemd-initrd)
  #:use-module ((guix cpio) #:prefix cpio:)
  #:use-module (guix build utils)
  #:use-module (guix build store-copy)
  #:use-module (system base compile)
  #:use-module (rnrs bytevectors)
  #:use-module ((system foreign) #:select (sizeof))
  #:use-module (ice-9 ftw)
  #:export (write-cpio-archive
            build-initrd/systemd))

;;; Commentary:
;;;
;;; Tools to create Linux initial RAM disks ("initrds").  Initrds are
;;; essentially gzipped cpio archives, with a '/init' executable that the
;;; kernel runs at boot time.
;;;
;;; Code:

(define* (write-cpio-archive output directory
                             #:key
                             (compress? #t)
                             (gzip "gzip"))
  "Write a cpio archive containing DIRECTORY to file OUTPUT, with reset
timestamps in the archive.  When COMPRESS? is true, compress it using GZIP.
On success, return OUTPUT."

  ;; Note: as per `ramfs-rootfs-initramfs.txt', always add directory entries
  ;; before the files that are inside of it: "The Linux kernel cpio
  ;; extractor won't create files in a directory that doesn't exist, so the
  ;; directory entries must go before the files that go in those
  ;; directories."

  (define files
    ;; Use 'sort' so that (1) the order of files is deterministic, and (2)
    ;; directories appear before the files they contain.
    (sort (file-system-fold (const #t)                 ;enter?
                            (lambda (file stat result) ;leaf
                              (cons file result))
                            (lambda (dir stat result)  ;down
                              (if (string=? dir directory)
                                  result
                                  (cons dir result)))
                            (lambda (file stat result)
                              result)
                            (const #f)                 ;skip
                            (const #f)                 ;error
                            '()
                            directory)
          string<?))

  (call-with-output-file output
    (lambda (port)
      (cpio:write-cpio-archive files port
                               #:file->header cpio:file->cpio-header*)))

  (if compress?
      ;; Gzip insists on adding a '.gz' suffix and does nothing if the input
      ;; file already has that suffix.  Shuffle files around to placate it.
      (let* ((gz-suffix? (string-suffix? ".gz" output))
             (sans-gz    (if gz-suffix?
                             (string-drop-right output 3)
                             output)))
        (when gz-suffix?
          (rename-file output sans-gz))
        ;; Use '--no-name' so that gzip records neither a file name nor a time
        ;; stamp in its output.
        (and (zero? (system* gzip "--best" "--no-name" sans-gz))
             (begin
               (unless gz-suffix?
                 (rename-file (string-append output ".gz") output))
               output)))
      output))

(define* (write-to-file path con  #:optional (mode #f))
  (mkdir-p (dirname path))
  (call-with-output-file path
    (lambda (port)
      (display con port)))
  (when mode
    (chmod path mode)))

(define* (build-initrd/systemd output
                               #:key
                               systemd
                               (references-graphs '())
                               (gzip "gzip"))
  (mkdir "contents")

  ;; Copy the closures of all the items referenced in REFERENCES-GRAPHS.
  (populate-store references-graphs "contents"
                  #:deduplicate? #f)

  (with-directory-excursion "contents"
    ;; Make '/init'.
    ;; (mkdir-p "etc")
    (write-to-file "etc/os-release"
                   "\
NAME=\"Guix System\"
ID=guix
PRETTY_NAME=\"Guix System\"
LOGO=guix-icon
HOME_URL=\"https://guix.gnu.org\"
DOCUMENTATION_URL=\"https://guix.gnu.org/en/manual\"
SUPPORT_URL=\"https://guix.gnu.org/en/help\"
BUG_REPORT_URL=\"https://lists.gnu.org/mailman/listinfo/bug-guix\"
")
    (mkdir-p "etc/udev")
    (symlink "etc/os-release"
             "etc/initrd-release" )
    ;;     (write-to-file "etc/fstab"
    ;;                    "\
    ;; TAGjoptajej2oynju6yvboauz7pl6uj	/gnu/store	9p	trans=virtio,cache=loose,msize=104857600
    ;; /dev/vda1	/	ext4	defaults
    ;; proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
    ;; devtmpfs /dev devtmpfs rw,nosuid,size=4096k,nr_inodes=4069304,mode=755,inode64 0 0"
    ;;                    )
    ;; (write-to-file "etc/udev/hwdb.bin"
    ;;                "")
    (mkdir-p "usr")
    (mkdir-p "lib")
    ;; (write-to-file "etc/passwd"
    ;;                "root:x:0:0:root:/root:/bin/sh"
    ;;                #o644)
    ;; (write-to-file "etc/shadow"
    ;;                "root:$6$OwL1NlLYVteaQ4vC$dad0HyacGX/m7Cqp.e8e3h.GULo9wcWVKNtvZuhitihDio8/xdTSqkCfQJTFopi4P/hy1ZfAMO8gZ91XxUFal1:19503::::::"
    ;;                #o644)
    ;; (write-to-file "etc/group"
    ;;                "root:x:0:"
    ;;                #o644)

    (mkdir-p "sbin")
    (mkdir-p "root")
    (symlink "/proc/mounts" "etc/mtab")

    (symlink (string-append systemd "/lib/systemd/systemd") "init")
    ;; (symlink (string-append systemd "/lib/systemd/systemd") "sbin/init")

    ;; (mkdir-p "sbin")
    ;; (symlink (string-append systemd "/lib/systemd/systemd") "sbin/init")
    (mkdir-p "lib/systemd/system/")

    ;; (copy-recursively (string-append systemd "/lib/systemd/system/")
    ;;                   "lib/systemd/system/")
    ;; (delete-file "lib/systemd/system/default.target")
    ;; (symlink
    ;;  (string-append systemd "/lib/systemd/system/initrd.target") "lib/systemd/system/default.target")
    (mkdir-p "run")
    (mkdir-p "var")
    (mkdir-p "dev")
    ;; (symlink "/proc/self/fd/0" "dev/stdin")
    ;; (symlink "/proc/self/fd/1" "dev/stdout")
    ;; (symlink "/proc/self/fd/2" "dev/stderr")
    (symlink "/run" "var/run")
    (mkdir-p "proc/self")
    (symlink (string-append systemd "/lib/systemd/systemd") "proc/self/exe")
    (readlink "proc/self/exe")

    (write-cpio-archive output "." #:gzip gzip))

  ;; Make sure directories are writable so we can delete files.
  (for-each make-file-writable
            (find-files "contents"
                        (lambda (file stat)
                          (eq? 'directory (stat:type stat)))
                        #:directories? #t))
  (delete-file-recursively "contents"))

;;; linux-initrd.scm ends here

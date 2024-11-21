;;; TODO: Manual hash fix: rust-libspa
;;; TODO: Manual hash fix: rust-libspa-sys
;;; TODO: Manual hash fix: rust-niri
;;; TODO: Fix home-page, synopsis, description and license for rust-niri
;;; TODO: Manual hash fix: rust-niri-config
;;; TODO: Fix home-page, synopsis, description and license for rust-niri-config
;;; TODO: Manual hash fix: rust-niri-ipc
;;; TODO: Manual hash fix: rust-niri-visual-tests
;;; TODO: Fix home-page, synopsis, description and license for rust-niri-visual-tests
;;; TODO: Manual hash fix: rust-pipewire
;;; TODO: Manual hash fix: rust-pipewire-sys
;;; TODO: Manual hash fix: rust-smithay
;;; TODO: Manual hash fix: rust-smithay-drm-extras
;;; TODO: Fix home-page, synopsis, description and license for rust-smithay-drm-extras

(define-module (gnu packages niri)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-vcs)
  #:use-module (gnu packages crates-crypto)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-apple)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages crates-io))

(define-public unknown-license! #f)

(define-public rust-addr2line-0.24
  (package
    (name "rust-addr2line")
    (version "0.24.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hd1i57zxgz08j6h5qrhsnm2fi0bcqvsh389fw400xm3arz2ggnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-gimli" ,rust-gimli-0.31))))
    (home-page
     "https://github.com/gimli-rs/addr2line")
    (synopsis
     "cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust,\nusing `gimli`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-adler2-2
  (package
    (name "rust-adler2")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09r6drylvgy8vv8k20lnbvwq8gp09h7smfn6h1rxsy15pgh629si"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/oyvindln/adler2")
    (synopsis
     "simple clean-room implementation of the Adler-32 checksum")
    (description
     "This package provides a simple clean-room implementation of the Adler-32\nchecksum.")
    (license
     (list license:bsd-0 license:expat license:asl2.0))))

(define-public rust-ahash-0.8
  (package
    (name "rust-ahash")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ahash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-getrandom" ,rust-getrandom-0.2)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-version-check" ,rust-version-check-0.9)
        ("rust-zerocopy" ,rust-zerocopy-0.7))))
    (home-page "https://github.com/tkaitchuck/ahash")
    (synopsis
     "non-cryptographic hash function using AES-NI for high performance")
    (description
     "This package provides a non-cryptographic hash function using AES-NI for high\nperformance.")
    (license (list license:expat license:asl2.0))))

(define-public rust-aho-corasick-1
  (package
    (name "rust-aho-corasick")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aho-corasick" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05mrpkvdgp5d20y2p989f187ry9diliijgwrs254fs9s1m1x6q4f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2))))
    (home-page
     "https://github.com/BurntSushi/aho-corasick")
    (synopsis "Fast multiple substring searching")
    (description
     "This package provides Fast multiple substring searching.")
    (license (list license:unlicense license:expat))))

(define-public rust-allocator-api2-0.2
  (package
    (name "rust-allocator-api2")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "allocator-api2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kr6lfnxvnj164j1x38g97qjlhb7akppqzvgfs0697140ixbav2w"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/zakarumych/allocator-api2")
    (synopsis "Mirror of Rust's allocator API")
    (description
     "This package provides Mirror of Rust's allocator API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-android-activity-0.6
  (package
    (name "rust-android-activity")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android-activity" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0inh88x8x2fh62jg739s9hwyvdh8i920qf0qw7bhr802j9c7hsgg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-android-properties"
         ,rust-android-properties-0.2)
        ("rust-bitflags" ,rust-bitflags-2)
        ("rust-cc" ,rust-cc-1)
        ("rust-cesu8" ,rust-cesu8-1)
        ("rust-jni" ,rust-jni-0.21)
        ("rust-jni-sys" ,rust-jni-sys-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-ndk" ,rust-ndk-0.9)
        ("rust-ndk-context" ,rust-ndk-context-0.1)
        ("rust-ndk-sys" ,rust-ndk-sys-0.6)
        ("rust-num-enum" ,rust-num-enum-0.7)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page
     "https://github.com/rust-mobile/android-activity")
    (synopsis
     "Glue for building Rust applications on Android with NativeActivity or GameActivity")
    (description
     "This package provides Glue for building Rust applications on Android with @code{NativeActivity} or\n@code{GameActivity}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstream-0.6
  (package
    (name "rust-anstream")
    (version "0.6.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstream" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0f0k3g8hl8k8cd8f3rq6yj04415jhd3k3kz1mwnki1jx1wzyb893"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-anstyle" ,rust-anstyle-1)
        ("rust-anstyle-parse" ,rust-anstyle-parse-0.2)
        ("rust-anstyle-query" ,rust-anstyle-query-1)
        ("rust-anstyle-wincon" ,rust-anstyle-wincon-3)
        ("rust-colorchoice" ,rust-colorchoice-1)
        ("rust-is-terminal-polyfill"
         ,rust-is-terminal-polyfill-1)
        ("rust-utf8parse" ,rust-utf8parse-0.2))))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis
     "simple cross platform library for writing colored text to a terminal.")
    (description
     "This package provides a simple cross platform library for writing colored text\nto a terminal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstyle-1
  (package
    (name "rust-anstyle")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mlc5jmbrgikk700m1sjwgil019rm4mhkq5gzks5y0vcn59dwrc3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis "ANSI text styling")
    (description
     "This package provides ANSI text styling.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstyle-parse-0.2
  (package
    (name "rust-anstyle-parse")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle-parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1acqayy22fwzsrvr6n0lz6a4zvjjcvgr5sm941m7m0b2fr81cb9v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-utf8parse" ,rust-utf8parse-0.2))))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis "Parse ANSI Style Escapes")
    (description
     "This package provides Parse ANSI Style Escapes.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstyle-query-1
  (package
    (name "rust-anstyle-query")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle-query" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "036nm3lkyk43xbps1yql3583fp4hg3b1600is7mcyxs1gzrpm53r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page
     "https://github.com/rust-cli/anstyle.git")
    (synopsis "Look up colored console capabilities")
    (description
     "This package provides Look up colored console capabilities.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anstyle-wincon-3
  (package
    (name "rust-anstyle-wincon")
    (version "3.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anstyle-wincon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "099ir0w3lbpsp1nxdzbf4anq98ww8ykyc9pd1g03xgkj1v7dn291"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-anstyle" ,rust-anstyle-1)
        ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/rust-cli/anstyle")
    (synopsis "Styling legacy Windows terminals")
    (description
     "This package provides Styling legacy Windows terminals.")
    (license (list license:expat license:asl2.0))))

(define-public rust-anyhow-1
  (package
    (name "rust-anyhow")
    (version "1.0.93")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anyhow" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xapv1bck3pvwqk06xn4b8nk5c88cja19f1qc9ih42mhl05w35ac"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis
     "Flexible concrete Error type built on std::error::Error")
    (description
     "This package provides Flexible concrete Error type built on std::error::Error.")
    (license (list license:expat license:asl2.0))))

(define-public rust-appendlist-1
  (package
    (name "rust-appendlist")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "appendlist" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lnbl7mc7capcqj1z1ylxvm4h492sb9sr8pzww3q6lrhrmrxqjg1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/danieldulaney/appendlist")
    (synopsis
     "An append-only list that preserves references to its elements")
    (description
     "This package provides An append-only list that preserves references to its elements.")
    (license license:expat)))

(define-public rust-approx-0.5
  (package
    (name "rust-approx")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "approx" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ilpv3dgd58rasslss0labarq7jawxmivk17wsh8wmkdm3q15cfa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/brendanzab/approx")
    (synopsis
     "Approximate floating point equality comparisons and assertions")
    (description
     "This package provides Approximate floating point equality comparisons and assertions.")
    (license license:asl2.0)))

(define-public rust-arrayvec-0.7
  (package
    (name "rust-arrayvec")
    (version "0.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.")
    (description
     "This package provides a vector with fixed capacity, backed by an array (it can\nbe stored on the stack too).  Implements fixed capacity @code{ArrayVec} and\n@code{ArrayString}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-as-raw-xcb-connection-1
  (package
    (name "rust-as-raw-xcb-connection")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "as-raw-xcb-connection" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sqgpz2ymv5yx76r5j2npjq2x5qvvqnw0vrs35cyv30p3pfp2m8p"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/psychon/as-raw-xcb-connection")
    (synopsis
     "Trait to facilitate interoperatibility with libxcb C API")
    (description
     "This package provides Trait to facilitate interoperatibility with libxcb C API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-channel-2
  (package
    (name "rust-async-channel")
    (version "2.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-channel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0skvwxj6ysfc6d7bhczz9a2550260g62bm5gl0nmjxxyn007id49"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-concurrent-queue"
         ,rust-concurrent-queue-2)
        ("rust-event-listener-strategy"
         ,rust-event-listener-strategy-0.5)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-pin-project-lite"
         ,rust-pin-project-lite-0.2))))
    (home-page
     "https://github.com/smol-rs/async-channel")
    (synopsis
     "Async multi-producer multi-consumer channel")
    (description
     "This package provides Async multi-producer multi-consumer channel.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-executor-1
  (package
    (name "rust-async-executor")
    (version "1.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-executor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v6w1dbvsmw6cs4dk4lxj5dvrikc6xi479wikwaab2qy3h09mjih"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-task" ,rust-async-task-4)
        ("rust-concurrent-queue"
         ,rust-concurrent-queue-2)
        ("rust-fastrand" ,rust-fastrand-2)
        ("rust-futures-lite" ,rust-futures-lite-2)
        ("rust-slab" ,rust-slab-0.4))))
    (home-page
     "https://github.com/smol-rs/async-executor")
    (synopsis "Async executor")
    (description
     "This package provides Async executor.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-recursion-1
  (package
    (name "rust-async-recursion")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-recursion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/dcchut/async-recursion")
    (synopsis "Recursion for async functions")
    (description
     "This package provides Recursion for async functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-signal-0.2
  (package
    (name "rust-async-signal")
    (version "0.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-signal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wxrq3871l00mil43nmh0akvwjjjnv0bn7n2pzwbvh00k0s00zk3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-io" ,rust-async-io-2)
        ("rust-async-lock" ,rust-async-lock-3)
        ("rust-atomic-waker" ,rust-atomic-waker-1)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-signal-hook-registry"
         ,rust-signal-hook-registry-1)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page
     "https://github.com/smol-rs/async-signal")
    (synopsis "Async signal handling")
    (description
     "This package provides Async signal handling.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-autocfg-1
  (package
    (name "rust-autocfg")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "autocfg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09lz3by90d2hphbq56znag9v87gfpd9gb8nr82hll8z6x2nhprdc"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/cuviper/autocfg")
    (synopsis
     "Automatic cfg for Rust compiler features")
    (description
     "This package provides Automatic cfg for Rust compiler features.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-backtrace-0.3
  (package
    (name "rust-backtrace")
    (version "0.3.74")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06pfif7nwx66qf2zaanc2fcq7m64i91ki9imw9xd3bnz5hrwp0ld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-addr2line" ,rust-addr2line-0.24)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.8)
        ("rust-object" ,rust-object-0.36)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-windows-targets"
         ,rust-windows-targets-0.52))))
    (home-page
     "https://github.com/rust-lang/backtrace-rs")
    (synopsis
     "library to acquire a stack trace (backtrace) at runtime in a Rust program.")
    (description
     "This package provides a library to acquire a stack trace (backtrace) at runtime\nin a Rust program.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bindgen-0.69
  (package
    (name "rust-bindgen")
    (version "0.69.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1240snlcfj663k04bjsg629g4wx6f83flgbjh5rzpgyagk3864r7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-annotate-snippets"
         ,rust-annotate-snippets-0.9)
        ("rust-bitflags" ,rust-bitflags-2)
        ("rust-cexpr" ,rust-cexpr-0.6)
        ("rust-clang-sys" ,rust-clang-sys-1)
        ("rust-itertools" ,rust-itertools-0.12)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-lazycell" ,rust-lazycell-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-rustc-hash" ,rust-rustc-hash-1)
        ("rust-shlex" ,rust-shlex-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries")
    (description
     "This package provides Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-bitflags-2
  (package
    (name "rust-bitflags")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pkidwzn3hnxlsl8zizh0bncgbjnw7c41cx7bby26ncbzmiznj5h"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/bitflags/bitflags")
    (synopsis
     "macro to generate structures which behave like bitflags.")
    (description
     "This package provides a macro to generate structures which behave like bitflags.")
    (license (list license:expat license:asl2.0))))

(define-public rust-block2-0.5
  (package
    (name "rust-block2")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pyiha5his2grzqr3mynmq244laql2j20992i59asp0gy7mjw4rc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-objc2" ,rust-objc2-0.5))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Apple's C language extension of blocks")
    (description
     "This package provides Apple's C language extension of blocks.")
    (license license:expat)))

(define-public rust-bumpalo-3
  (package
    (name "rust-bumpalo")
    (version "3.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis "fast bump allocation arena for Rust.")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-bytemuck-1
  (package
    (name "rust-bytemuck")
    (version "1.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytemuck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ka96agz9kqmsd71q7xpr08bnh2g8x4hivxqpnks0674h5dj2d43"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytemuck-derive" ,rust-bytemuck-derive-1))))
    (home-page
     "https://github.com/Lokathor/bytemuck")
    (synopsis
     "crate for mucking around with piles of bytes.")
    (description
     "This package provides a crate for mucking around with piles of bytes.")
    (license
     (list license:zlib license:asl2.0 license:expat))))

(define-public rust-bytemuck-derive-1
  (package
    (name "rust-bytemuck-derive")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytemuck_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v5r33dgl12rqbvh440fdjxmxxr49qpzmg6vpw5jzdbcjk6w7z5w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/Lokathor/bytemuck")
    (synopsis "derive proc-macros for `bytemuck`")
    (description
     "This package provides derive proc-macros for `bytemuck`.")
    (license
     (list license:zlib license:asl2.0 license:expat))))

(define-public rust-bytes-1
  (package
    (name "rust-bytes")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nnhpb7jlpj393qnjr1n9n6sgpl3w5ymrwl3pnjmrriam861bh4s"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/tokio-rs/bytes")
    (synopsis
     "Types and traits for working with bytes")
    (description
     "This package provides Types and traits for working with bytes.")
    (license license:expat)))

(define-public rust-cairo-rs-0.20
  (package
    (name "rust-cairo-rs")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cairo-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s9yafifi3pwf7jck0bhgwr4rlg483sqhlr32fb8q44lghafm878"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.20)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://gtk-rs.org/")
    (synopsis "Rust bindings for the Cairo library")
    (description
     "This package provides Rust bindings for the Cairo library.")
    (license license:expat)))

(define-public rust-cairo-sys-rs-0.20
  (package
    (name "rust-cairo-sys-rs")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cairo-sys-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13x85l52nl2izmdb48zzpkhhh1a4dsgqlp8gys4n1f5r2kwr10j2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libcairo")
    (description
     "This package provides FFI bindings to libcairo.")
    (license license:expat)))

(define-public rust-calloop-0.13
  (package
    (name "rust-calloop")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "calloop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v5zgidnhsyml403rzr7vm99f8q6r5bxq5gxyiqkr8lcapwa57dr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-log" ,rust-log-0.4)
        ("rust-polling" ,rust-polling-3)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Smithay/calloop")
    (synopsis "callback-based event loop")
    (description
     "This package provides a callback-based event loop.")
    (license license:expat)))

(define-public rust-calloop-0.14
  (package
    (name "rust-calloop")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "calloop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rx5q1sxkddk47nmnqqjq5zr15f5zfcph0hfyk049kjba7hx3sm1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-task" ,rust-async-task-4)
        ("rust-bitflags" ,rust-bitflags-2)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-polling" ,rust-polling-3)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/Smithay/calloop")
    (synopsis "callback-based event loop")
    (description
     "This package provides a callback-based event loop.")
    (license license:expat)))

(define-public rust-calloop-wayland-source-0.3
  (package
    (name "rust-calloop-wayland-source")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "calloop-wayland-source" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "086x5mq16prrcwd9k6bw9an0sp8bj9l5daz4ziz5z4snf2c6m9lm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-calloop" ,rust-calloop-0.13)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-client" ,rust-wayland-client-0.31))))
    (home-page
     "https://github.com/smithay/calloop-wayland-source")
    (synopsis
     "wayland-rs client event source for callloop")
    (description
     "This package provides a wayland-rs client event source for callloop.")
    (license license:expat)))

(define-public rust-cc-1
  (package
    (name "rust-cc")
    (version "1.1.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vscf59yxf665s4fv9yn3l39gfw99mgp6wnbc76cyv80ahmrdry2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-jobserver" ,rust-jobserver-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-shlex" ,rust-shlex-1))))
    (home-page "https://github.com/rust-lang/cc-rs")
    (synopsis
     "build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.")
    (description
     "This package provides a build-time dependency for Cargo build scripts to assist\nin invoking the native C compiler to compile native C code into a static archive\nto be linked into Rust code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-chumsky-0.9
  (package
    (name "rust-chumsky")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chumsky" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jcnafc8rjfs1al08gqzyn0kpbaizgdwrd0ajqafspd18ikxdswf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-hashbrown" ,rust-hashbrown-0.14))))
    (home-page "https://github.com/zesterer/chumsky")
    (synopsis
     "parser library for humans with powerful error recovery")
    (description
     "This package provides a parser library for humans with powerful error recovery.")
    (license license:expat)))

(define-public rust-clang-sys-1
  (package
    (name "rust-clang-sys")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x1r9yqss76z8xwpdanw313ss6fniwc1r7dzb5ycjn0ph53kj0hb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glob" ,rust-glob-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.8))))
    (home-page
     "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang")
    (description
     "This package provides Rust bindings for libclang.")
    (license license:asl2.0)))

(define-public rust-clap-4
  (package
    (name "rust-clap")
    (version "4.5.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1s37v23gcxkjy4800qgnkxkpliz68vslpr5sgn1xar56hmnkfzxr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-clap-builder" ,rust-clap-builder-4)
        ("rust-clap-derive" ,rust-clap-derive-4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line\nArgument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-builder-4
  (package
    (name "rust-clap-builder")
    (version "4.5.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_builder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m6w10l2f65h3ch0d53lql6p26xxrh20ffipra9ysjsfsjmq1g0r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-anstream" ,rust-anstream-0.6)
        ("rust-anstyle" ,rust-anstyle-1)
        ("rust-clap-lex" ,rust-clap-lex-0.7)
        ("rust-strsim" ,rust-strsim-0.11))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line\nArgument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-colorchoice-1
  (package
    (name "rust-colorchoice")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "colorchoice" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1439m3r3jy3xqck8aa13q658visn71ki76qa93cy55wkmalwlqsv"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/rust-cli/anstyle.git")
    (synopsis "Global override of color control")
    (description
     "This package provides Global override of color control.")
    (license (list license:expat license:asl2.0))))

(define-public rust-combine-4
  (package
    (name "rust-combine")
    (version "4.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "combine" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-1)
        ("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/Marwes/combine")
    (synopsis
     "Fast parser combinators on arbitrary streams with zero-copy support")
    (description
     "This package provides Fast parser combinators on arbitrary streams with zero-copy support.")
    (license license:expat)))

(define-public rust-cookie-factory-0.3
  (package
    (name "rust-cookie-factory")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie-factory" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18mka6fk3843qq3jw1fdfvzyv05kx7kcmirfbs2vg2kbw9qzm1cq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.3))))
    (home-page
     "https://github.com/rust-bakery/cookie-factory")
    (synopsis "nom inspired serialization library")
    (description
     "This package provides nom inspired serialization library.")
    (license license:expat)))

(define-public rust-core-graphics-0.23
  (package
    (name "rust-core-graphics")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-graphics" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10dhv3gk4kmbzl14xxkrhhky4fdp8h6nzff6h0019qgr6nz84xy0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-core-foundation"
         ,rust-core-foundation-0.9)
        ("rust-core-graphics-types"
         ,rust-core-graphics-types-0.1)
        ("rust-foreign-types" ,rust-foreign-types-0.5)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Core Graphics for macOS")
    (description
     "This package provides Bindings to Core Graphics for @code{macOS}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-graphics-types-0.1
  (package
    (name "rust-core-graphics-types")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-graphics-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bxg8nxc8fk4kxnqyanhf36wq0zrjr552c58qy6733zn2ihhwfa5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-core-foundation"
         ,rust-core-foundation-0.9)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis
     "Bindings for some fundamental Core Graphics types")
    (description
     "This package provides Bindings for some fundamental Core Graphics types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpufeatures-0.2
  (package
    (name "rust-cpufeatures")
    (version "0.2.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpufeatures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q3qd9qkw94vs7n5i0y3zz2cqgzcxvdgyb54ryngwmjhfbgrg1k0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Lightweight runtime CPU feature detection for aarch64, loongarch64, and x86/x86_64 targets, \nwith no_std support and support for mobile targets including Android and iOS")
    (description
     "This package provides Lightweight runtime CPU feature detection for aarch64, loongarch64, and\nx86/x86_64 targets, with no_std support and support for mobile targets including\nAndroid and @code{iOS}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-csscolorparser-0.7
  (package
    (name "rust-csscolorparser")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csscolorparser" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12423a53ikbzacavi157kf3xz9p93sn8gqvwsifvjzwahima3ya6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-phf" ,rust-phf-0.11))))
    (home-page
     "https://github.com/mazznoer/csscolorparser-rs")
    (synopsis "CSS color parser library")
    (description
     "This package provides CSS color parser library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-downcast-rs-1
  (package
    (name "rust-downcast-rs")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "downcast-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/marcianx/downcast-rs")
    (synopsis
     "Trait object downcasting support using only safe Rust. It supports type\nparameters, associated types, and type constraints.")
    (description
     "This package provides Trait object downcasting support using only safe Rust.  It supports type\nparameters, associated types, and type constraints.")
    (license (list license:expat license:asl2.0))))

(define-public rust-dpi-0.1
  (package
    (name "rust-dpi")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dpi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lzz48gpgbwdrw0s8vib0589ij9jizv1vzsphm4xd9kw58lhwp7j"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/rust-windowing/winit")
    (synopsis "Types for handling UI scaling")
    (description
     "This package provides Types for handling UI scaling.")
    (license license:asl2.0)))

(define-public rust-drm-0.14
  (package
    (name "rust-drm")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vvmj9n0wslrbw3rinpzlfyhwwgr02gqspy1al5gfh99dif8rg40"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-bytemuck" ,rust-bytemuck-1)
        ("rust-drm-ffi" ,rust-drm-ffi-0.9)
        ("rust-drm-fourcc" ,rust-drm-fourcc-2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rustix" ,rust-rustix-0.38))))
    (home-page "https://github.com/Smithay/drm-rs")
    (synopsis
     "Safe, low-level bindings to the Direct Rendering Manager API")
    (description
     "This package provides Safe, low-level bindings to the Direct Rendering Manager API.")
    (license license:expat)))

(define-public rust-drm-ffi-0.9
  (package
    (name "rust-drm-ffi")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drm-ffi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12vff80hdpp81gj5lqw25xnkppwsxc4wklpn8nc556wsv5ci9r6q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-drm-sys" ,rust-drm-sys-0.8)
        ("rust-rustix" ,rust-rustix-0.38))))
    (home-page "https://github.com/Smithay/drm-rs")
    (synopsis
     "Safe, low-level bindings to the Direct Rendering Manager API")
    (description
     "This package provides Safe, low-level bindings to the Direct Rendering Manager API.")
    (license license:expat)))

(define-public rust-drm-sys-0.8
  (package
    (name "rust-drm-sys")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drm-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1345z72hd2rna4qxd2zcpbzvw0z7ywfndk6g2ngdci69vg46dyxs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.6))))
    (home-page "https://github.com/Smithay/drm-rs")
    (synopsis
     "Bindings to the Direct Rendering Manager API")
    (description
     "This package provides Bindings to the Direct Rendering Manager API.")
    (license license:expat)))

(define-public rust-either-1
  (package
    (name "rust-either")
    (version "1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "either" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w2c1mybrd7vljyxk77y9f4w9dyjrmp3yp82mk7bcm8848fazcb0"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/rayon-rs/either")
    (synopsis
     "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.")
    (description
     "This package provides The enum `Either` with variants `Left` and `Right` is a general purpose sum type\nwith two cases.")
    (license (list license:expat license:asl2.0))))

(define-public rust-errno-0.3
  (package
    (name "rust-errno")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "errno" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fi0m0493maq1jygcf1bya9cymz2pc1mqxj26bdv7yjd37v5qk2k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page
     "https://github.com/lambda-fairy/rust-errno")
    (synopsis
     "Cross-platform interface to the `errno` variable")
    (description
     "This package provides Cross-platform interface to the `errno` variable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fastrand-2
  (package
    (name "rust-fastrand")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fastrand" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i0sp22gv8n4h4w5cf10l2b3rfdi0da2kp0d4hl7jw65fdp80vs8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/smol-rs/fastrand")
    (synopsis
     "simple and fast random number generator")
    (description
     "This package provides a simple and fast random number generator.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fdeflate-0.3
  (package
    (name "rust-fdeflate")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fdeflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nxymhm74g9fmqmdd80ypp2kgk5xbqvgfrj43h8s6cqx9k3g9ih7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-simd-adler32" ,rust-simd-adler32-0.3))))
    (home-page
     "https://github.com/image-rs/fdeflate")
    (synopsis
     "Fast specialized deflate implementation")
    (description
     "This package provides Fast specialized deflate implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-field-offset-0.3
  (package
    (name "rust-field-offset")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "field-offset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zq5sssaa2ckmcmxxbly8qgz3sxpb8g1lwv90sdh1z74qif2gqiq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memoffset" ,rust-memoffset-0.9)
        ("rust-rustc-version" ,rust-rustc-version-0.4))))
    (home-page
     "https://github.com/Diggsey/rust-field-offset")
    (synopsis
     "Safe pointer-to-member implementation")
    (description
     "This package provides Safe pointer-to-member implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-macros-0.2
  (package
    (name "rust-foreign-types-macros")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hjpii8ny6l7h7jpns2cp9589016l8mlrpaigcnayjn9bdc6qp0s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "An internal crate used by foreign-types")
    (description
     "This package provides An internal crate used by foreign-types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-foreign-types-shared-0.3
  (package
    (name "rust-foreign-types-shared")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nykdvv41a3d4py61bylmlwjhhvdm0b3bcj9vxhqgxaxnp5ik6ma"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "An internal crate used by foreign-types")
    (description
     "This package provides An internal crate used by foreign-types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-0.3
  (package
    (name "rust-futures")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-channel"
         ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-executor"
         ,rust-futures-executor-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3))))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "An implementation of futures and streams featuring zero allocations,\ncomposability, and iterator-like interfaces.")
    (description
     "This package provides An implementation of futures and streams featuring zero allocations,\ncomposability, and iterator-like interfaces.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-channel-0.3
  (package
    (name "rust-futures-channel")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-channel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3))))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "Channels for asynchronous communication using futures-rs.")
    (description
     "This package provides Channels for asynchronous communication using futures-rs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-core-0.3
  (package
    (name "rust-futures-core")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "The core traits and types in for the `futures` library.")
    (description
     "This package provides The core traits and types in for the `futures` library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-executor-0.3
  (package
    (name "rust-futures-executor")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-executor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3))))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "Executors for asynchronous tasks based on the futures-rs library.")
    (description
     "This package provides Executors for asynchronous tasks based on the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-io-0.3
  (package
    (name "rust-futures-io")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "The `AsyncRead`, `AsyncWrite`, `AsyncSeek`, and `AsyncBufRead` traits for the futures-rs library.")
    (description
     "This package provides The `@code{AsyncRead`}, `@code{AsyncWrite`}, `@code{AsyncSeek`}, and\n`@code{AsyncBufRead`} traits for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-lite-2
  (package
    (name "rust-futures-lite")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-lite" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19gk4my8zhfym6gwnpdjiyv2hw8cc098skkbkhryjdaf0yspwljj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-fastrand" ,rust-fastrand-2)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-parking" ,rust-parking-2)
        ("rust-pin-project-lite"
         ,rust-pin-project-lite-0.2))))
    (home-page
     "https://github.com/smol-rs/futures-lite")
    (synopsis
     "Futures, streams, and async I/O combinators")
    (description
     "This package provides Futures, streams, and async I/O combinators.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-futures-macro-0.3
  (package
    (name "rust-futures-macro")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "The futures-rs procedural macro implementations.")
    (description
     "This package provides The futures-rs procedural macro implementations.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-sink-0.3
  (package
    (name "rust-futures-sink")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-sink" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "The asynchronous `Sink` trait for the futures-rs library.")
    (description
     "This package provides The asynchronous `Sink` trait for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-task-0.3
  (package
    (name "rust-futures-task")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-task" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis "Tools for working with tasks.")
    (description
     "This package provides tools for working with tasks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-util-0.3
  (package
    (name "rust-futures-util")
    (version "0.3.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-channel"
         ,rust-futures-channel-0.3)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-futures-macro" ,rust-futures-macro-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-futures-task" ,rust-futures-task-0.3)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-pin-project-lite"
         ,rust-pin-project-lite-0.2)
        ("rust-pin-utils" ,rust-pin-utils-0.1)
        ("rust-slab" ,rust-slab-0.4))))
    (home-page
     "https://rust-lang.github.io/futures-rs")
    (synopsis
     "Common utilities and extension traits for the futures-rs library.")
    (description
     "This package provides Common utilities and extension traits for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gbm-0.16
  (package
    (name "rust-gbm")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gbm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12n8hk02dqjari38mshm7rmw2cwaq4klgblsf39b2i04l5x10967"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-drm" ,rust-drm-0.14)
        ("rust-drm-fourcc" ,rust-drm-fourcc-2)
        ("rust-gbm-sys" ,rust-gbm-sys-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-server" ,rust-wayland-server-0.31))))
    (home-page "https://github.com/Smithay/gbm.rs")
    (synopsis "libgbm bindings for rust")
    (description
     "This package provides libgbm bindings for rust.")
    (license license:expat)))

(define-public rust-gbm-sys-0.3
  (package
    (name "rust-gbm-sys")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gbm-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0f15mcxhvd0yi62md7wa052yhjbyg86z3lmjqsshg9wzvrj2zk59"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/Drakulix/gbm.rs/tree/master/gbm-sys")
    (synopsis
     "Bindgen generated unsafe libgbm wrapper")
    (description
     "This package provides Bindgen generated unsafe libgbm wrapper.")
    (license license:expat)))

(define-public rust-gdk4-0.9
  (package
    (name "rust-gdk4")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gdk4" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cbas4knkc23f5gdbr5yiafp72q8zmmsqpb1mrvmhm7p1kmsw8f1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-rs" ,rust-cairo-rs-0.20)
        ("rust-gdk-pixbuf" ,rust-gdk-pixbuf-0.20)
        ("rust-gdk4-sys" ,rust-gdk4-sys-0.9)
        ("rust-gio" ,rust-gio-0.20)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.20))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "Rust bindings of the GDK 4 library")
    (description
     "This package provides Rust bindings of the GDK 4 library.")
    (license license:expat)))

(define-public rust-gdk4-sys-0.9
  (package
    (name "rust-gdk4-sys")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gdk4-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "175wpwvz7ax63wypfi4id72mwfwawvyr02069zqrjlcxxb8h6g3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.20)
        ("rust-gdk-pixbuf-sys" ,rust-gdk-pixbuf-sys-0.20)
        ("rust-gio-sys" ,rust-gio-sys-0.20)
        ("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-gobject-sys" ,rust-gobject-sys-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.20)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "FFI bindings of GDK 4")
    (description
     "This package provides FFI bindings of GDK 4.")
    (license license:expat)))

(define-public rust-generator-0.8
  (package
    (name "rust-generator")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08vja5ngg548sn7cc8zdamq0axs2n8n19lmihfhz6k9ykillkffv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustversion" ,rust-rustversion-1)
        ("rust-windows" ,rust-windows-0.58))))
    (home-page
     "https://github.com/Xudong-Huang/generator-rs.git")
    (synopsis "Stackfull Generator Library in Rust")
    (description
     "This package provides Stackfull Generator Library in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.31
  (package
    (name "rust-gimli")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gvqc0ramx8szv76jhfd4dms0zyamvlg4whhiz11j34hh3dqxqh7"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis
     "library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging\nformat.")
    (license (list license:expat license:asl2.0))))

(define-public rust-glam-0.29
  (package
    (name "rust-glam")
    (version "0.29.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glam" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xwnyc0xamrxgqm2mq0x9kas4wz2zaxbillq79lqxpcgqhzdsinw"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/bitshifter/glam-rs")
    (synopsis
     "simple and fast 3D math library for games and graphics")
    (description
     "This package provides a simple and fast 3D math library for games and graphics.")
    (license (list license:expat license:asl2.0))))

(define-public rust-graphene-rs-0.20
  (package
    (name "rust-graphene-rs")
    (version "0.20.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "graphene-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1znjfs8fhyxkccyw8wrgzdk16lbx8zqkafgjbxq950p7gx618lqz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib" ,rust-glib-0.20)
        ("rust-graphene-sys" ,rust-graphene-sys-0.20)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://gtk-rs.org/")
    (synopsis
     "Rust bindings for the Graphene library")
    (description
     "This package provides Rust bindings for the Graphene library.")
    (license license:expat)))

(define-public rust-graphene-sys-0.20
  (package
    (name "rust-graphene-sys")
    (version "0.20.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "graphene-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16abjf4bkdi93cf0n6hnk7fyyq9dqx1c8wjdga3mj7h8qmypjhg7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to libgraphene-1.0")
    (description
     "This package provides FFI bindings to libgraphene-1.0.")
    (license license:expat)))

(define-public rust-gsk4-0.9
  (package
    (name "rust-gsk4")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gsk4" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08p9361dwywqb5knk0pi71hmddz2mbrzmhj22b6cdq8yqpvs48da"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-rs" ,rust-cairo-rs-0.20)
        ("rust-gdk4" ,rust-gdk4-0.9)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-graphene-rs" ,rust-graphene-rs-0.20)
        ("rust-gsk4-sys" ,rust-gsk4-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.20))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "Rust bindings of the GSK 4 library")
    (description
     "This package provides Rust bindings of the GSK 4 library.")
    (license license:expat)))

(define-public rust-gsk4-sys-0.9
  (package
    (name "rust-gsk4-sys")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gsk4-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06y0qvxc5ad88fqicpgxvghm3q7xn00s6zpb5644x7sgal3vd7qg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.20)
        ("rust-gdk4-sys" ,rust-gdk4-sys-0.9)
        ("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-gobject-sys" ,rust-gobject-sys-0.20)
        ("rust-graphene-sys" ,rust-graphene-sys-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.20)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "FFI bindings of GSK 4")
    (description
     "This package provides FFI bindings of GSK 4.")
    (license license:expat)))

(define-public rust-gtk4-0.9
  (package
    (name "rust-gtk4")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gtk4" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08ia1qgz4ya3rxyfha1zhvq6lzfvhyhq59clkhn1hk2sgx4nai6k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-rs" ,rust-cairo-rs-0.20)
        ("rust-field-offset" ,rust-field-offset-0.3)
        ("rust-futures-channel"
         ,rust-futures-channel-0.3)
        ("rust-gdk-pixbuf" ,rust-gdk-pixbuf-0.20)
        ("rust-gdk4" ,rust-gdk4-0.9)
        ("rust-gio" ,rust-gio-0.20)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-graphene-rs" ,rust-graphene-rs-0.20)
        ("rust-gsk4" ,rust-gsk4-0.9)
        ("rust-gtk4-macros" ,rust-gtk4-macros-0.9)
        ("rust-gtk4-sys" ,rust-gtk4-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.20))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "Rust bindings of the GTK 4 library")
    (description
     "This package provides Rust bindings of the GTK 4 library.")
    (license license:expat)))

(define-public rust-gtk4-macros-0.9
  (package
    (name "rust-gtk4-macros")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gtk4-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bxbkzxmzglw42fvq2dmnbdfy3fkcmyp20vr5492gkgwr1ib7rz9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-crate"
         ,rust-proc-macro-crate-3)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "Macros helpers for GTK 4 bindings")
    (description
     "This package provides Macros helpers for GTK 4 bindings.")
    (license license:expat)))

(define-public rust-gtk4-sys-0.9
  (package
    (name "rust-gtk4-sys")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gtk4-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f2mkxc1m20gbc3b5s23pyx8acd70yfg9sa8pcnn9hdi11ck5r6b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.20)
        ("rust-gdk-pixbuf-sys" ,rust-gdk-pixbuf-sys-0.20)
        ("rust-gdk4-sys" ,rust-gdk4-sys-0.9)
        ("rust-gio-sys" ,rust-gio-sys-0.20)
        ("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-gobject-sys" ,rust-gobject-sys-0.20)
        ("rust-graphene-sys" ,rust-graphene-sys-0.20)
        ("rust-gsk4-sys" ,rust-gsk4-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.20)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/gtk4-rs")
    (synopsis "FFI bindings of GTK 4")
    (description
     "This package provides FFI bindings of GTK 4.")
    (license license:expat)))

(define-public rust-hashbrown-0.14
  (package
    (name "rust-hashbrown")
    (version "0.14.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashbrown" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-ahash" ,rust-ahash-0.8)
        ("rust-allocator-api2" ,rust-allocator-api2-0.2))))
    (home-page
     "https://github.com/rust-lang/hashbrown")
    (synopsis
     "Rust port of Google's SwissTable hash map")
    (description
     "This package provides a Rust port of Google's @code{SwissTable} hash map.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hashbrown-0.15
  (package
    (name "rust-hashbrown")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashbrown" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yx4xq091s7i6mw6bn77k8cp4jrpcac149xr32rg8szqsj27y20y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/rust-lang/hashbrown")
    (synopsis
     "Rust port of Google's SwissTable hash map")
    (description
     "This package provides a Rust port of Google's @code{SwissTable} hash map.")
    (license (list license:expat license:asl2.0))))

(define-public rust-icu-collections-1
  (package
    (name "rust-icu-collections")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_collections" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09j5kskirl59mvqc8kabhy7005yyy7dp88jw9f6f3gkf419a8byv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-yoke" ,rust-yoke-0.7)
        ("rust-zerofrom" ,rust-zerofrom-0.1)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "Collection of API for use in ICU libraries")
    (description
     "This package provides Collection of API for use in ICU libraries.")
    (license unknown-license!)))

(define-public rust-icu-locid-1
  (package
    (name "rust-icu-locid")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_locid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dznvd1c5b02iilqm044q4hvar0sqibq1z46prqwjzwif61vpb0k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-litemap" ,rust-litemap-0.7)
        ("rust-tinystr" ,rust-tinystr-0.7)
        ("rust-writeable" ,rust-writeable-0.5)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "API for managing Unicode Language and Locale Identifiers")
    (description
     "This package provides API for managing Unicode Language and Locale Identifiers.")
    (license unknown-license!)))

(define-public rust-icu-locid-transform-1
  (package
    (name "rust-icu-locid-transform")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_locid_transform" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kmmi1kmj9yph6mdgkc7v3wz6995v7ly3n80vbg0zr78bp1iml81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-icu-locid" ,rust-icu-locid-1)
        ("rust-icu-locid-transform-data"
         ,rust-icu-locid-transform-data-1)
        ("rust-icu-provider" ,rust-icu-provider-1)
        ("rust-tinystr" ,rust-tinystr-0.7)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "API for Unicode Language and Locale Identifiers canonicalization")
    (description
     "This package provides API for Unicode Language and Locale Identifiers canonicalization.")
    (license unknown-license!)))

(define-public rust-icu-locid-transform-data-1
  (package
    (name "rust-icu-locid-transform-data")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_locid_transform_data" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vkgjixm0wzp2n3v5mw4j89ly05bg3lx96jpdggbwlpqi0rzzj7x"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "Data for the icu_locid_transform crate")
    (description
     "This package provides Data for the icu_locid_transform crate.")
    (license unknown-license!)))

(define-public rust-icu-normalizer-1
  (package
    (name "rust-icu-normalizer")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_normalizer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kx8qryp8ma8fw1vijbgbnf7zz9f2j4d14rw36fmjs7cl86kxkhr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-icu-collections" ,rust-icu-collections-1)
        ("rust-icu-normalizer-data"
         ,rust-icu-normalizer-data-1)
        ("rust-icu-properties" ,rust-icu-properties-1)
        ("rust-icu-provider" ,rust-icu-provider-1)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-utf16-iter" ,rust-utf16-iter-1)
        ("rust-utf8-iter" ,rust-utf8-iter-1)
        ("rust-write16" ,rust-write16-1)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "API for normalizing text into Unicode Normalization Forms")
    (description
     "This package provides API for normalizing text into Unicode Normalization Forms.")
    (license unknown-license!)))

(define-public rust-icu-normalizer-data-1
  (package
    (name "rust-icu-normalizer-data")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_normalizer_data" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05lmk0zf0q7nzjnj5kbmsigj3qgr0rwicnn5pqi9n7krmbvzpjpq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Data for the icu_normalizer crate")
    (description
     "This package provides Data for the icu_normalizer crate.")
    (license unknown-license!)))

(define-public rust-icu-properties-1
  (package
    (name "rust-icu-properties")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_properties" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xgf584rx10xc1p7zjr78k0n4zn3g23rrg6v2ln31ingcq3h5mlk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-icu-collections" ,rust-icu-collections-1)
        ("rust-icu-locid-transform"
         ,rust-icu-locid-transform-1)
        ("rust-icu-properties-data"
         ,rust-icu-properties-data-1)
        ("rust-icu-provider" ,rust-icu-provider-1)
        ("rust-tinystr" ,rust-tinystr-0.7)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Definitions for Unicode properties")
    (description
     "This package provides Definitions for Unicode properties.")
    (license unknown-license!)))

(define-public rust-icu-properties-data-1
  (package
    (name "rust-icu-properties-data")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_properties_data" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0scms7pd5a7yxx9hfl167f5qdf44as6r3bd8myhlngnxqgxyza37"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Data for the icu_properties crate")
    (description
     "This package provides Data for the icu_properties crate.")
    (license unknown-license!)))

(define-public rust-icu-provider-1
  (package
    (name "rust-icu-provider")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_provider" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nb8vvgw8dv2inqklvk05fs0qxzkw8xrg2n9vgid6y7gm3423m3f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-icu-locid" ,rust-icu-locid-1)
        ("rust-icu-provider-macros"
         ,rust-icu-provider-macros-1)
        ("rust-stable-deref-trait"
         ,rust-stable-deref-trait-1)
        ("rust-tinystr" ,rust-tinystr-0.7)
        ("rust-writeable" ,rust-writeable-0.5)
        ("rust-yoke" ,rust-yoke-0.7)
        ("rust-zerofrom" ,rust-zerofrom-0.1)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page "https://icu4x.unicode.org")
    (synopsis
     "Trait and struct definitions for the ICU data provider")
    (description
     "This package provides Trait and struct definitions for the ICU data provider.")
    (license unknown-license!)))

(define-public rust-icu-provider-macros-1
  (package
    (name "rust-icu-provider-macros")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "icu_provider_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mjs0w7fcm2lcqmbakhninzrjwqs485lkps4hz0cv3k36y9rxj0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page "https://icu4x.unicode.org")
    (synopsis "Proc macros for ICU data providers")
    (description
     "This package provides Proc macros for ICU data providers.")
    (license unknown-license!)))

(define-public rust-idna-1
  (package
    (name "rust-idna")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zlajvm2k3wy0ay8plr07w22hxkkmrxkffa6ah57ac6nci984vv8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-idna-adapter" ,rust-idna-adapter-1)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-utf8-iter" ,rust-utf8-iter-1))))
    (home-page "https://github.com/servo/rust-url/")
    (synopsis
     "IDNA (Internationalizing Domain Names in Applications) and Punycode")
    (description
     "This package provides IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (license (list license:expat license:asl2.0))))

(define-public rust-idna-adapter-1
  (package
    (name "rust-idna-adapter")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna_adapter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wggnkiivaj5lw0g0384ql2d7zk4ppkn3b1ry4n0ncjpr7qivjns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-icu-normalizer" ,rust-icu-normalizer-1)
        ("rust-icu-properties" ,rust-icu-properties-1))))
    (home-page
     "https://docs.rs/crate/idna_adapter/latest")
    (synopsis "Back end adapter for idna")
    (description
     "This package provides Back end adapter for idna.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-indexmap-2
  (package
    (name "rust-indexmap")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nmrwn8lbs19gkvhxaawffzbvrpyrb5y3drcrr645x957kz0fybh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-equivalent" ,rust-equivalent-1)
        ("rust-hashbrown" ,rust-hashbrown-0.15))))
    (home-page
     "https://github.com/indexmap-rs/indexmap")
    (synopsis
     "hash table with consistent order and fast iteration.")
    (description
     "This package provides a hash table with consistent order and fast iteration.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-input-0.9
  (package
    (name "rust-input")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "input" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1abmv1djhynihipjppgsmw6nbp6pcgzk8rzi4v6wmyci9990kp7v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-input-sys" ,rust-input-sys-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-udev" ,rust-udev-0.9))))
    (home-page
     "https://github.com/Drakulix/input.rs")
    (synopsis "libinput bindings for rust")
    (description
     "This package provides libinput bindings for rust.")
    (license license:expat)))

(define-public rust-input-sys-1
  (package
    (name "rust-input-sys")
    (version "1.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "input-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c4y24wf0jixi52js4f7cjspbgi0bzzaqfhn8m91qcq03i6mnkxx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/Drakulix/input.rs/tree/master/input-sys")
    (synopsis
     "Bindgen generated unsafe libinput wrapper")
    (description
     "This package provides Bindgen generated unsafe libinput wrapper.")
    (license license:expat)))

(define-public rust-instant-0.1
  (package
    (name "rust-instant")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "instant" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08h27kzvb5jw74mh0ajv0nv9ggwvgqm8ynjsn2sa9jsks4cjh970"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page
     "https://github.com/sebcrozet/instant")
    (synopsis
     "Unmaintained, consider using web-time instead - A partial replacement for std::time::Instant that works on WASM to")
    (description
     "This package provides Unmaintained, consider using web-time instead - A partial replacement for\nstd::time::Instant that works on WASM to.")
    (license license:bsd-3)))

(define-public rust-io-lifetimes-1
  (package
    (name "rust-io-lifetimes")
    (version "1.0.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "io-lifetimes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hph5lz4wd3drnn6saakwxr497liznpfnv70via6s0v8x6pbkrza"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-hermit-abi" ,rust-hermit-abi-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page
     "https://github.com/sunfishcode/io-lifetimes")
    (synopsis
     "low-level I/O ownership and borrowing library")
    (description
     "This package provides a low-level I/O ownership and borrowing library.")
    (license
     ;; (list license:asl2.0
     ;;       unknown-license!
     ;;       license:asl2.0
     ;;       license:expat)
     #f
     )))

(define-public rust-is-terminal-0.4
  (package
    (name "rust-is-terminal")
    (version "0.4.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "is-terminal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jwgjjz33kkmnwai3nsdk1pz9vb6gkqvw1d1vq7bs3q48kinh7r6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-hermit-abi" ,rust-hermit-abi-0.4)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page
     "https://github.com/sunfishcode/is-terminal")
    (synopsis
     "Test whether a given stream is a terminal")
    (description
     "This package provides Test whether a given stream is a terminal.")
    (license license:expat)))

(define-public rust-is-terminal-polyfill-1
  (package
    (name "rust-is-terminal-polyfill")
    (version "1.70.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "is_terminal_polyfill" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kwfgglh91z33kl0w5i338mfpa3zs0hidq5j4ny4rmjwrikchhvr"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/polyfill-rs/is_terminal_polyfill")
    (synopsis
     "Polyfill for `is_terminal` stdlib feature for use with older MSRVs")
    (description
     "This package provides Polyfill for `is_terminal` stdlib feature for use with older MSRVs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.72")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a8r61hbgw5kmscgj3g5pzg2ywlnswvljy0l592v0xdxlayz323a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like\nNode.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (description
     "This package provides Bindings for all JS global objects and functions in all JS environments like\nNode.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-knuffel-3
  (package
    (name "rust-knuffel")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "knuffel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04vl2xmdn280rcigv96v06a00v7gbxqggr0w9cqi2407qvfydgh4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-base64" ,rust-base64-0.21)
        ("rust-chumsky" ,rust-chumsky-0.9)
        ("rust-knuffel-derive" ,rust-knuffel-derive-3)
        ("rust-miette" ,rust-miette-5)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/tailhook/knuffel")
    (synopsis "Another KDL language implementation")
    (description
     "This package provides Another KDL language implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-knuffel-derive-3
  (package
    (name "rust-knuffel-derive")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "knuffel-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g98909l5wb1d1hcz61q53kvsmjadry2w3l47lg9dywwqib7z5wi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.4)
        ("rust-proc-macro-error"
         ,rust-proc-macro-error-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/tailhook/knuffel")
    (synopsis
     "A derive implementation for knuffel KDL parser")
    (description
     "This package provides a derive implementation for knuffel KDL parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libadwaita-0.7
  (package
    (name "rust-libadwaita")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libadwaita" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0is205jr9nc1ynmcm62dkvvm765myp5ay4xmcb1hcxjyp2gyw4c6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-gdk4" ,rust-gdk4-0.9)
        ("rust-gio" ,rust-gio-0.20)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-gtk4" ,rust-gtk4-0.9)
        ("rust-libadwaita-sys" ,rust-libadwaita-sys-0.7)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.20))))
    (home-page
     "https://world.pages.gitlab.gnome.org/Rust/libadwaita-rs/")
    (synopsis "Rust bindings for libadwaita")
    (description
     "This package provides Rust bindings for libadwaita.")
    (license license:expat)))

(define-public rust-libadwaita-sys-0.7
  (package
    (name "rust-libadwaita-sys")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libadwaita-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19pcp4zp9gsr8va2iz2isw18w6jg8b0wj37jw4wnc7fkpayxhi0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-gdk4-sys" ,rust-gdk4-sys-0.9)
        ("rust-gio-sys" ,rust-gio-sys-0.20)
        ("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-gobject-sys" ,rust-gobject-sys-0.20)
        ("rust-gtk4-sys" ,rust-gtk4-sys-0.9)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.20)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page
     "https://world.pages.gitlab.gnome.org/Rust/libadwaita-rs/")
    (synopsis "FFI bindings for libadwaita")
    (description
     "This package provides FFI bindings for libadwaita.")
    (license license:expat)))

(define-public rust-libdisplay-info-0.1
  (package
    (name "rust-libdisplay-info")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libdisplay-info" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "179qz5kmxcyfyasjs7dnykfqs7pmjfjhi3dqif53gwkxcxxd8vdv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libdisplay-info-derive"
         ,rust-libdisplay-info-derive-0.1)
        ("rust-libdisplay-info-sys"
         ,rust-libdisplay-info-sys-0.1)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page
     "https://github.com/Smithay/libdisplay-info-rs")
    (synopsis "EDID and DisplayID library")
    (description
     "This package provides EDID and @code{DisplayID} library.")
    (license license:expat)))

(define-public rust-libdisplay-info-derive-0.1
  (package
    (name "rust-libdisplay-info-derive")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libdisplay-info-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vpwss66rmhdd0f85c3nwjshddmiarf4iya5v13aacmp6q8d677a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/Smithay/libdisplay-info-rs")
    (synopsis
     "Utility crate for managing FFI bindings in libdisplay-info")
    (description
     "This package provides Utility crate for managing FFI bindings in libdisplay-info.")
    (license license:expat)))

(define-public rust-libdisplay-info-sys-0.1
  (package
    (name "rust-libdisplay-info-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libdisplay-info-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dn2q0vv0dv7wyq51ql22937badi0h9vqmn780gn4aw7lwgyr37a"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/Smithay/libdisplay-info-rs")
    (synopsis
     "Low-level bindings for libdisplay-info")
    (description
     "This package provides Low-level bindings for libdisplay-info.")
    (license license:expat)))

(define-public rust-libseat-0.2
  (package
    (name "rust-libseat")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libseat" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zlhr75vnqcl136h60c6pzj4kcvwylr43gjcnyjp6yk0v3wav82l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-errno" ,rust-errno-0.3)
        ("rust-libseat-sys" ,rust-libseat-sys-0.1)
        ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/PolyMeilex/libseat-rs")
    (synopsis "Safe libseat bindings")
    (description
     "This package provides Safe libseat bindings.")
    (license license:expat)))

(define-public rust-libseat-sys-0.1
  (package
    (name "rust-libseat-sys")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libseat-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0d2c7lbcl45rmpwy0nb3z94f6jam4ylxmddky1mis7w70dgcnw9n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/PolyMeilex/libseat-rs")
    (synopsis "libseat bindings")
    (description
     "This package provides libseat bindings.")
    (license license:expat)))

(define-public rust-libspa-0.8
  (package
    (name "rust-libspa")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libspa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         ;; "0000000000000000000000000000000000000000000000000000"
         "044qs48yl0llp2dmrgwxj9y1pgfy09i6fhq661zqqb9a3fwa9wv5"
         ))
       (patches (search-patches "rust-libspa-0.8.0-unrelease.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-cc" ,rust-cc-1)
        ("rust-convert-case" ,rust-convert-case-0.6)
        ("rust-cookie-factory" ,rust-cookie-factory-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libspa-sys" ,rust-libspa-sys-0.8)
        ("rust-nix" ,rust-nix-0.27)
        ("rust-nom" ,rust-nom-7)
        ("rust-system-deps" ,rust-system-deps-6))))
    (home-page "https://pipewire.org")
    (synopsis "Rust bindings for libspa")
    (description
     "This package provides Rust bindings for libspa.")
    (license license:expat)))

(define-public rust-libspa-sys-0.8
  (package
    (name "rust-libspa-sys")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libspa-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         ;; "0000000000000000000000000000000000000000000000000000"
         "07yh4i5grzbxkchg6dnxlwbdw2wm5jnd7ffbhl77jr0388b9f3dz"
         ))
       (patches (search-patches "rust-libspa-sys-0.8.0-unrelease.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.69)
        ("rust-cc" ,rust-cc-1)
        ("rust-system-deps" ,rust-system-deps-6))))
    (home-page "https://pipewire.org")
    (synopsis "Rust FFI bindings for libspa")
    (description
     "This package provides Rust FFI bindings for libspa.")
    (license license:expat)))

(define-public rust-linux-raw-sys-0.3
  (package
    (name "rust-linux-raw-sys")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linux-raw-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "068mbigb3frrxvbi5g61lx25kksy98f2qgkvc4xg8zxznwp98lzg"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/sunfishcode/linux-raw-sys")
    (synopsis
     "Generated bindings for Linux's userspace API")
    (description
     "This package provides Generated bindings for Linux's userspace API.")
    (license
     ;; (list license:asl2.0
     ;;       unknown-license!
     ;;       license:asl2.0
     ;;       license:expat)
     #f)))

(define-public rust-litemap-0.7
  (package
    (name "rust-litemap")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "litemap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0157lf44c3s2piqiwpppnynzzpv1rxyddl2z9l089hpwsjwb0g34"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis
     "key-value Map implementation based on a flat, sorted Vec.")
    (description
     "This package provides a key-value Map implementation based on a flat, sorted\nVec.")
    (license unknown-license!)))

(define-public rust-loom-0.7
  (package
    (name "rust-loom")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "loom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jpszf9qxv8ydpsm2h9vcyvxvyxcfkhmmfbylzd4gfbc0k40v7j1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-generator" ,rust-generator-0.8)
        ("rust-scoped-tls" ,rust-scoped-tls-1)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracing-subscriber"
         ,rust-tracing-subscriber-0.3))))
    (home-page "https://github.com/tokio-rs/loom")
    (synopsis
     "Permutation testing for concurrent code")
    (description
     "This package provides Permutation testing for concurrent code.")
    (license license:expat)))

(define-public rust-mac-notification-sys-0.6
  (package
    (name "rust-mac-notification-sys")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mac-notification-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14cgvhb2790fzsilwdw720m2pc2zzk0zcgbjgqbkgahp6x7z7s6w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-dirs-next" ,rust-dirs-next-2)
        ("rust-objc-foundation"
         ,rust-objc-foundation-0.1)
        ("rust-objc-id" ,rust-objc-id-0.1)
        ("rust-time" ,rust-time-0.3))))
    (home-page
     "https://github.com/h4llow3En/mac-notification-sys")
    (synopsis
     "Thin wrapper around macOS Notifications")
    (description
     "This package provides Thin wrapper around @code{macOS} Notifications.")
    (license license:expat)))

;; remove?
(define-public rust-memoffset-0.9
  (package
    (name "rust-memoffset")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memoffset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-1))))
    (home-page "https://github.com/Gilnaa/memoffset")
    (synopsis
     "offset_of functionality for Rust structs")
    (description
     "This package provides offset_of functionality for Rust structs.")
    (license license:expat)))

(define-public niri
  (package
    (name "niri")
    (version "0.1.10")
    (source
     ;; (origin
     ;;   (method url-fetch)
     ;;   (uri (crate-uri "niri" version))
     ;;   (file-name
     ;;    (string-append name "-" version ".tar.gz"))
     ;;   (sha256
     ;;    (base32
     ;;     "0000000000000000000000000000000000000000000000000000")))
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YaLTeR/niri")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11sjz3ckk8qw74h1ahgkx5yxjzndjzawqdg5d5s6y0l0rz3pkbbr"))
       (modules '((guix build utils)))
       (snippet
        '(begin (substitute* "Cargo.toml"
                  (("git = \"https://github.com/Smithay/smithay.git\"")
                   "")
                  (("# path = \"\\.\\./smithay\"")
                   "version = \"0.3.0\"")
                  (("# path = \"\\.\\./smithay/smithay-drm-extras\"")
                   "version = \"0.1.0\"")
                  (("git = \"https://gitlab.freedesktop.org/pipewire/pipewire-rs.git\"")
                   "version = \"0.8.0\"")))))

     )
    (build-system cargo-build-system)
    (arguments
     `(;; #:skip-build?
       ;; #t
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-approx" ,rust-approx-0.5)
        ("rust-arrayvec" ,rust-arrayvec-0.7)
        ("rust-async-channel" ,rust-async-channel-2)
        ("rust-async-io" ,rust-async-io-1)
        ("rust-atomic" ,rust-atomic-0.6)
        ("rust-bitflags" ,rust-bitflags-2)
        ("rust-bytemuck" ,rust-bytemuck-1)
        ("rust-calloop" ,rust-calloop-0.14)
        ("rust-clap" ,rust-clap-4)
        ("rust-directories" ,rust-directories-5)
        ("rust-drm-ffi" ,rust-drm-ffi-0.9)
        ("rust-fastrand" ,rust-fastrand-2)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-git-version" ,rust-git-version-0.3)
        ("rust-glam" ,rust-glam-0.29)
        ("rust-input" ,rust-input-0.9)
        ("rust-k9" ,rust-k9-0.12)
        ("rust-keyframe" ,rust-keyframe-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libdisplay-info"
         ,rust-libdisplay-info-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-niri-config" ,rust-niri-config-0.1)
        ("rust-niri-ipc" ,rust-niri-ipc-0.1)
        ("rust-notify-rust" ,rust-notify-rust-4)
        ("rust-ordered-float" ,rust-ordered-float-4)
        ("rust-pango" ,rust-pango-0.20)
        ("rust-pangocairo" ,rust-pangocairo-0.20)
        ("rust-pipewire" ,rust-pipewire-0.8)
        ("rust-png" ,rust-png-0.17)
        ("rust-portable-atomic" ,rust-portable-atomic-1)
        ("rust-profiling" ,rust-profiling-1)
        ("rust-proptest" ,rust-proptest-1)
        ("rust-proptest-derive"
         ,rust-proptest-derive-0.5)
        ("rust-sd-notify" ,rust-sd-notify-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-smithay" ,rust-smithay-0.3)
        ("rust-smithay-drm-extras"
         ,rust-smithay-drm-extras-0.1)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracing-subscriber"
         ,rust-tracing-subscriber-0.3)
        ("rust-tracy-client" ,rust-tracy-client-0.17)
        ("rust-url" ,rust-url-2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31)
        ("rust-xcursor" ,rust-xcursor-0.3)
        ("rust-xshell" ,rust-xshell-0.2)
        ("rust-zbus" ,rust-zbus-3)

        ;; xxx
        ("rust-libadwaita" ,rust-libadwaita-0.7))
       #:install-source? #f
       ;; #:phases (modify-phases %standard-phases
       ;;            (add-before 'package '))
       ))
    (native-inputs (list pkg-config))
    (inputs (list rust-smithay-0.3 rust-smithay-drm-extras-0.1
                  glib
                  cairo
                  pango
                  pipewire
                  clang
                  eudev libxkbcommon libseat libinput pixman mesa libdisplay-info))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public rust-niri-config-0.1
  (package
    (name "rust-niri-config")
    (version "0.1.10")
    (source
     ;; (origin
     ;;   (method url-fetch)
     ;;   (uri (crate-uri "niri-config" version))
     ;;   (file-name
     ;;    (string-append name "-" version ".tar.gz"))
     ;;   (sha256
     ;;    (base32
     ;;     "0000000000000000000000000000000000000000000000000000")))
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YaLTeR/niri")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11sjz3ckk8qw74h1ahgkx5yxjzndjzawqdg5d5s6y0l0rz3pkbbr")))
     )
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-csscolorparser" ,rust-csscolorparser-0.7)
        ("rust-k9" ,rust-k9-0.12)
        ("rust-knuffel" ,rust-knuffel-3)
        ("rust-miette" ,rust-miette-5)
        ("rust-niri-ipc" ,rust-niri-ipc-0.1)
        ("rust-pretty-assertions"
         ,rust-pretty-assertions-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-smithay" ,rust-smithay-0.3)
        ("rust-tracing" ,rust-tracing-0.1)
        ("rust-tracy-client" ,rust-tracy-client-0.17))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public rust-niri-ipc-0.1
  (package
    (name "rust-niri-ipc")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "niri-ipc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         ;; "0000000000000000000000000000000000000000000000000000"
         "0hj2yxs90xcs14mnj36q2y51n2n2s5qvlr97nwdds9mlsg5439aa"
         ))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-clap" ,rust-clap-4)
        ("rust-schemars" ,rust-schemars-0.8)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/YaLTeR/niri")
    (synopsis
     "Types and helpers for interfacing with the niri Wayland compositor")
    (description
     "This package provides Types and helpers for interfacing with the niri Wayland compositor.")
    (license license:gpl3+)))

;; (define-public rust-niri-visual-tests-0.1
;;   (package
;;     (name "rust-niri-visual-tests")
;;     (version "0.1.10")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "niri-visual-tests" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "0000000000000000000000000000000000000000000000000000"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-anyhow" ,rust-anyhow-1)
;;         ("rust-gtk4" ,rust-gtk4-0.9)
;;         ("rust-libadwaita" ,rust-libadwaita-0.7)
;;         ("rust-niri" ,rust-niri-0.1)
;;         ("rust-niri-config" ,rust-niri-config-0.1)
;;         ("rust-smithay" ,rust-smithay-0.3)
;;         ("rust-tracing" ,rust-tracing-0.1)
;;         ("rust-tracing-subscriber"
;;          ,rust-tracing-subscriber-0.3))))
;;     (home-page "")
;;     (synopsis "")
;;     (description "")
;;     (license #f)))

(define-public rust-notify-rust-4
  (package
    (name "rust-notify-rust")
    (version "4.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify-rust" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09i21wn6ky57p33b3sbgy5p8ckwvc7ffks1zmgadwd82m3gmwz42"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-mac-notification-sys"
         ,rust-mac-notification-sys-0.6)
        ("rust-serde" ,rust-serde-1)
        ("rust-tauri-winrt-notification"
         ,rust-tauri-winrt-notification-0.1)
        ("rust-zbus" ,rust-zbus-3))))
    (home-page
     "https://github.com/hoodie/notify-rust")
    (synopsis
     "Show desktop notifications (linux, bsd, mac). Pure Rust dbus client and server")
    (description
     "This package provides Show desktop notifications (linux, bsd, mac).  Pure Rust dbus client and server.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-enum-0.7
  (package
    (name "rust-num-enum")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num_enum" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yai0vafhy85mvhknzfqd7lm04hzaln7i5c599rhy8mj831kyqaf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-num-enum-derive"
         ,rust-num-enum-derive-0.7))))
    (home-page
     "https://github.com/illicitonion/num_enum")
    (synopsis
     "Procedural macros to make inter-operation between primitives and enums easier")
    (description
     "This package provides Procedural macros to make inter-operation between primitives and enums easier.")
    (license
     (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-num-enum-derive-0.7
  (package
    (name "rust-num-enum-derive")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num_enum_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mksna1jj87ydh146gn6jcqkvvs920c3dgh0p4f3xk184kpl865g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-crate"
         ,rust-proc-macro-crate-3)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/illicitonion/num_enum")
    (synopsis
     "Internal implementation details for ::num_enum (Procedural macros to make inter-operation between primitives and enums easier)")
    (description
     "This package provides Internal implementation details for ::num_enum (Procedural macros to make\ninter-operation between primitives and enums easier).")
    (license
     (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-objc2-app-kit-0.2
  (package
    (name "rust-objc2-app-kit")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-app-kit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zqyi5l1bm26j1bgmac9783ah36m5kcrxlqp5carglnpwgcrms74"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-core-data"
         ,rust-objc2-core-data-0.2)
        ("rust-objc2-core-image"
         ,rust-objc2-core-image-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2)
        ("rust-objc2-quartz-core"
         ,rust-objc2-quartz-core-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the AppKit framework")
    (description
     "This package provides Bindings to the @code{AppKit} framework.")
    (license license:expat)))

(define-public rust-objc2-cloud-kit-0.2
  (package
    (name "rust-objc2-cloud-kit")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-cloud-kit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02dhjvmcq8c2bwj31jx423jygif1scs9f0lmlab0ayhw75b3ppbl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-core-location"
         ,rust-objc2-core-location-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the CloudKit framework")
    (description
     "This package provides Bindings to the @code{CloudKit} framework.")
    (license license:expat)))

(define-public rust-objc2-contacts-0.2
  (package
    (name "rust-objc2-contacts")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-contacts" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12a8m927xrrxa54xhqhqnkkl1a6l07pyrpnqfk9jz09kkh755zx5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Contacts framework")
    (description
     "This package provides Bindings to the Contacts framework.")
    (license license:expat)))

(define-public rust-objc2-core-data-0.2
  (package
    (name "rust-objc2-core-data")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-core-data" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vvk8zjylfjjj04dzawydmqqz5ajvdkhf22cnb07ihbiw14vyzv1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the CoreData framework")
    (description
     "This package provides Bindings to the @code{CoreData} framework.")
    (license license:expat)))

(define-public rust-objc2-core-image-0.2
  (package
    (name "rust-objc2-core-image")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-core-image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "102csfb82zi2sbzliwsfd589ckz0gysf7y6434c9zj97lmihj9jm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2)
        ("rust-objc2-metal" ,rust-objc2-metal-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the CoreImage framework")
    (description
     "This package provides Bindings to the @code{CoreImage} framework.")
    (license license:expat)))

(define-public rust-objc2-core-location-0.2
  (package
    (name "rust-objc2-core-location")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-core-location" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10apgsrigqryvi4rcc0f6yfjflvrl83f4bi5hkr48ck89vizw300"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-contacts" ,rust-objc2-contacts-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Bindings to the CoreLocation framework")
    (description
     "This package provides Bindings to the @code{CoreLocation} framework.")
    (license license:expat)))

(define-public rust-objc2-encode-4
  (package
    (name "rust-objc2-encode")
    (version "4.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-encode" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y7hjg4k828zhn4fjnbidrz3vzw4llk9ldy92drj47ydjc9yg4bq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Objective-C type-encoding representation and parsing")
    (description
     "This package provides Objective-C type-encoding representation and parsing.")
    (license license:expat)))

(define-public rust-objc2-foundation-0.2
  (package
    (name "rust-objc2-foundation")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a6mi77jsig7950vmx9ydvsxaighzdiglk5d229k569pvajkirhf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-dispatch" ,rust-dispatch-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-objc2" ,rust-objc2-0.5))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Foundation framework")
    (description
     "This package provides Bindings to the Foundation framework.")
    (license license:expat)))

(define-public rust-objc2-link-presentation-0.2
  (package
    (name "rust-objc2-link-presentation")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-link-presentation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "160k4qh00yrx57dabn3hzas4r98kmk9bc0qsy1jvwday3irax8d1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-app-kit" ,rust-objc2-app-kit-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Bindings to the LinkPresentation framework")
    (description
     "This package provides Bindings to the @code{LinkPresentation} framework.")
    (license license:expat)))

(define-public rust-objc2-metal-0.2
  (package
    (name "rust-objc2-metal")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-metal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mmdga66qpxrcfq3gxxhysfx3zg1hpx4z886liv3j0pnfq9bl36x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Metal framework")
    (description
     "This package provides Bindings to the Metal framework.")
    (license license:expat)))

(define-public rust-objc2-quartz-core-0.2
  (package
    (name "rust-objc2-quartz-core")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-quartz-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ynw8819c36l11rim8n0yzk0fskbzrgaqayscyqi8swhzxxywaz4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2)
        ("rust-objc2-metal" ,rust-objc2-metal-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Bindings to the QuartzCore/CoreAnimation framework")
    (description
     "This package provides Bindings to the @code{QuartzCore/CoreAnimation} framework.")
    (license license:expat)))

(define-public rust-objc2-symbols-0.2
  (package
    (name "rust-objc2-symbols")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-symbols" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p04hjkxan18g2b7h9n2n8xxsvazapv2h6mfmmdk06zc7pz4ws0a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the Symbols framework")
    (description
     "This package provides Bindings to the Symbols framework.")
    (license license:expat)))

(define-public rust-objc2-ui-kit-0.2
  (package
    (name "rust-objc2-ui-kit")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-ui-kit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vrb5r8z658l8c19bx78qks8c5hg956544yirf8npk90idwldfxq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-cloud-kit"
         ,rust-objc2-cloud-kit-0.2)
        ("rust-objc2-core-data"
         ,rust-objc2-core-data-0.2)
        ("rust-objc2-core-image"
         ,rust-objc2-core-image-0.2)
        ("rust-objc2-core-location"
         ,rust-objc2-core-location-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2)
        ("rust-objc2-link-presentation"
         ,rust-objc2-link-presentation-0.2)
        ("rust-objc2-quartz-core"
         ,rust-objc2-quartz-core-0.2)
        ("rust-objc2-symbols" ,rust-objc2-symbols-0.2)
        ("rust-objc2-uniform-type-identifiers"
         ,rust-objc2-uniform-type-identifiers-0.2)
        ("rust-objc2-user-notifications"
         ,rust-objc2-user-notifications-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis "Bindings to the UIKit framework")
    (description
     "This package provides Bindings to the UIKit framework.")
    (license license:expat)))

(define-public rust-objc2-uniform-type-identifiers-0.2
  (package
    (name "rust-objc2-uniform-type-identifiers")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri
             "objc2-uniform-type-identifiers"
             version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ziv4wkbxcaw015ypg0q49ycl7m14l3x56mpq2k1rznv92bmzyj4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Bindings to the UniformTypeIdentifiers framework")
    (description
     "This package provides Bindings to the @code{UniformTypeIdentifiers} framework.")
    (license license:expat)))

(define-public rust-objc2-user-notifications-0.2
  (package
    (name "rust-objc2-user-notifications")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc2-user-notifications" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cscv2w3vxzaslz101ddv0z9ycrrs4ayikk4my4qd3im8bvcpkvn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-block2" ,rust-block2-0.5)
        ("rust-objc2" ,rust-objc2-0.5)
        ("rust-objc2-core-location"
         ,rust-objc2-core-location-0.2)
        ("rust-objc2-foundation"
         ,rust-objc2-foundation-0.2))))
    (home-page "https://github.com/madsmtm/objc2")
    (synopsis
     "Bindings to the UserNotifications framework")
    (description
     "This package provides Bindings to the @code{UserNotifications} framework.")
    (license license:expat)))

(define-public rust-object-0.36
  (package
    (name "rust-object")
    (version "0.36.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gk8lhbs229c68lapq6w6qmnm4jkj48hrcw5ilfyswy514nhmpxf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis
     "unified interface for reading and writing object file formats.")
    (description
     "This package provides a unified interface for reading and writing object file\nformats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ordered-float-4
  (package
    (name "rust-ordered-float")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-float" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ppqpjrri5r5vdz06na24d00cjaz67ambd1hcq13iy8vf3wy2pn6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/reem/rust-ordered-float")
    (synopsis
     "Wrappers for total ordering on floats")
    (description
     "This package provides Wrappers for total ordering on floats.")
    (license license:expat)))

(define-public rust-pangocairo-0.20
  (package
    (name "rust-pangocairo")
    (version "0.20.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pangocairo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ph5wjg894kfasrx5anriyj1qw2f786lb2mza83k7r05vn6cm4a2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-rs" ,rust-cairo-rs-0.20)
        ("rust-glib" ,rust-glib-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango" ,rust-pango-0.20)
        ("rust-pangocairo-sys" ,rust-pangocairo-sys-0.20))))
    (home-page "https://gtk-rs.org/")
    (synopsis
     "Rust bindings for the PangoCairo library")
    (description
     "This package provides Rust bindings for the @code{PangoCairo} library.")
    (license license:expat)))

(define-public rust-pangocairo-sys-0.20
  (package
    (name "rust-pangocairo-sys")
    (version "0.20.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pangocairo-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vihxi2hqlbnz8hv8nain5y72443m6xgszfykfj4i9lf4mcxj3my"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.20)
        ("rust-glib-sys" ,rust-glib-sys-0.20)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-pango-sys" ,rust-pango-sys-0.20)
        ("rust-system-deps" ,rust-system-deps-7))))
    (home-page "https://gtk-rs.org/")
    (synopsis "FFI bindings to PangoCairo")
    (description
     "This package provides FFI bindings to @code{PangoCairo}.")
    (license license:expat)))

(define-public rust-parking-2
  (package
    (name "rust-parking")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/smol-rs/parking")
    (synopsis "Thread parking and unparking")
    (description
     "This package provides Thread parking and unparking.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pipewire-0.8
  (let ((commit "86df39190c0ab67444666a42908f7e8c1344e24a")
        (revision "0"))
    (package
      (name "rust-pipewire")
      (version "0.8.0"
               ;; (git-version "0.8.0" revision commit)
               )
      (source
       (origin
         (method url-fetch)
         (uri (crate-uri "pipewire" version))
         (file-name
          (string-append name "-" version ".tar.gz"))
         (sha256
          (base32
           ;; "0000000000000000000000000000000000000000000000000000"
           "1nldg1hz4v0qr26lzdxqpvrac4zbc3pb6436sl392425bjx4brh8"
           ))
         (patches (search-patches "rust-pipewire-0.8.0-unrelease.patch"))
         )
       ;; (origin
       ;;   (method git-fetch)
       ;;   (uri (git-reference
       ;;         (url "https://gitlab.freedesktop.org/pipewire/pipewire-rs.git")
       ;;         (commit commit)))
       ;;   (file-name (git-file-name name version))
       ;;   (sha256
       ;;    (base32 "1n8ngihd75i3vgbfnfhpj8mi6shlrhbhvwfyms14m03613jp37lj")))
       )
      (build-system cargo-build-system)
      (arguments
       `(#:skip-build?
         #t
         #:cargo-inputs
         (("rust-anyhow" ,rust-anyhow-1)
          ("rust-bitflags" ,rust-bitflags-2)
          ("rust-libc" ,rust-libc-0.2)
          ("rust-libspa" ,rust-libspa-0.8)
          ("rust-libspa-sys" ,rust-libspa-sys-0.8)
          ("rust-nix" ,rust-nix-0.27)
          ("rust-once-cell" ,rust-once-cell-1)
          ("rust-pipewire-sys" ,rust-pipewire-sys-0.8)
          ("rust-thiserror" ,rust-thiserror-1))))
      (home-page "https://pipewire.org")
      (synopsis "Rust bindings for PipeWire")
      (description
       "This package provides Rust bindings for @code{PipeWire}.")
      (license license:expat))))

(define-public rust-pipewire-sys-0.8
  (package
    (name "rust-pipewire-sys")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pipewire-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         ;; "0000000000000000000000000000000000000000000000000000"
         "04hiy3rl8v3j2dfzp04gr7r8l5azzqqsvqdzwa7sipdij27ii7l4"
         ))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.69)
        ("rust-libspa-sys" ,rust-libspa-sys-0.8)
        ("rust-system-deps" ,rust-system-deps-6))))
    (home-page "https://pipewire.org")
    (synopsis "Rust FFI bindings for PipeWire")
    (description
     "This package provides Rust FFI bindings for @code{PipeWire}.")
    (license license:expat)))

(define-public rust-pixman-0.1
  (package
    (name "rust-pixman")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pixman" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dji0jgvhj63fnyndzp769svhn63lcvihp297bjg857c1gd28jnj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-drm-fourcc" ,rust-drm-fourcc-2)
        ("rust-paste" ,rust-paste-1)
        ("rust-pixman-sys" ,rust-pixman-sys-0.1)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page
     "https://github.com/cmeissl/pixman-rs")
    (synopsis
     "Pixman is a low-level software library for pixel manipulation, providing features such as image compositing and trapezoid rasterization")
    (description
     "This package provides Pixman is a low-level software library for pixel manipulation, providing\nfeatures such as image compositing and trapezoid rasterization.")
    (license license:expat)))

(define-public rust-pixman-sys-0.1
  (package
    (name "rust-pixman-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pixman-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nja8kc7zs1w4lhllvsgssa0b07n4cgwb0zyvqapj7g8i4z4i851"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/cmeissl/pixman-rs")
    (synopsis
     "Pixman is a low-level software library for pixel manipulation, providing features such as image compositing and trapezoid rasterization")
    (description
     "This package provides Pixman is a low-level software library for pixel manipulation, providing\nfeatures such as image compositing and trapezoid rasterization.")
    (license license:expat)))

(define-public rust-png-0.17
  (package
    (name "rust-png")
    (version "0.17.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w130qw3cngzppxk1yp3ls2pbw3f0spbzhkbarbnlnm06imd9yaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-crc32fast" ,rust-crc32fast-1)
        ("rust-fdeflate" ,rust-fdeflate-0.3)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.8))))
    (home-page
     "https://github.com/image-rs/image-png")
    (synopsis
     "PNG decoding and encoding library in pure Rust")
    (description
     "This package provides PNG decoding and encoding library in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pretty-assertions-1
  (package
    (name "rust-pretty-assertions")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pretty_assertions" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v8iq35ca4rw3rza5is3wjxwsf88303ivys07anc5yviybi31q9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-diff" ,rust-diff-0.1)
        ("rust-yansi" ,rust-yansi-1))))
    (home-page
     "https://github.com/rust-pretty-assertions/rust-pretty-assertions")
    (synopsis
     "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs")
    (description
     "This package provides Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding\ncolorful diffs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-crate-1
  (package
    (name "rust-proc-macro-crate")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-crate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "069r1k56bvgk0f58dm5swlssfcp79im230affwk6d9ck20g04k3z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-once-cell" ,rust-once-cell-1)
        ("rust-toml-edit" ,rust-toml-edit-0.19))))
    (home-page
     "https://github.com/bkchr/proc-macro-crate")
    (synopsis
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (description
     "This package provides Replacement for crate (macro_rules keyword) in proc-macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-crate-3
  (package
    (name "rust-proc-macro-crate")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-crate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yzsqnavb3lmrcsmbrdjfrky9vcbl46v59xi9avn0796rb3likwf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-toml-edit" ,rust-toml-edit-0.22))))
    (home-page
     "https://github.com/bkchr/proc-macro-crate")
    (synopsis
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (description
     "This package provides Replacement for crate (macro_rules keyword) in proc-macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-profiling-1
  (package
    (name "rust-profiling")
    (version "1.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "profiling" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kcz2xzg4qx01r5az8cf9ffjasi2srj56sna32igddh0vi7cggdg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-profiling-procmacros"
         ,rust-profiling-procmacros-1)
        ("rust-tracy-client" ,rust-tracy-client-0.17))))
    (home-page
     "https://github.com/aclysma/profiling")
    (synopsis
     "This crate provides a very thin abstraction over other profiler crates")
    (description
     "This crate provides a very thin abstraction over other profiler crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-profiling-procmacros-1
  (package
    (name "rust-profiling-procmacros")
    (version "1.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "profiling-procmacros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c7y2k4mz5dp2ksj1h4zbxsxq4plmjzccscdaml3h1pizdh2wpx6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/aclysma/profiling")
    (synopsis
     "This crate provides a very thin abstraction over other profiler crates")
    (description
     "This crate provides a very thin abstraction over other profiler crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proptest-derive-0.5
  (package
    (name "rust-proptest-derive")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proptest-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xzwq21x39i46kbp3af2xzkn2hs0k9x3g6l53m3qfyrlb9sgzxvg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://proptest-rs.github.io/proptest/proptest-derive/index.html")
    (synopsis
     "Custom-derive for the Arbitrary trait of proptest.")
    (description
     "This package provides Custom-derive for the Arbitrary trait of proptest.")
    (license (list license:expat license:asl2.0))))

(define-public rust-redox-syscall-0.5
  (package
    (name "rust-redox-syscall")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_syscall" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07vpgfr6a04k0x19zqr1xdlqm6fncik3zydbdi3f5g3l5k7zwvcv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/syscall")
    (synopsis
     "Rust library to access raw Redox system calls")
    (description
     "This package provides a Rust library to access raw Redox system calls.")
    (license license:expat)))

(define-public rust-redox-users-0.4
  (package
    (name "rust-redox-users")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_users" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hya2cxx6hxmjfxzv9n8rjl5igpychav7zfi1f81pz6i4krry05s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.2)
        ("rust-libredox" ,rust-libredox-0.1)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/users")
    (synopsis
     "Rust library to access Redox users and groups functionality")
    (description
     "This package provides a Rust library to access Redox users and groups\nfunctionality.")
    (license license:expat)))

(define-public rust-regex-1
  (package
    (name "rust-regex")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "148i41mzbx8bmq32hsj1q4karkzzx5m60qza6gdw4pdc9qdyyi5m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-1)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-regex-automata" ,rust-regex-automata-0.4)
        ("rust-regex-syntax" ,rust-regex-syntax-0.8))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis
     "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.")
    (description
     "This package provides An implementation of regular expressions for Rust.  This implementation uses\nfinite automata and guarantees linear time matching on all inputs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-automata-0.1
  (package
    (name "rust-regex-automata")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-automata" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ci1hvbzhrfby5fdpf4ganhf7kla58acad9i1ff1p34dzdrhs8vc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-regex-syntax" ,rust-regex-syntax-0.6))))
    (home-page
     "https://github.com/rust-lang/regex/tree/master/regex-automata")
    (synopsis
     "Automata construction and matching using regular expressions")
    (description
     "This package provides Automata construction and matching using regular expressions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-regex-syntax-0.6
  (package
    (name "rust-regex-syntax")
    (version "0.6.29")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qgj49vm6y3zn1hi09x91jvgkl2b1fiaq402skj83280ggfwcqpi"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/rust-lang/regex/tree/master/regex-syntax")
    (synopsis "regular expression parser.")
    (description
     "This package provides a regular expression parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustc-version-0.4
  (package
    (name "rust-rustc-version")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc_version" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-semver" ,rust-semver-1))))
    (home-page
     "https://github.com/djc/rustc-version-rs")
    (synopsis
     "library for querying the version of a installed rustc compiler")
    (description
     "This package provides a library for querying the version of a installed rustc\ncompiler.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustix-0.37
  (package
    (name "rust-rustix")
    (version "0.37.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lidfswa8wbg358yrrkhfvsw0hzlvl540g4lwqszw09sg8vcma7y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-errno" ,rust-errno-0.3)
        ("rust-io-lifetimes" ,rust-io-lifetimes-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.3)
        ("rust-windows-sys" ,rust-windows-sys-0.48))))
    (home-page
     "https://github.com/bytecodealliance/rustix")
    (synopsis
     "Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls")
    (description
     "This package provides Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls.")
    (license
     (list license:asl2.0
                                        ;unknown-license!
           license:asl2.0
           license:expat))))

(define-public rust-rustix-0.38
  (package
    (name "rust-rustix")
    (version "0.38.38")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ap3q9b90lnp1razrh4wdnfs0icrs2mplmzb7qlm53jkwqlh49ma"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-errno" ,rust-errno-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.4)
        ("rust-windows-sys" ,rust-windows-sys-0.52))))
    (home-page
     "https://github.com/bytecodealliance/rustix")
    (synopsis
     "Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls")
    (description
     "This package provides Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls.")
    (license
     (list license:asl2.0
                                        ;unknown-license!
           license:asl2.0
           license:expat))))

(define-public rust-rustversion-1
  (package
    (name "rust-rustversion")
    (version "1.0.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustversion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j2207vmgrcxwwwvknfn3lwv4i8djhjnxlvwdnz8bwijqqmrz08f"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/dtolnay/rustversion")
    (synopsis
     "Conditional compilation according to rustc compiler version")
    (description
     "This package provides Conditional compilation according to rustc compiler version.")
    (license (list license:expat license:asl2.0))))

(define-public rust-scoped-tls-1
  (package
    (name "rust-scoped-tls")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scoped-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/alexcrichton/scoped-tls")
    (synopsis
     "Library implementation of the standard library's old `scoped_thread_local!`\nmacro for providing scoped access to thread local storage (TLS) so any type can\nbe stored into TLS.")
    (description
     "This package provides Library implementation of the standard library's old `scoped_thread_local!`\nmacro for providing scoped access to thread local storage (TLS) so any type can\nbe stored into TLS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sd-notify-0.4
  (package
    (name "rust-sd-notify")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sd-notify" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0la4d28ym4rarm8bax07yh9f5r0jb2iqxwmjz00ffgirgxghrqhv"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/lnicola/sd-notify")
    (synopsis
     "Lightweight crate for systemd service state notifications")
    (description
     "This package provides Lightweight crate for systemd service state notifications.")
    (license (list license:expat license:asl2.0))))

;; (define-public rust-semver-1
;;   (package
;;     (name "rust-semver")
;;     (version "1.0.23")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "semver" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "12wqpxfflclbq4dv8sa6gchdh92ahhwn4ci1ls22wlby3h57wsb1"))))
;;     (build-system cargo-build-system)
;;     (arguments `(#:skip-build? #t))
;;     (home-page "https://github.com/dtolnay/semver")
;;     (synopsis
;;      "Parser and evaluator for Cargo's flavor of Semantic Versioning")
;;     (description
;;      "This package provides Parser and evaluator for Cargo's flavor of Semantic Versioning.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-1
;;   (package
;;     (name "rust-serde")
;;     (version "1.0.214")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1danzh1zw9pg10y3bg0b7bvbkqbk5dfpiwchg2ni4757mj9k2p7m"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-serde-derive" ,rust-serde-derive-1))))
;;     (home-page "https://serde.rs")
;;     (synopsis
;;      "generic serialization/deserialization framework")
;;     (description
;;      "This package provides a generic serialization/deserialization framework.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-derive-1
;;   (package
;;     (name "rust-serde-derive")
;;     (version "1.0.214")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde_derive" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "0rkp2idkb2p9s96fpqhlzp01qiby63wf1p2wc3x2hph93xw3ylny"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2))))
;;     (home-page "https://serde.rs")
;;     (synopsis
;;      "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
;;     (description
;;      "This package provides Macros 1.1 implementation of #[derive(Serialize, Deserialize)].")
;;     (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.132")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00yv8vyn1qiplziswm1vwam4a0xs1rfr162q75njc85kyjpvy9np"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-itoa" ,rust-itoa-1)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-ryu" ,rust-ryu-1)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "JSON serialization file format")
    (description
     "This package provides a JSON serialization file format.")
    (license (list license:expat license:asl2.0))))

;; (define-public rust-serde-spanned-0.6
;;   (package
;;     (name "rust-serde-spanned")
;;     (version "0.6.8")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde_spanned" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1q89g70azwi4ybilz5jb8prfpa575165lmrffd49vmcf76qpqq47"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-serde" ,rust-serde-1))))
;;     (home-page "https://github.com/toml-rs/toml")
;;     (synopsis "Serde-compatible spanned Value")
;;     (description
;;      "This package provides Serde-compatible spanned Value.")
;;     (license (list license:expat license:asl2.0))))

;; (define-public rust-signal-hook-registry-1
;;   (package
;;     (name "rust-signal-hook-registry")
;;     (version "1.4.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "signal-hook-registry" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1cb5akgq8ajnd5spyn587srvs4n26ryq0p78nswffwhv46sf1sd9"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-libc" ,rust-libc-0.2))))
;;     (home-page
;;      "https://github.com/vorner/signal-hook")
;;     (synopsis "Backend crate for signal-hook")
;;     (description
;;      "This package provides Backend crate for signal-hook.")
;;     (license (list license:asl2.0 license:expat))))

;; (define-public rust-slab-0.4
;;   (package
;;     (name "rust-slab")
;;     (version "0.4.9")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "slab" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "0rxvsgir0qw5lkycrqgb1cxsvxzjv9bmx73bk5y42svnzfba94lg"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-autocfg" ,rust-autocfg-1))))
;;     (home-page "https://github.com/tokio-rs/slab")
;;     (synopsis
;;      "Pre-allocated storage for a uniform data type")
;;     (description
;;      "This package provides Pre-allocated storage for a uniform data type.")
;;     (license license:expat)))

(define-public rust-smallvec-1
  (package
    (name "rust-smallvec")
    (version "1.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rsw5samawl3wsw6glrsb127rx6sh89a8wyikicw6dkdcjd1lpiw"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/servo/rust-smallvec")
    (synopsis
     "'Small vector' optimization: store up to a small number of items on the stack")
    (description
     "This package provides Small vector optimization: store up to a small number of items on the stack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smawk-0.3
  (package
    (name "rust-smawk")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smawk" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0344z1la39incggwn6nl45k8cbw2x10mr5j0qz85cdz9np0qihxp"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/mgeisler/smawk")
    (synopsis
     "Functions for finding row-minima in a totally monotone matrix")
    (description
     "This package provides functions for finding row-minima in a totally monotone\nmatrix.")
    (license license:expat)))

(define-public rust-fps-ticker-1
  (package
    (name "rust-fps-ticker")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fps_ticker" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06cj5c5rk5grm2ajh4sabcppxr1h57gxfqacvi5psxb9zw2lj5py"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mitchmindtree/fps_ticker")
    (synopsis
     "simple crate for measuring the average, minimum and maximum frame rate over a window of time.")
    (description
     "This package provides a simple crate for measuring the average, minimum and
maximum frame rate over a window of time.")
    (license (list license:expat license:asl2.0))))


(define-public rust-lz4-flex-0.10
  (package
    (name "rust-lz4-flex")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lz4_flex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10sgbj93sagbl0ngzqvnlkldzbfz5vnzr7fry8sgssy299cp534b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-twox-hash" ,rust-twox-hash-1))))
    (home-page "https://github.com/pseitz/lz4_flex")
    (synopsis "Fastest LZ4 implementation in Rust, no unsafe by default")
    (description
     "This package provides Fastest LZ4 implementation in Rust, no unsafe by default.")
    (license license:expat)))

(define-public rust-puffin-0.16
  (package
    (name "rust-puffin")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "puffin" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08ass1hfdcq86y7dywa1jylzq57la95rgpcmd6yx82hs9symlhkn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-instant" ,rust-instant-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-lz4-flex" ,rust-lz4-flex-0.10)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-ruzstd" ,rust-ruzstd-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zstd" ,rust-zstd-0.12))))
    (home-page "https://github.com/EmbarkStudios/puffin")
    (synopsis "Simple instrumentation profiler for games")
    (description
     "This package provides Simple instrumentation profiler for games.")
    (license (list license:expat license:asl2.0))))

(define-public rust-puffin-http-0.13
  (package
    (name "rust-puffin-http")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "puffin_http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14w1ihjlv48mpbh114yvgixdqdnzzipnmsg158l3v49m1ihgrgqk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-puffin" ,rust-puffin-0.16))
       #:cargo-development-inputs (("rust-simple-logger" ,rust-simple-logger-2))))
    (home-page "https://github.com/EmbarkStudios/puffin")
    (synopsis "TCP server/client for puffin profiler data")
    (description
     "This package provides TCP server/client for puffin profiler data.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-subscriber-0.1
  (package
    (name "rust-wgpu-subscriber")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-subscriber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09zdjmi3dhy4ff3dq4260nf6kl5cslfhs2xxgdbnxn40ch6mp5ci"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-thread-id" ,rust-thread-id-3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-log" ,rust-tracing-log-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.2))))
    (home-page "https://github.com/gfx-rs/wgpu")
    (synopsis "WebGPU tracing subscribers")
    (description "This package provides @code{WebGPU} tracing subscribers.")
    (license license:mpl2.0)))

(define-public rust-wgpu-types-0.15
  (package
    (name "rust-wgpu-types")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "047iysi1v6yznrfplgp08jyr353s8pg2zqqd5jq0rl0b3c94wi1j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU types")
    (description "This package provides @code{WebGPU} types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-renderdoc-sys-0.7
  (package
    (name "rust-renderdoc-sys")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "renderdoc-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mx1crv83mwmfl7yvhnpmhjb01fx5yd9f3f2gpwlnb1518gjsf7i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/ebkalderon/renderdoc-rs/tree/master/renderdoc-sys")
    (synopsis "Low-level bindings to the RenderDoc API")
    (description
     "This package provides Low-level bindings to the @code{RenderDoc} API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-range-alloc-0.1
  (package
    (name "rust-range-alloc")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "range-alloc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1azfwh89nd4idj0s272qgmw3x1cj6m7d3f44b2la02wzvkyrk2lw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/gfx-rs/range-alloc")
    (synopsis "Generic range allocator")
    (description "This package provides Generic range allocator.")
    (license (list license:expat license:asl2.0))))

(define-public rust-metal-0.24
  (package
    (name "rust-metal")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "metal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q6h0a20003db7h77xbv37dwwpc2wx6lsfvs08nli0b73xfka4fy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-block" ,rust-block-0.1)
                       ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
                       ("rust-dispatch" ,rust-dispatch-0.2)
                       ("rust-foreign-types" ,rust-foreign-types-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-objc" ,rust-objc-0.2))))
    (home-page "https://github.com/gfx-rs/metal-rs")
    (synopsis "Rust bindings for Metal")
    (description "This package provides Rust bindings for Metal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-khronos-egl-4
  (package
    (name "rust-khronos-egl")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "khronos-egl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qqm42ix278w72snhss8sw8kq4y8c11z4h4xrdqvikhb3nym48wc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/timothee-haudebourg/khronos-egl")
    (synopsis "Rust bindings for EGL")
    (description "This package provides Rust bindings for EGL.")
    (license (list license:expat license:asl2.0))))

(define-public rust-com-rs-0.2
  (package
    (name "rust-com-rs")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "com-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hk6051kwpabjs2dx32qkkpy0xrliahpqfh9df292aa0fv2yshxz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Eljay/com-rs")
    (synopsis "Deprecated. Use the `com` crate instead")
    (description
     "This package provides Deprecated.  Use the `com` crate instead.")
    (license (list license:expat license:asl2.0))))

(define-public rust-hassle-rs-0.9
  (package
    (name "rust-hassle-rs")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hassle-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11gvc8z6m8s4rfry2fsj7lh75n53yfrjr12kzi2p7336i5hiqq4h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-com-rs" ,rust-com-rs-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-widestring" ,rust-widestring-0.5)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Traverse-Research/hassle-rs")
    (synopsis
     "HLSL compiler library, this crate provides an FFI layer and idiomatic rust wrappers for the new DXC HLSL compiler and validator")
    (description
     "This package provides HLSL compiler library, this crate provides an FFI layer and idiomatic rust
wrappers for the new DXC HLSL compiler and validator.")
    (license license:expat)))

(define-public rust-gpu-descriptor-types-0.1
  (package
    (name "rust-gpu-descriptor-types")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-descriptor-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "135pp1b3bzyr7bfnb30rf9pkgy61h75w0jabi8fpw2q9dxpb7w3b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis "Core types of gpu-descriptor crate")
    (description "This package provides Core types of gpu-descriptor crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-descriptor-0.2
  (package
    (name "rust-gpu-descriptor")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-descriptor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b38pi460ajx8ksb61zxardwkpa27qgz8fpm252mczlfrqddy4fc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-gpu-descriptor-types" ,rust-gpu-descriptor-types-0.1)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis
     "Implementation agnostic descriptor allocator for Vulkan like APIs")
    (description
     "This package provides Implementation agnostic descriptor allocator for Vulkan like APIs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-chlorine-1
  (package
    (name "rust-chlorine")
    (version "1.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chlorine" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jcsm5bfikdw0q1ha321qislhb8p2l8nazadcvvqx9vckxbff40y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Lokathor/chlorine")
    (synopsis "Just the C types for `no_std`, but builds faster")
    (description
     "This package provides Just the C types for `no_std`, but builds faster.")
    (license (list license:zlib license:asl2.0 license:expat))))

(define-public rust-imgui-sys-0.10
  (package
    (name "rust-imgui-sys")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "imgui-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nqa4msiqip1vs8ciw4avlq6xzmk328571zrcnqr7hmq8fzylb31"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-chlorine" ,rust-chlorine-1)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/imgui-rs/imgui-rs")
    (synopsis "Raw FFI bindings to dear imgui")
    (description "This package provides Raw FFI bindings to dear imgui.")
    (license (list license:expat license:asl2.0))))

(define-public rust-imgui-0.10
  (package
    (name "rust-imgui")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "imgui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1g11074q3s23igmhqfdgs1mb54lpvn7gdab38scrqz94j351ksic"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-imgui-sys" ,rust-imgui-sys-0.10)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-parking-lot" ,rust-parking-lot-0.12))))
    (home-page "https://github.com/imgui-rs/imgui-rs")
    (synopsis "High-level Rust bindings to dear imgui")
    (description
     "This package provides High-level Rust bindings to dear imgui.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-allocator-0.22
  (package
    (name "rust-gpu-allocator")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-allocator" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s13qi1yvp8gan95q7r3dxbhdnq503v5laz4zjnnyb0ww7igk5ff"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ash" ,rust-ash-0.37)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-imgui" ,rust-imgui-0.10)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-windows" ,rust-windows-0.44))))
    (home-page "https://github.com/Traverse-Research/gpu-allocator")
    (synopsis "Memory allocator for GPU memory in Vulkan and DirectX 12")
    (description
     "This package provides Memory allocator for GPU memory in Vulkan and @code{DirectX} 12.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-alloc-types-0.2
  (package
    (name "rust-gpu-alloc-types")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-alloc-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19b7zqg0va1lqcr7sj2z66cvasgg1p8imv7aninz5my9dc6lv02l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/zakarumych/gpu-alloc")
    (synopsis "Core types of gpu-alloc crate")
    (description "This package provides Core types of gpu-alloc crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-alloc-0.5
  (package
    (name "rust-gpu-alloc")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gpu-alloc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qkzv19k8ls20nx13qw63gfy9jc4gbxzcc50gr2h90mk57yamgi2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-gpu-alloc-types" ,rust-gpu-alloc-types-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/zakarumych/gpu-alloc")
    (synopsis "Implementation agnostic memory allocator for Vulkan like APIs")
    (description
     "This package provides Implementation agnostic memory allocator for Vulkan like APIs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-d3d12-0.6
  (package
    (name "rust-d3d12")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "d3d12" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nirigg48lvilgbwgbk89xrf2k1ak60wgqy0xslx8ywfb8pxxw6q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gfx-rs/wgpu/tree/trunk/d3d12")
    (synopsis "Low level D3D12 API wrapper")
    (description "This package provides Low level D3D12 API wrapper.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-hal-0.15
  (package
    (name "rust-wgpu-hal")
    (version "0.15.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-hal" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12r8w1577ivkdhf6c9xhlrf6vy7kj7m8ipakajxl9ixdhfi63kxx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-android-system-properties" ,rust-android-system-properties-0.1)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-ash" ,rust-ash-0.37)
                       ("rust-bit-set" ,rust-bit-set-0.5)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-block" ,rust-block-0.1)
                       ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
                       ("rust-d3d12" ,rust-d3d12-0.6)
                       ("rust-foreign-types" ,rust-foreign-types-0.3)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-glow" ,rust-glow-0.12)
                       ("rust-gpu-alloc" ,rust-gpu-alloc-0.5)
                       ("rust-gpu-allocator" ,rust-gpu-allocator-0.22)
                       ("rust-gpu-descriptor" ,rust-gpu-descriptor-0.2)
                       ("rust-hassle-rs" ,rust-hassle-rs-0.9)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-khronos-egl" ,rust-khronos-egl-4)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-metal" ,rust-metal-0.24)
                       ("rust-naga" ,rust-naga-0.11)
                       ("rust-objc" ,rust-objc-0.2)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-range-alloc" ,rust-range-alloc-0.1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-renderdoc-sys" ,rust-renderdoc-sys-0.7)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.15)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU hardware abstraction layer")
    (description
     "This package provides @code{WebGPU} hardware abstraction layer.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-core-0.15
  (package
    (name "rust-wgpu-core")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zrzkxnpqkxppbdwvrz2x6008fsp74vg162scj95fcqfjj6l0cbi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-bit-vec" ,rust-bit-vec-0.6)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-fxhash" ,rust-fxhash-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-naga" ,rust-naga-0.11)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-ron" ,rust-ron-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-hal" ,rust-wgpu-hal-0.15)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.15))))
    (home-page "https://wgpu.rs/")
    (synopsis "WebGPU core logic on wgpu-hal")
    (description "This package provides @code{WebGPU} core logic on wgpu-hal.")
    (license (list license:expat license:asl2.0))))

(define-public rust-spirv-0.2
  (package
    (name "rust-spirv")
    (version "0.2.0+1.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spirv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c7qjinqpwcfxk00qx0j46z7i31lnzg2qnnar3gz3crxzqwglsr4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/gfx-rs/rspirv")
    (synopsis "Rust definition of SPIR-V structs and enums")
    (description
     "This package provides Rust definition of SPIR-V structs and enums.")
    (license license:asl2.0)))

(define-public rust-pp-rs-0.2
  (package
    (name "rust-pp-rs")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pp-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vkd9lgwf5rxy7qgzl8mka7vnghaq6nnn0nmg7mycl72ysvqnidv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/Kangz/glslpp-rs")
    (synopsis "Shader preprocessor")
    (description "This package provides Shader preprocessor.")
    (license license:bsd-3)))

(define-public rust-naga-0.11
  (package
    (name "rust-naga")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "naga" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w9jhnd2ikwdd1apmsrs12l4wpxpmzhzs0kp14hh3mdppill4gbc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-bit-set" ,rust-bit-set-0.5)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
                       ("rust-hexf-parse" ,rust-hexf-parse-0.2)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-petgraph" ,rust-petgraph-0.6)
                       ("rust-pp-rs" ,rust-pp-rs-0.2)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-spirv" ,rust-spirv-0.2)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/gfx-rs/wgpu/tree/trunk/naga")
    (synopsis "Shader translation infrastructure")
    (description "This package provides Shader translation infrastructure.")
    (license (list license:expat license:asl2.0))))

(define-public rust-container-of-0.5
  (package
    (name "rust-container-of")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "container_of" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0as7g6gspvdbp4vl1a1834pzh481x9jp4clfgyl6c7vnhvmvpxc9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-memoffset" ,rust-memoffset-0.6))))
    (home-page "")
    (synopsis "Porting C's `container_of` macro to Rust")
    (description
     "This package provides Porting C's `container_of` macro to Rust.")
    (license license:expat)))

(define-public rust-wlcs-0.1
  (package
    (name "rust-wlcs")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wlcs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17k0nwn3f2z71rncb8glb4x15m5zmcbklnk71hpv739nrq2w769d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-container-of" ,rust-container-of-0.5)
                       ("rust-memoffset" ,rust-memoffset-0.9)
                       ("rust-nix" ,rust-nix-0.27)
                       ("rust-wayland-sys" ,rust-wayland-sys-0.31))))
    (home-page "")
    (synopsis "Bindings/helpers for WLCS (Wayland Conformance Test Suite)")
    (description
     "This package provides Bindings/helpers for WLCS (Wayland Conformance Test Suite).")
    (license license:expat)))

(define-public rust-wgpu-0.15
  (package
    (name "rust-wgpu")
    (version "0.15.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wgpu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mrjs44n1wmsyr5y31yr2hk1s3j5w3pg0advxwyw718xv6va2ifp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-naga" ,rust-naga-0.11)
                       ("rust-parking-lot" ,rust-parking-lot-0.11)
                       ("rust-profiling" ,rust-profiling-1)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.5)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1)
                       ("rust-static-assertions" ,rust-static-assertions-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
                       ("rust-web-sys" ,rust-web-sys-0.3)
                       ("rust-wgpu-core" ,rust-wgpu-core-0.15)
                       ("rust-wgpu-hal" ,rust-wgpu-hal-0.15)
                       ("rust-wgpu-types" ,rust-wgpu-types-0.15))))
    (home-page "https://wgpu.rs/")
    (synopsis "Rusty WebGPU API wrapper")
    (description "This package provides Rusty @code{WebGPU} API wrapper.")
    (license (list license:expat license:asl2.0))))

(define-public rust-renderdoc-sys-1
  (package
    (name "rust-renderdoc-sys")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "renderdoc-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cj8zjs7k0gvchcx3jhpg8r9bbqy8b1hsgbz0flcq2ydn12hmcqr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page
     "https://github.com/ebkalderon/renderdoc-rs/tree/master/renderdoc-sys")
    (synopsis "Low-level bindings to the RenderDoc API")
    (description
     "This package provides Low-level bindings to the @code{RenderDoc} API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-renderdoc-0.11
  (package
    (name "rust-renderdoc")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "renderdoc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04hycbzwqmzw25qnk0lwps70jgxi43cgmkjdvwbyzc183vnajb97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-float-cmp" ,rust-float-cmp-0.9)
                       ("rust-glutin" ,rust-glutin-0.30)
                       ("rust-libloading" ,rust-libloading-0.7)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-renderdoc-sys" ,rust-renderdoc-sys-1)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-winit" ,rust-winit-0.28)
                       ("rust-wio" ,rust-wio-0.2))
       #:cargo-development-inputs (("rust-pollster" ,rust-pollster-0.3)
                                   ("rust-wgpu" ,rust-wgpu-0.15)
                                   ("rust-wgpu-subscriber" ,rust-wgpu-subscriber-0.1)
                                   ("rust-winit" ,rust-winit-0.28))))
    (home-page "https://github.com/ebkalderon/renderdoc-rs")
    (synopsis "RenderDoc application bindings for Rust")
    (description
     "This package provides @code{RenderDoc} application bindings for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smithay-0.3
  (let ((commit "5e137dcebc9f2de4d026180dfc4ce81282f7f14f")
        (revision "1"))
    (package
      (name "rust-smithay")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Smithay/smithay")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0iak8l19x5bjbv7mpzgi7dhc4i1n8lmfdcz5v6kys70nx4p3n8wx")))
       ;; (origin
       ;;   (method url-fetch)
       ;;   (uri (crate-uri "smithay" version))
       ;;   (file-name
       ;;    (string-append name "-" version ".tar.gz"))
       ;;   (sha256
       ;;    (base32
       ;;     "1pym4gwp8fgh1ffcj9n3cniqjpy941v3bgan7fdcmg6dj79p0jjj")))
       )
      (build-system cargo-build-system)
      (arguments
       `(;; #:skip-build?
         ;; #t
         #:cargo-inputs
         (("rust-appendlist" ,rust-appendlist-1)
          ("rust-bitflags" ,rust-bitflags-2)
          ("rust-calloop" ,rust-calloop-0.14)
          ("rust-cc" ,rust-cc-1)
          ("rust-cgmath" ,rust-cgmath-0.18)
          ("rust-cursor-icon" ,rust-cursor-icon-1)
          ("rust-downcast-rs" ,rust-downcast-rs-1)
          ("rust-drm" ,rust-drm-0.14)
          ("rust-drm-ffi" ,rust-drm-ffi-0.9)
          ("rust-drm-fourcc" ,rust-drm-fourcc-2)
          ("rust-errno" ,rust-errno-0.3)
          ("rust-gbm" ,rust-gbm-0.16)
          ("rust-gl-generator" ,rust-gl-generator-0.14)
          ("rust-indexmap" ,rust-indexmap-2)
          ("rust-input" ,rust-input-0.9)
          ("rust-libc" ,rust-libc-0.2)
          ("rust-libloading" ,rust-libloading-0.8)
          ("rust-libseat" ,rust-libseat-0.2)
          ("rust-once-cell" ,rust-once-cell-1)
          ("rust-pixman" ,rust-pixman-0.1)
          ("rust-pkg-config" ,rust-pkg-config-0.3)
          ("rust-profiling" ,rust-profiling-1)
          ("rust-rand" ,rust-rand-0.8)
          ("rust-rustix" ,rust-rustix-0.38)
          ("rust-smallvec" ,rust-smallvec-1)
          ("rust-tempfile" ,rust-tempfile-3)
          ("rust-thiserror" ,rust-thiserror-1)
          ("rust-tracing" ,rust-tracing-0.1)
          ("rust-udev" ,rust-udev-0.9)
          ("rust-wayland-backend"
           ,rust-wayland-backend-0.3)
          ("rust-wayland-client" ,rust-wayland-client-0.31)
          ("rust-wayland-cursor" ,rust-wayland-cursor-0.31)
          ("rust-wayland-egl" ,rust-wayland-egl-0.32)
          ("rust-wayland-protocols"
           ,rust-wayland-protocols-0.32)
          ("rust-wayland-protocols-misc"
           ,rust-wayland-protocols-misc-0.3)
          ("rust-wayland-protocols-wlr"
           ,rust-wayland-protocols-wlr-0.3)
          ("rust-wayland-server" ,rust-wayland-server-0.31)
          ("rust-wayland-sys" ,rust-wayland-sys-0.31)
          ("rust-winit" ,rust-winit-0.30)
          ("rust-xkbcommon" ,rust-xkbcommon-0.8)


          ("rust-libdisplay-info" ,rust-libdisplay-info-0.1)
          ("rust-ash" ,rust-ash-0.38)
          ("rust-glow" ,rust-glow-0.14)
          ("rust-criterion" ,rust-criterion-0.5)
          ("rust-image" ,rust-image-0.25)
          ("rust-fps-ticker" ,rust-fps-ticker-1)
          ("rust-puffin-http" ,rust-puffin-http-0.13)
          ("rust-renderdoc" ,rust-renderdoc-0.11)
          ("rust-wlcs" ,rust-wlcs-0.1)
          ("rust-xkbcommon" ,rust-xkbcommon-0.7))))
      (native-inputs (list pkg-config))
      (inputs (list eudev libxkbcommon libseat libinput pixman mesa))
      (home-page "https://smithay.github.io/")
      (synopsis
       "Smithay is a library for writing wayland compositors")
      (description
       "This package provides Smithay is a library for writing wayland compositors.")
      (license license:expat))))

(define-public rust-smithay-client-toolkit-0.19
  (package
    (name "rust-smithay-client-toolkit")
    (version "0.19.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-client-toolkit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05h05hg4dn3v6br5jbdbs5nalk076a64s7fn6i01nqzby2hxwmrl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-calloop" ,rust-calloop-0.13)
        ("rust-calloop-wayland-source"
         ,rust-calloop-wayland-source-0.3)
        ("rust-cursor-icon" ,rust-cursor-icon-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-memmap2" ,rust-memmap2-0.9)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-client" ,rust-wayland-client-0.31)
        ("rust-wayland-csd-frame"
         ,rust-wayland-csd-frame-0.3)
        ("rust-wayland-cursor" ,rust-wayland-cursor-0.31)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols-0.32)
        ("rust-wayland-protocols-wlr"
         ,rust-wayland-protocols-wlr-0.3)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31)
        ("rust-xkeysym" ,rust-xkeysym-0.2))))
    (home-page
     "https://github.com/smithay/client-toolkit")
    (synopsis
     "Toolkit for making client wayland applications")
    (description
     "This package provides Toolkit for making client wayland applications.")
    (license license:expat)))

(define-public rust-smithay-drm-extras-0.1
  (let ((commit "5e137dcebc9f2de4d026180dfc4ce81282f7f14f")
        (revision "1"))
    (package
      (name "rust-smithay-drm-extras")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Smithay/smithay")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0iak8l19x5bjbv7mpzgi7dhc4i1n8lmfdcz5v6kys70nx4p3n8wx")))
       ;; (origin
       ;;   (method url-fetch)
       ;;   (uri (crate-uri "smithay-drm-extras" version))
       ;;   (file-name
       ;;    (string-append name "-" version ".tar.gz"))
       ;;   (sha256
       ;;    (base32
       ;;     "0000000000000000000000000000000000000000000000000000")))

       )
      (build-system cargo-build-system)
      (arguments
       `(#:tests? #f ;; doc file
         ;; #:skip-build?
         ;; #t
         #:cargo-inputs
         (("rust-drm" ,rust-drm-0.14)
          ("rust-libdisplay-info"
           ,rust-libdisplay-info-0.1))
         #:cargo-development-inputs
         (("rust-smithay" ,rust-smithay-0.3))
         ;; #:cargo-package-flags '("--no-metadata"
         ;;                         "--no-verify"
         ;;                         "--package"
         ;;                         "smithay-drm-extras")
         #:phases (modify-phases %standard-phases
                    (add-after 'unpack 'chdir
                      (lambda _ (chdir "smithay-drm-extras")))
                    (add-before 'install 'chdir
                      (lambda _ (chdir "..")))
                    ;; (add-after 'compress-documentation 'fail
                    ;;   (lambda _
                    ;;     (error "a")))
                    )))
      (native-inputs (list pkg-config))
      (inputs (list eudev libxkbcommon libseat libinput pixman mesa libdisplay-info))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))

(define-public rust-socket2-0.4
  (package
    (name "rust-socket2")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socket2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03ack54dxhgfifzsj14k7qa3r5c9wqy3v6mqhlim99cc03y1cycz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/rust-lang/socket2")
    (synopsis
     "Utilities for handling networking sockets with a maximal amount of configuration\npossible intended.")
    (description
     "This package provides Utilities for handling networking sockets with a maximal amount of configuration\npossible intended.")
    (license (list license:expat license:asl2.0))))

(define-public rust-strsim-0.11
  (package
    (name "rust-strsim")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/rapidfuzz/strsim-rs")
    (synopsis
     "Implementations of string similarity metrics. Includes Hamming, Levenshtein,\nOSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (description
     "This package provides Implementations of string similarity metrics.  Includes Hamming, Levenshtein,\nOSA, Damerau-Levenshtein, Jaro, Jaro-Winkler, and SÃ¸rensen-Dice.")
    (license license:expat)))

(define-public rust-supports-color-2
  (package
    (name "rust-supports-color")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "supports-color" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12csf7chawxinaapm9rh718nha9hggk6ra86fdaw9hxdagg8qffn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-is-terminal" ,rust-is-terminal-0.4)
        ("rust-is-ci" ,rust-is-ci-1))))
    (home-page
     "https://github.com/zkat/supports-color")
    (synopsis
     "Detects whether a terminal supports color, and gives details about that support")
    (description
     "This package provides Detects whether a terminal supports color, and gives details about that support.")
    (license license:asl2.0)))

(define-public rust-syn-2
  (package
    (name "rust-syn")
    (version "2.0.86")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k42k01nj5jbpxa2h7spcb6dyd77jws0xrm6h7xkw0rq3lq7b4p8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description
     "This package provides Parser for Rust source code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-synstructure-0.13
  (package
    (name "rust-synstructure")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synstructure" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wc9f002ia2zqcbj0q2id5x6n7g1zjqba7qkg2mr0qvvmdk7dby8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/mystor/synstructure")
    (synopsis
     "Helper methods and macros for custom derives")
    (description
     "This package provides Helper methods and macros for custom derives.")
    (license license:expat)))

(define-public rust-system-deps-6
  (package
    (name "rust-system-deps")
    (version "6.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-deps" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j93ryw031n3h8b0nfpj5xwh3ify636xmv8kxianvlyyipmkbrd3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-expr" ,rust-cfg-expr-0.15)
        ("rust-heck" ,rust-heck-0.5)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-toml" ,rust-toml-0.8)
        ("rust-version-compare"
         ,rust-version-compare-0.2))))
    (home-page
     "https://github.com/gdesmott/system-deps")
    (synopsis
     "Discover and configure system dependencies from declarative dependencies in Cargo.toml")
    (description
     "This package provides Discover and configure system dependencies from declarative dependencies in\nCargo.toml.")
    (license (list license:expat license:asl2.0))))

(define-public rust-system-deps-7
  (package
    (name "rust-system-deps")
    (version "7.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-deps" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01d0fllzpkfybzadyaq1vlx70imzj56dxs4rk9w2f4ikkypkmlk6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-expr" ,rust-cfg-expr-0.17)
        ("rust-heck" ,rust-heck-0.5)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-toml" ,rust-toml-0.8)
        ("rust-version-compare"
         ,rust-version-compare-0.2))))
    (home-page
     "https://github.com/gdesmott/system-deps")
    (synopsis
     "Discover and configure system dependencies from declarative dependencies in Cargo.toml")
    (description
     "This package provides Discover and configure system dependencies from declarative dependencies in\nCargo.toml.")
    (license (list license:expat license:asl2.0))))

(define-public rust-target-lexicon-0.12
  (package
    (name "rust-target-lexicon")
    (version "0.12.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "target-lexicon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cg3bnx1gdkdr5hac1hzxy64fhw4g7dqkd0n3dxy5lfngpr1mi31"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/bytecodealliance/target-lexicon")
    (synopsis
     "Targeting utilities for compilers and related tools")
    (description
     "This package provides Targeting utilities for compilers and related tools.")
    (license (list license:asl2.0 ;; unknown-license!
                   ))))

(define-public rust-tauri-winrt-notification-0.1
  (package
    (name "rust-tauri-winrt-notification")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tauri-winrt-notification" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qp8qdlrh5vpm6zrf1517pprshmv0k4cxf26fs5c78zgrk4m2s00"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-quick-xml" ,rust-quick-xml-0.30)
        ("rust-windows" ,rust-windows-0.51))))
    (home-page
     "https://github.com/tauri-apps/winrt-notification")
    (synopsis
     "An incomplete wrapper over the WinRT toast api")
    (description
     "This package provides An incomplete wrapper over the @code{WinRT} toast api.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tempfile-3
  (package
    (name "rust-tempfile")
    (version "3.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempfile" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nyagmbd4v5g6nzfydiihcn6l9j1w9bxgzyca5lyzgnhcbyckwph"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-fastrand" ,rust-fastrand-2)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page
     "https://stebalien.com/projects/tempfile-rs/")
    (synopsis
     "library for managing temporary files and directories.")
    (description
     "This package provides a library for managing temporary files and directories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-textwrap-0.15
  (package
    (name "rust-textwrap")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0galmidi6gpn308b1kv3r4qbb48j2926lcj0idwhdhlylhjybcxp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-smawk" ,rust-smawk-0.3)
        ("rust-unicode-linebreak"
         ,rust-unicode-linebreak-0.1)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page
     "https://github.com/mgeisler/textwrap")
    (synopsis
     "Library for word wrapping, indenting, and dedenting strings. Has optional support for Unicode and emojis as well as machine hyphenation")
    (description
     "This package provides Library for word wrapping, indenting, and dedenting strings.  Has optional\nsupport for Unicode and emojis as well as machine hyphenation.")
    (license license:expat)))

(define-public rust-thiserror-1
  (package
    (name "rust-thiserror")
    (version "1.0.65")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mdkawq9l9p02zvq7y4py739rjk9wk2ha27mbsb3i6sdb7csn4ax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-thiserror-impl" ,rust-thiserror-impl-1))))
    (home-page
     "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description
     "This package provides derive(Error).")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-impl-1
  (package
    (name "rust-thiserror-impl")
    (version "1.0.65")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00l6gyrx6qlm1d7if3dcfl2sl0mg8k21caknkpk7glnb481pfwdf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/dtolnay/thiserror")
    (synopsis
     "Implementation detail of the `thiserror` crate")
    (description
     "This package provides Implementation detail of the `thiserror` crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-thread-local-1
  (package
    (name "rust-thread-local")
    (version "1.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread_local" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "173i5lyjh011gsimk21np9jn8al18rxsrkjli20a7b8ks2xgk7lb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-once-cell" ,rust-once-cell-1))))
    (home-page
     "https://github.com/Amanieu/thread_local-rs")
    (synopsis "Per-object thread-local storage")
    (description
     "This package provides Per-object thread-local storage.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-0.3
  (package
    (name "rust-time")
    (version "0.3.36")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11g8hdpahgrf1wwl2rpsg5nxq3aj7ri6xr672v4qcij6cgjqizax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-deranged" ,rust-deranged-0.3)
        ("rust-num-conv" ,rust-num-conv-0.1)
        ("rust-powerfmt" ,rust-powerfmt-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-time-core" ,rust-time-core-0.1))))
    (home-page "https://time-rs.github.io")
    (synopsis
     "Date and time library. Fully interoperable with the standard library. Mostly compatible with #![no_std]")
    (description
     "This package provides Date and time library.  Fully interoperable with the standard library.  Mostly\ncompatible with #![no_std].")
    (license (list license:expat license:asl2.0))))

(define-public rust-tinystr-0.7
  (package
    (name "rust-tinystr")
    (version "0.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tinystr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bxqaw7z8r2kzngxlzlgvld1r6jbnwyylyvyjbv1q71rvgaga5wi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-displaydoc" ,rust-displaydoc-0.2)
        ("rust-zerovec" ,rust-zerovec-0.10))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis
     "small ASCII-only bounded length string representation.")
    (description
     "This package provides a small ASCII-only bounded length string representation.")
    (license ;; unknown-license!
     #f
     )))

(define-public rust-toml-0.8
  (package
    (name "rust-toml")
    (version "0.8.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0knjd3mkxyb87qcs2dark3qkpadidap3frqfj5nqvhpxwfc1zvd1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-serde-spanned" ,rust-serde-spanned-0.6)
        ("rust-toml-datetime" ,rust-toml-datetime-0.6)
        ("rust-toml-edit" ,rust-toml-edit-0.22))))
    (home-page "https://github.com/toml-rs/toml")
    (synopsis
     "native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.")
    (description
     "This package provides a native Rust encoder and decoder of TOML-formatted files\nand streams.  Provides implementations of the standard Serialize/Deserialize\ntraits for TOML data to facilitate deserializing and serializing Rust\nstructures.")
    (license (list license:expat license:asl2.0))))

(define-public rust-toml-datetime-0.6
  (package
    (name "rust-toml-datetime")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml_datetime" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hgv7v9g35d7y9r2afic58jvlwnf73vgd1mz2k8gihlgrf73bmqd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/toml-rs/toml")
    (synopsis "TOML-compatible datetime type")
    (description
     "This package provides a TOML-compatible datetime type.")
    (license (list license:expat license:asl2.0))))

(define-public rust-toml-edit-0.22
  (package
    (name "rust-toml-edit")
    (version "0.22.22")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml_edit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xf7sxfzmnc45f75x302qrn5aph52vc8w226v59yhrm211i8vr2a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-indexmap" ,rust-indexmap-2)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-spanned" ,rust-serde-spanned-0.6)
        ("rust-toml-datetime" ,rust-toml-datetime-0.6)
        ("rust-winnow" ,rust-winnow-0.6))))
    (home-page "https://github.com/toml-rs/toml")
    (synopsis
     "Yet another format-preserving TOML parser")
    (description
     "This package provides Yet another format-preserving TOML parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracy-client-0.17
  (package
    (name "rust-tracy-client")
    (version "0.17.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracy-client" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g1m6k95963lrq3apski8qq5qwqnf7h4k430jiazvsq9da60fsvl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-loom" ,rust-loom-0.7)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-tracy-client-sys"
         ,rust-tracy-client-sys-0.24))))
    (home-page
     "https://github.com/nagisa/rust_tracy_client")
    (synopsis
     "High level bindings to the client libraries for the Tracy profiler")
    (description
     "This package provides High level bindings to the client libraries for the Tracy profiler.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracy-client-sys-0.24
  (package
    (name "rust-tracy-client-sys")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracy-client-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k8l393zn0clw3bvg9nm8yra0qklspvmbyn5mfzgs0i325k38qb8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1))))
    (home-page
     "https://github.com/nagisa/rust_tracy_client")
    (synopsis
     "Low level bindings to the client libraries for the Tracy profiler")
    (description
     "This package provides Low level bindings to the client libraries for the Tracy profiler.")
    (license
     (list ;; unknown-license!
      ;; unknown-license!
      license:bsd-3))))

(define-public rust-typenum-1
  (package
    (name "rust-typenum")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typenum" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09dqxv69m9lj9zvv6xw5vxaqx15ps0vxyy5myg33i0kbqvq0pzs2"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/paholg/typenum")
    (synopsis
     "Typenum is a Rust library for type-level numbers evaluated at\n    compile time. It currently supports bits, unsigned integers, and signed\n    integers. It also provides a type-level array of type-level numbers, but its\n    implementation is incomplete")
    (description
     "This package provides Typenum is a Rust library for type-level numbers evaluated at compile time.  It\ncurrently supports bits, unsigned integers, and signed integers.  It also\nprovides a type-level array of type-level numbers, but its implementation is\nincomplete.")
    (license (list license:expat license:asl2.0))))

(define-public rust-udev-0.9
  (package
    (name "rust-udev")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "udev" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10dxy4vd16mkq0xi24d3nwgiv007qhrmry493j9nj5szp6bw3mg3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-io-lifetimes" ,rust-io-lifetimes-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libudev-sys" ,rust-libudev-sys-0.1)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/Smithay/udev-rs")
    (synopsis "libudev bindings for Rust")
    (description
     "This package provides libudev bindings for Rust.")
    (license license:expat)))

(define-public rust-unicode-ident-1
  (package
    (name "rust-unicode-ident")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-ident" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zm1xylzsdfvm2a5ib9li3g5pp7qnkv4amhspydvgbmd9k6mc6z9"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/dtolnay/unicode-ident")
    (synopsis
     "Determine whether characters have the XID_Start or XID_Continue properties according to Unicode Standard Annex #31")
    (description
     "This package provides Determine whether characters have the XID_Start or XID_Continue properties\naccording to Unicode Standard Annex #31.")
    (license
     ;; (list unknown-license!
     ;;       unknown-license!
     ;;       unknown-license!)
     #f
     )))

(define-public rust-unicode-linebreak-0.1
  (package
    (name "rust-unicode-linebreak")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-linebreak" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07spj2hh3daajg335m4wdav6nfkl0f6c0q72lc37blr97hych29v"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/axelf4/unicode-linebreak")
    (synopsis
     "Implementation of the Unicode Line Breaking Algorithm")
    (description
     "This package provides Implementation of the Unicode Line Breaking Algorithm.")
    (license license:asl2.0)))

(define-public rust-unicode-segmentation-1
  (package
    (name "rust-unicode-segmentation")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-segmentation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14qla2jfx74yyb9ds3d2mpwpa4l4lzb9z57c6d2ba511458z5k7n"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis
     "This crate provides Grapheme Cluster, Word and Sentence boundaries\naccording to Unicode Standard Annex #29 rules.")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence boundaries according to\nUnicode Standard Annex #29 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-width-0.1
  (package
    (name "rust-unicode-width")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-width" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/unicode-rs/unicode-width")
    (synopsis
     "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.")
    (description
     "This package provides Determine displayed width of `char` and `str` types according to Unicode\nStandard Annex #11 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-url-2
  (package
    (name "rust-url")
    (version "2.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nis27cv09039nds9n83di92a23q5rqvl40zvkzh0ifijqdpy5cd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-form-urlencoded" ,rust-form-urlencoded-1)
        ("rust-idna" ,rust-idna-1)
        ("rust-percent-encoding"
         ,rust-percent-encoding-2))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis
     "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "This package provides URL library for Rust, based on the WHATWG URL Standard.")
    (license (list license:expat license:asl2.0))))

(define-public rust-utf16-iter-1
  (package
    (name "rust-utf16-iter")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf16_iter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ik2krdr73hfgsdzw0218fn35fa09dg2hvbi1xp3bmdfrp9js8y8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://docs.rs/utf16_iter/")
    (synopsis
     "Iterator by char over potentially-invalid UTF-16 in &[u16]")
    (description
     "This package provides Iterator by char over potentially-invalid UTF-16 in &[u16].")
    (license (list license:asl2.0 license:expat))))

(define-public rust-utf8-iter-1
  (package
    (name "rust-utf8-iter")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8_iter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://docs.rs/utf8_iter/")
    (synopsis
     "Iterator by char over potentially-invalid UTF-8 in &[u8]")
    (description
     "This package provides Iterator by char over potentially-invalid UTF-8 in &[u8].")
    (license (list license:asl2.0 license:expat))))

(define-public rust-utf8parse-0.2
  (package
    (name "rust-utf8parse")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/alacritty/vte")
    (synopsis "Table-driven UTF-8 parser")
    (description
     "This package provides Table-driven UTF-8 parser.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-version-compare-0.2
  (package
    (name "rust-version-compare")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "version-compare" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12y9262fhjm1wp0aj3mwhads7kv0jz8h168nn5fb8b43nwf9abl5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://timvisee.com/projects/version-compare/")
    (synopsis
     "Rust library to easily compare version numbers with no specific format, and test against various comparison operators")
    (description
     "This package provides Rust library to easily compare version numbers with no specific format, and test\nagainst various comparison operators.")
    (license license:expat)))

(define-public rust-version-check-0.9
  (package
    (name "rust-version-check")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "version_check" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/SergioBenitez/version_check")
    (synopsis
     "Tiny crate to check the version of the installed/running rustc")
    (description
     "This package provides Tiny crate to check the version of the installed/running rustc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-waker-fn-1
  (package
    (name "rust-waker-fn")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "waker-fn" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dvk0qsv88kiq22x8w0qz0k9nyrxxm5a9a9czdwdvvhcvjh12wii"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/smol-rs/waker-fn")
    (synopsis "Convert closures into wakers")
    (description
     "This package provides Convert closures into wakers.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.95")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bpbvmxhil380gpv53smaypl8wc7sy7rq8apxfw349pn78v1x38j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-wasm-bindgen-macro"
         ,rust-wasm-bindgen-macro-0.2))))
    (home-page "https://rustwasm.github.io/")
    (synopsis
     "Easy support for interacting between JS and Rust.")
    (description
     "This package provides Easy support for interacting between JS and Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.95")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0n53wgy78bgzgjwk0z69zbspzhv8p2a4zh69s4fzvpqdrb9x8vfb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bumpalo" ,rust-bumpalo-3)
        ("rust-log" ,rust-log-0.4)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2)
        ("rust-wasm-bindgen-shared"
         ,rust-wasm-bindgen-shared-0.2))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Backend code generation of the wasm-bindgen tool")
    (description
     "This package provides Backend code generation of the wasm-bindgen tool.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-futures-0.4
  (package
    (name "rust-wasm-bindgen-futures")
    (version "0.4.45")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fznn43frhq72ci41lgybahv6assvfmqfgnvfiimhwbshbwc8znc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bridging the gap between Rust Futures and JavaScript Promises")
    (description
     "This package provides Bridging the gap between Rust Futures and @code{JavaScript} Promises.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.95")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mic8b2vab1a91m6x3hjxkwz23094bq1cwhnszarsnlggyz894z7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-quote" ,rust-quote-1)
        ("rust-wasm-bindgen-macro-support"
         ,rust-wasm-bindgen-macro-support-0.2))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (description
     "This package provides Definition of the `#[wasm_bindgen]` attribute, an internal dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.95")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s7g6glb85lyx2pj83shbmg4d50mvqhb2c2qk2j28yigaxbspii6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2)
        ("rust-wasm-bindgen-backend"
         ,rust-wasm-bindgen-backend-0.2)
        ("rust-wasm-bindgen-shared"
         ,rust-wasm-bindgen-shared-0.2))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (description
     "This package provides The part of the implementation of the `#[wasm_bindgen]` attribute that is not in\nthe shared backend crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.95")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1386q7mvv5ky003hcc6yyxpid3y1m7fy0l920i3z3ab60vqhkz35"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal\ndependency.")
    (description
     "This package provides Shared support between wasm-bindgen and wasm-bindgen cli, an internal\ndependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wayland-backend-0.3
  (package
    (name "rust-wayland-backend")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-backend" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xhnh0mn4cv0wmq3zcm0iic2sbhsz4qdra6kb58x8l51sz73ar85"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-downcast-rs" ,rust-downcast-rs-1)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-scoped-tls" ,rust-scoped-tls-1)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-wayland-sys" ,rust-wayland-sys-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Low-level bindings to the Wayland protocol")
    (description
     "This package provides Low-level bindings to the Wayland protocol.")
    (license license:expat)))

(define-public rust-wayland-client-0.31
  (package
    (name "rust-wayland-client")
    (version "0.31.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "105j23dj1k36rpvv3nk5v3lm99gs029k3k429kbnzxv9zk9ljqmn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, client side")
    (description
     "This package provides Bindings to the standard C implementation of the wayland protocol, client side.")
    (license license:expat)))

(define-public rust-wayland-cursor-0.31
  (package
    (name "rust-wayland-cursor")
    (version "0.31.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-cursor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k4yijr0rxlqw15clzbh6a3jd760l1xz3zg0gxg07c7xmb1qpc1j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-rustix" ,rust-rustix-0.38)
        ("rust-wayland-client" ,rust-wayland-client-0.31)
        ("rust-xcursor" ,rust-xcursor-0.3))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis "Bindings to libwayland-cursor")
    (description
     "This package provides Bindings to libwayland-cursor.")
    (license license:expat)))

(define-public rust-wayland-egl-0.32
  (package
    (name "rust-wayland-egl")
    (version "0.32.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-egl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1r7dpyp5rw905fd3c3149hpw4kilzbqn2v6fb7z10lzr9ywbhg2f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-sys" ,rust-wayland-sys-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis "Bindings to libwayland-egl")
    (description
     "This package provides Bindings to libwayland-egl.")
    (license license:expat)))

(define-public rust-wayland-protocols-0.32
  (package
    (name "rust-wayland-protocols")
    (version "0.32.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13pmq788d2w9c7sqpjjxi1344bzq1g1ja4vlaa4rlvjfgkjsvl3w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-client" ,rust-wayland-client-0.31)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31)
        ("rust-wayland-server" ,rust-wayland-server-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for the officials wayland protocol extensions")
    (description
     "This package provides Generated API for the officials wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-misc-0.3
  (package
    (name "rust-wayland-protocols-misc")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols-misc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19swn90f3wfxr6iafyqjbfvzi3jqx4b1rfyl2nhnkr34jyb44bns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols-0.32)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31)
        ("rust-wayland-server" ,rust-wayland-server-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for misc and deprecated wayland protocol extensions")
    (description
     "This package provides Generated API for misc and deprecated wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-plasma-0.3
  (package
    (name "rust-wayland-protocols-plasma")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols-plasma" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g8jxv1k3zdbcqmhr4fpghgibp2940hz45sm2pmwfs7f92swlccv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-client" ,rust-wayland-client-0.31)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols-0.32)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for the Plasma wayland protocol extensions")
    (description
     "This package provides Generated API for the Plasma wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-protocols-wlr-0.3
  (package
    (name "rust-wayland-protocols-wlr")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols-wlr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08j0xfpfqv6kzbfzmdv6crfzalxbxc2n5m9hc4qkqg4jrpv14bkq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-wayland-backend"
         ,rust-wayland-backend-0.3)
        ("rust-wayland-client" ,rust-wayland-client-0.31)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols-0.32)
        ("rust-wayland-scanner"
         ,rust-wayland-scanner-0.31)
        ("rust-wayland-server" ,rust-wayland-server-0.31))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for the WLR wayland protocol extensions")
    (description
     "This package provides Generated API for the WLR wayland protocol extensions.")
    (license license:expat)))

(define-public rust-wayland-sys-0.31
  (package
    (name "rust-wayland-sys")
    (version "0.31.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02cyl94ydazgjdjf7asm2phni8h62j4cg4pwr6sy7lwfiq6sra7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-dlib" ,rust-dlib-0.5)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-memoffset" ,rust-memoffset-0.9)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "FFI bindings to the various libwayland-*.so libraries. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings")
    (description
     "This package provides FFI bindings to the various libwayland-*.so libraries.  You should only need\nthis crate if you are working on custom wayland protocol extensions.  Look at\nthe crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-web-sys-0.3
  (package
    (name "rust-web-sys")
    (version "0.3.72")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04k19hilj9r8sx6q20fz853149gfpmf83yk2zvq0s14c2288nj7n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (description
     "This package provides Bindings for all Web APIs, a procedurally generated crate from @code{WebIDL}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-winapi-util-0.1
  (package
    (name "rust-winapi-util")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fqhkcl9scd230cnfj8apfficpf5c9vhwnk4yy9xfc1sw69iq8ng"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page
     "https://github.com/BurntSushi/winapi-util")
    (synopsis
     "dumping ground for high level safe wrappers over windows-sys.")
    (description
     "This package provides a dumping ground for high level safe wrappers over\nwindows-sys.")
    (license (list license:unlicense license:expat))))

(define-public rust-windows-0.51
  (package
    (name "rust-windows")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ja500kr2pdvz9lxqmcr7zclnnwpvw28z78ypkrc4f7fqlb9j8na"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-core" ,rust-windows-core-0.51)
        ("rust-windows-targets"
         ,rust-windows-targets-0.48))))
    (home-page
     "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description
     "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-core-0.51
  (package
    (name "rust-windows-core")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r1f57hsshsghjyc7ypp2s0i78f7b1vr93w68sdb8baxyf2czy7i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-targets"
         ,rust-windows-targets-0.48))))
    (home-page
     "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description
     "This package provides Rust for Windows.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-interface-0.58
  (package
    (name "rust-windows-interface")
    (version "0.58.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-interface" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "059mxmfvx3x88q74ms0qlxmj2pnidmr5mzn60hakn7f95m34qg05"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/microsoft/windows-rs")
    (synopsis
     "The interface macro for the windows crate")
    (description
     "This package provides The interface macro for the windows crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-winnow-0.6
  (package
    (name "rust-winnow")
    (version "0.6.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winnow" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16y4i8z9vh8hazjxg5mvmq0c5i35wlk8rxi5gkq6cn5vlb0zxh9n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2))))
    (home-page "https://github.com/winnow-rs/winnow")
    (synopsis
     "byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library.")
    (license license:expat)))

(define-public rust-write16-1
  (package
    (name "rust-write16")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "write16" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dnryvrrbrnl7vvf5vb1zkmwldhjkf2n5znliviam7bm4900z2fi"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://docs.rs/write16/")
    (synopsis "UTF-16 analog of the Write trait")
    (description
     "This package provides a UTF-16 analog of the Write trait.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-writeable-0.5
  (package
    (name "rust-writeable")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "writeable" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lawr6y0bwqfyayf3z8zmqlhpnzhdx0ahs54isacbhyjwa7g778y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis
     "more efficient alternative to fmt::Display")
    (description
     "This package provides a more efficient alternative to fmt::Display.")
    (license unknown-license!)))

(define-public rust-x11rb-0.13
  (package
    (name "rust-x11rb")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11rb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04jyfm0xmc538v09pzsyr2w801yadsgvyl2p0p76hzzffg5gz4ax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-as-raw-xcb-connection"
         ,rust-as-raw-xcb-connection-1)
        ("rust-gethostname" ,rust-gethostname-0.4)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading-0.8)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-rustix" ,rust-rustix-0.38)
        ("rust-x11rb-protocol" ,rust-x11rb-protocol-0.13))))
    (home-page "https://github.com/psychon/x11rb")
    (synopsis "Rust bindings to X11")
    (description
     "This package provides Rust bindings to X11.")
    (license (list license:expat license:asl2.0))))

(define-public rust-x11rb-protocol-0.13
  (package
    (name "rust-x11rb-protocol")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11rb-protocol" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gfbxf2k7kbk577j3rjhfx7hm70kmwln6da7xyc4l2za0d2pq47c"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/psychon/x11rb")
    (synopsis "Rust bindings to X11")
    (description
     "This package provides Rust bindings to X11.")
    (license (list license:expat license:asl2.0))))

(define-public rust-xcursor-0.3
  (package
    (name "rust-xcursor")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xcursor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qazsl7h8nrbbzx84qrv39w8m2qc27g0mvrszgdls2v6n6k3vwqf"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/esposm03/xcursor-rs")
    (synopsis "library for loading XCursor themes")
    (description
     "This package provides a library for loading XCursor themes.")
    (license license:expat)))

(define-public rust-xdg-home-1
  (package
    (name "rust-xdg-home")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xdg-home" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xm122zz0wjc8p8cmchij0j9nw34hwncb39jc7dc0mgvb2rdl77c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/zeenix/xdg-home")
    (synopsis
     "The user's home directory as per XDG Specification")
    (description
     "This package provides The user's home directory as per XDG Specification.")
    (license license:expat)))

(define-public rust-xkbcommon-0.8
  (package
    (name "rust-xkbcommon")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xkbcommon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1j8s1sfwc6bw9phsca65rw3q3b5l2651v1s0pk5yxm6baa9wlrld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-memmap2" ,rust-memmap2-0.9)
        ("rust-xkeysym" ,rust-xkeysym-0.2))))
    (home-page
     "https://github.com/rust-x-bindings/xkbcommon-rs")
    (synopsis
     "Rust bindings and wrappers for libxkbcommon")
    (description
     "This package provides Rust bindings and wrappers for libxkbcommon.")
    (license license:expat)))

(define-public rust-xkbcommon-dl-0.4
  (package
    (name "rust-xkbcommon-dl")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xkbcommon-dl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iai0r3b5skd9vbr8z5b0qixiz8jblzfm778ddm8ba596a0dwffh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-2)
        ("rust-dlib" ,rust-dlib-0.5)
        ("rust-log" ,rust-log-0.4)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-xkeysym" ,rust-xkeysym-0.2))))
    (home-page
     "https://github.com/rust-windowing/xkbcommon-dl")
    (synopsis
     "Dynamically loaded xkbcommon and xkbcommon-x11 Rust bindings")
    (description
     "This package provides Dynamically loaded xkbcommon and xkbcommon-x11 Rust bindings.")
    (license license:expat)))

(define-public rust-xkeysym-0.2
  (package
    (name "rust-xkeysym")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xkeysym" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mksx670cszyd7jln6s7dhkw11hdfv7blwwr3isq98k22ljh1k5r"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/notgull/xkeysym")
    (synopsis "library for working with X11 keysyms")
    (description
     "This package provides a library for working with X11 keysyms.")
    (license
     (list license:expat license:asl2.0 license:zlib))))

(define-public rust-xml-rs-0.8
  (package
    (name "rust-xml-rs")
    (version "0.8.22")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xml-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09pg779vjh0xp3ph10j4wy1ihz8pzvxm1qf1jqw0jnmsghpjwkmg"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://lib.rs/crates/xml-rs")
    (synopsis "An XML library in pure Rust")
    (description
     "This package provides An XML library in pure Rust.")
    (license license:expat)))

(define-public rust-xshell-0.2
  (package
    (name "rust-xshell")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xshell" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dv4igym5whcr8fws0afmhq414a1c38x7a2ln38yyfg7xa3apc3d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-xshell-macros" ,rust-xshell-macros-0.2))))
    (home-page "https://github.com/matklad/xshell")
    (synopsis
     "Utilities for quick shell scripting in Rust")
    (description
     "This package provides Utilities for quick shell scripting in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-xshell-macros-0.2
  (package
    (name "rust-xshell-macros")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xshell-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lnqicgd9r2mh8p9yz4yidiskip9cp3wqfg4dvqf4xpc7272whlx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/matklad/xshell")
    (synopsis
     "Private implementation detail of xshell crate")
    (description
     "This package provides Private implementation detail of xshell crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-yansi-1
  (package
    (name "rust-yansi")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yansi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jdh55jyv0dpd38ij4qh60zglbw9aa8wafqai6m0wa7xaxk3mrfg"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/SergioBenitez/yansi")
    (synopsis
     "dead simple ANSI terminal color painting library.")
    (description
     "This package provides a dead simple ANSI terminal color painting library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-yoke-0.7
  (package
    (name "rust-yoke")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yoke" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "198c4jkh6i3hxijia7mfa4cpnxg1iqym9bz364697c3rn0a16nvc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-stable-deref-trait"
         ,rust-stable-deref-trait-1)
        ("rust-yoke-derive" ,rust-yoke-derive-0.7)
        ("rust-zerofrom" ,rust-zerofrom-0.1))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis
     "Abstraction allowing borrowed data to be carried along with the backing data it borrows from")
    (description
     "This package provides Abstraction allowing borrowed data to be carried along with the backing data it\nborrows from.")
    (license unknown-license!)))

(define-public rust-yoke-derive-0.7
  (package
    (name "rust-yoke-derive")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yoke-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15cvhkci2mchfffx3fmva84fpmp34dsmnbzibwfnzjqq3ds33k18"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2)
        ("rust-synstructure" ,rust-synstructure-0.13))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the yoke crate")
    (description
     "This package provides Custom derive for the yoke crate.")
    (license unknown-license!)))

;; (define-public rust-zbus-3
;;   (package
;;     (name "rust-zbus")
;;     (version "3.15.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zbus" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1ri5gklhh3kl9gywym95679xs7n3sw2j3ky80jcd8siacc5ifpb7"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-async-broadcast"
;;          ,rust-async-broadcast-0.5)
;;         ("rust-async-executor" ,rust-async-executor-1)
;;         ("rust-async-fs" ,rust-async-fs-1)
;;         ("rust-async-io" ,rust-async-io-1)
;;         ("rust-async-lock" ,rust-async-lock-2)
;;         ("rust-async-process" ,rust-async-process-1)
;;         ("rust-async-recursion" ,rust-async-recursion-1)
;;         ("rust-async-task" ,rust-async-task-4)
;;         ("rust-async-trait" ,rust-async-trait-0.1)
;;         ("rust-blocking" ,rust-blocking-1)
;;         ("rust-byteorder" ,rust-byteorder-1)
;;         ("rust-derivative" ,rust-derivative-2)
;;         ("rust-enumflags2" ,rust-enumflags2-0.7)
;;         ("rust-event-listener" ,rust-event-listener-2)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-futures-sink" ,rust-futures-sink-0.3)
;;         ("rust-futures-util" ,rust-futures-util-0.3)
;;         ("rust-hex" ,rust-hex-0.4)
;;         ("rust-nix" ,rust-nix-0.26)
;;         ("rust-once-cell" ,rust-once-cell-1)
;;         ("rust-ordered-stream" ,rust-ordered-stream-0.2)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-serde-repr" ,rust-serde-repr-0.1)
;;         ("rust-sha1" ,rust-sha1-0.10)
;;         ("rust-static-assertions"
;;          ,rust-static-assertions-1)
;;         ("rust-tracing" ,rust-tracing-0.1)
;;         ("rust-uds-windows" ,rust-uds-windows-1)
;;         ("rust-winapi" ,rust-winapi-0.3)
;;         ("rust-xdg-home" ,rust-xdg-home-1)
;;         ("rust-zbus-macros" ,rust-zbus-macros-3)
;;         ("rust-zbus-names" ,rust-zbus-names-2)
;;         ("rust-zvariant" ,rust-zvariant-3))))
;;     (home-page "https://github.com/dbus2/zbus/")
;;     (synopsis "API for D-Bus communication")
;;     (description
;;      "This package provides API for D-Bus communication.")
;;     (license license:expat)))

;; (define-public rust-zbus-macros-3
;;   (package
;;     (name "rust-zbus-macros")
;;     (version "3.15.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zbus_macros" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "19g0d7d4b8l8ycw498sz8pwkplv300j31i9hnihq0zl81xxljcbi"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro-crate"
;;          ,rust-proc-macro-crate-1)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-regex" ,rust-regex-1)
;;         ("rust-syn" ,rust-syn-1)
;;         ("rust-zvariant-utils" ,rust-zvariant-utils-1))))
;;     (home-page "https://github.com/dbus2/zbus/")
;;     (synopsis "proc-macros for zbus")
;;     (description
;;      "This package provides proc-macros for zbus.")
;;     (license license:expat)))

;; (define-public rust-zbus-names-2
;;   (package
;;     (name "rust-zbus-names")
;;     (version "2.6.1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zbus_names" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "13achs6jbrp4l0jy5m6nn7v89clfgb63qhldkg5ddgjh6y6p6za3"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-serde" ,rust-serde-1)
;;         ("rust-static-assertions"
;;          ,rust-static-assertions-1)
;;         ("rust-zvariant" ,rust-zvariant-3))))
;;     (home-page "https://github.com/dbus2/zbus/")
;;     (synopsis "collection of D-Bus bus names types")
;;     (description
;;      "This package provides a collection of D-Bus bus names types.")
;;     (license license:expat)))

;; (define-public rust-zerocopy-0.7
;;   (package
;;     (name "rust-zerocopy")
;;     (version "0.7.35")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zerocopy" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1w36q7b9il2flg0qskapgi9ymgg7p985vniqd09vi0mwib8lz6qv"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-byteorder" ,rust-byteorder-1)
;;         ("rust-zerocopy-derive"
;;          ,rust-zerocopy-derive-0.7))))
;;     (home-page "https://github.com/google/zerocopy")
;;     (synopsis
;;      "Zerocopy makes zero-cost memory manipulation effortless. We write \"unsafe\" so you don't have to")
;;     (description
;;      "This package provides Zerocopy makes zero-cost memory manipulation effortless.  We write \"unsafe\" so\nyou don't have to.")
;;     (license
;;      (list license:bsd-2 license:asl2.0 license:expat))))

;; (define-public rust-zerocopy-derive-0.7
;;   (package
;;     (name "rust-zerocopy-derive")
;;     (version "0.7.35")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zerocopy-derive" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "0gnf2ap2y92nwdalzz3x7142f2b83sni66l39vxp2ijd6j080kzs"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-2))))
;;     (home-page "https://github.com/google/zerocopy")
;;     (synopsis
;;      "Custom derive for traits from the zerocopy crate")
;;     (description
;;      "This package provides Custom derive for traits from the zerocopy crate.")
;;     (license
;;      (list license:bsd-2 license:asl2.0 license:expat))))

(define-public rust-zerofrom-0.1
  (package
    (name "rust-zerofrom")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mdbjd7vmbix2ynxbrbrrli47a5yrpfx05hi99wf1l4pwwf13v4i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-zerofrom-derive"
         ,rust-zerofrom-derive-0.1))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis "ZeroFrom trait for constructing")
    (description
     "This package provides @code{ZeroFrom} trait for constructing.")
    (license unknown-license!)))

(define-public rust-zerofrom-derive-0.1
  (package
    (name "rust-zerofrom-derive")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerofrom-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19b31rrs2ry1lrq5mpdqjzgg65va51fgvwghxnf6da3ycfiv99qf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2)
        ("rust-synstructure" ,rust-synstructure-0.13))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the zerofrom crate")
    (description
     "This package provides Custom derive for the zerofrom crate.")
    (license unknown-license!)))

(define-public rust-zerovec-0.10
  (package
    (name "rust-zerovec")
    (version "0.10.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerovec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yghix7n3fjfdppwghknzvx9v8cf826h2qal5nqvy8yzg4yqjaxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-yoke" ,rust-yoke-0.7)
        ("rust-zerofrom" ,rust-zerofrom-0.1)
        ("rust-zerovec-derive" ,rust-zerovec-derive-0.10))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis
     "Zero-copy vector backed by a byte array")
    (description
     "This package provides Zero-copy vector backed by a byte array.")
    (license unknown-license!)))

(define-public rust-zerovec-derive-0.10
  (package
    (name "rust-zerovec-derive")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerovec-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ik322dys6wnap5d3gcsn09azmssq466xryn5czfm13mn7gsdbvf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-2))))
    (home-page
     "https://github.com/unicode-org/icu4x")
    (synopsis "Custom derive for the zerovec crate")
    (description
     "This package provides Custom derive for the zerovec crate.")
    (license unknown-license!)))

;; (define-public rust-zvariant-3
;;   (package
;;     (name "rust-zvariant")
;;     (version "3.15.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zvariant" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1nxj9x187jl32fd32zvq8hfn6lyq3kjadb2q7f6kb6x0igl2pvsf"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-byteorder" ,rust-byteorder-1)
;;         ("rust-enumflags2" ,rust-enumflags2-0.7)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-static-assertions"
;;          ,rust-static-assertions-1)
;;         ("rust-zvariant-derive" ,rust-zvariant-derive-3))))
;;     (home-page "https://github.com/dbus2/zbus/")
;;     (synopsis "D-Bus & GVariant encoding & decoding")
;;     (description
;;      "This package provides D-Bus & GVariant encoding & decoding.")
;;     (license license:expat)))

;; (define-public rust-zvariant-derive-3
;;   (package
;;     (name "rust-zvariant-derive")
;;     (version "3.15.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zvariant_derive" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1nbydrkawjwxan12vy79qsrn7gwc483mpfzqs685ybyppv04vhip"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro-crate"
;;          ,rust-proc-macro-crate-1)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1)
;;         ("rust-zvariant-utils" ,rust-zvariant-utils-1))))
;;     (home-page "https://github.com/dbus2/zbus/")
;;     (synopsis "D-Bus & GVariant encoding & decoding")
;;     (description
;;      "This package provides D-Bus & GVariant encoding & decoding.")
;;     (license license:expat)))
niri

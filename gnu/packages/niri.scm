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
  #:use-module (guix gexp)
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

(define unknown-license! #f)

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
        (base32 "044qs48yl0llp2dmrgwxj9y1pgfy09i6fhq661zqqb9a3fwa9wv5"))
       (patches (search-patches "rust-libspa-0.8.0-unrelease.patch"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
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
         "07yh4i5grzbxkchg6dnxlwbdw2wm5jnd7ffbhl77jr0388b9f3dz"))
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

(define-public niri
  (package
    (name "niri")
    (version "0.1.10")
    (source
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
                  (("git = \"https://github.com/Smithay/smithay.git\"") "")
                  (("# path = \"\\.\\./smithay\"")
                   "version = \"0.3.0\"")
                  (("# path = \"\\.\\./smithay/smithay-drm-extras\"")
                   "version = \"0.1.0\"")
                  (("git = \"https://gitlab.freedesktop.org/pipewire/\
pipewire-rs.git\"")
                   "version = \"0.8.0\""))))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:cargo-inputs
      `(("rust-anyhow" ,rust-anyhow-1)
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
        ("rust-zbus" ,rust-zbus-3))
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-niri.desktop
            (lambda _
              (substitute* "resources/niri.desktop"
                (("Exec=niri-session")
                 (string-append "Exec=" #$output "bin/niri --session")))))
          (add-after 'unpack 'remove-niri-visual-tests
            (lambda _
              (substitute* "Cargo.toml"
                (("\"niri-visual-tests\"") ""))
              (delete-file-recursively "niri-visual-tests")))
          (add-after 'install 'install-extra
            (lambda _
              (install-file
               "resources/niri.desktop"
               (string-append #$output "/share/wayland-sessions"))
              (install-file
               "resources/niri-portals.conf"
               (string-append #$output "/share/xdg-desktop-portal")))))))
    (native-inputs (list clang pkg-config))
    (inputs (list rust-smithay-0.3 rust-smithay-drm-extras-0.1

                  glib
                  cairo
                  pango
                  pipewire
                  eudev libxkbcommon libseat libinput pixman mesa
                  libdisplay-info))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public rust-niri-config-0.1
  (package
    (name "rust-niri-config")
    (version "0.1.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/YaLTeR/niri")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11sjz3ckk8qw74h1ahgkx5yxjzndjzawqdg5d5s6y0l0rz3pkbbr"))))
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
         "0hj2yxs90xcs14mnj36q2y51n2n2s5qvlr97nwdds9mlsg5439aa"))))
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

(define-public rust-pipewire-0.8
  (package
    (name "rust-pipewire")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pipewire" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nldg1hz4v0qr26lzdxqpvrac4zbc3pb6436sl392425bjx4brh8"))
       (patches (search-patches "rust-pipewire-0.8.0-unrelease.patch"))))
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
    (license license:expat)))

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
         "04hiy3rl8v3j2dfzp04gr7r8l5azzqqsvqdzwa7sipdij27ii7l4"))))
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
          (base32 "0iak8l19x5bjbv7mpzgi7dhc4i1n8lmfdcz5v6kys70nx4p3n8wx"))

         (modules '((guix build utils)))
         (snippet
          '(begin (substitute* "Cargo.toml"
                    (("    \"smithay-drm-extras\",") "")
                    (("    \"smallvil\",") "")
                    (("    \"anvil\",") "")
                    (("    \"wlcs_anvil\",") "")
                    (("    \"test_clients\",") ""))))))
      (build-system cargo-build-system)
      (arguments
       `(#:cargo-inputs
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

          ("rust-ash" ,rust-ash-0.38)
          ("rust-glow" ,rust-glow-0.14)
          ("rust-criterion" ,rust-criterion-0.5)
          ("rust-image" ,rust-image-0.25)
          ("rust-xkbcommon" ,rust-xkbcommon-0.7))))
      (native-inputs (list pkg-config))
      (inputs (list eudev libxkbcommon libseat libinput pixman mesa))
      (home-page "https://smithay.github.io/")
      (synopsis
       "Smithay is a library for writing wayland compositors")
      (description
       "This package provides Smithay is a library for writing wayland compositors.")
      (license license:expat))))

(define-public rust-smithay-drm-extras-0.1
  (let ((commit "5e137dcebc9f2de4d026180dfc4ce81282f7f14f")
        (revision "1"))
    (package
      (inherit rust-smithay-0.3)
      (name "rust-smithay-drm-extras")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (inherit (package-source rust-smithay-0.3))
         (modules '((guix build utils)))
         (snippet
          '(begin (substitute* "Cargo.toml"
                    (("    \"smallvil\",") "")
                    (("    \"anvil\",") "")
                    (("    \"wlcs_anvil\",") "")
                    (("    \"test_clients\",") ""))
                  (substitute* "smithay-drm-extras/Cargo.toml"
                    (("path = \"\\.\\./\"")
                     "version = \"0.3.0\""))))))
      (build-system cargo-build-system)
      (arguments
       `(#:tests? #f ;; doc file
         #:cargo-inputs
         (("rust-drm" ,rust-drm-0.14)
          ("rust-libdisplay-info"
           ,rust-libdisplay-info-0.1))
         #:cargo-development-inputs
         (("rust-smithay" ,rust-smithay-0.3))
         #:phases (modify-phases %standard-phases
                    (add-after 'unpack 'chdir
                      (lambda _ (chdir "smithay-drm-extras")))
                    (add-before 'install 'chdir
                      (lambda _ (chdir ".."))))))
      (native-inputs (list pkg-config))
      (inputs (list
               rust-smithay-0.3
               eudev libxkbcommon libseat libinput pixman mesa libdisplay-info))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))

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

niri

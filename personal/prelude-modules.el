;;; Uncomment the modules you'd like to use and restart Prelude afterwards

;; This is only needed once, near the top of the file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; Bootstrap `use-package'
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize Packages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'prelude-ivy) ;; A mighty modern alternative to ido
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-company)
(require 'prelude-key-chord) ;; Binds useful features to key combinations

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-clojure)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-go)
(require 'prelude-js)
(require 'prelude-lisp)
(require 'prelude-lsp)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-scheme)
(require 'prelude-shell)
(require 'prelude-scss)
(require 'prelude-ts)
(require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
(require 'prelude-yaml)
(require 'prelude-csharp)

;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
;; (require 'prelude-haskell)
;; (require 'prelude-latex)
;; (require 'prelude-ocaml)
;; (require 'prelude-ruby)
;; (require 'prelude-rust)
;; (require 'prelude-scala)
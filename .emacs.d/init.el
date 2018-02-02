;;; Package --- my personal emacs
;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)

;; Use ELPA & MELPA
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa". "http://melpa.milkbox.net/packages/")))

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name  "lisp" user-emacs-directory))

(require 'init-xxml) ;; yaml / toml
(require 'init-company)
(require 'init-indent)
(require 'init-smartparens)
(require 'init-flycheck)
(require 'init-display)
(require 'init-misc)
(require 'init-smex)
(require 'init-tabbar)
(require 'init-python)
(require 'init-clojure)
(require 'init-go)
(require 'init-js)
(require 'init-markdown)
(require 'init-php)
(require 'init-elixir)
(require 'init-web)

;;; init.el ends here

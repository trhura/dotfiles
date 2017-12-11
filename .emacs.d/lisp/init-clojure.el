;;; package --- initialize python
;;; Commentary:
;;; Code:

(use-package cljsbuild-mode
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config
  ;; cljsbuild-start
  (add-hook 'clojure-mode-hook #'cider-mode)
  (add-hook 'clojure-mode-hook 'subword-mode))

(use-package cider
  :ensure t
  :config
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode))

(use-package flycheck-clojure
  :ensure t
  :config (flycheck-clojure-setup))


(provide 'init-clojure)
;;; init-clojure.el ends here

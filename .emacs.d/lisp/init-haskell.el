;;; package --- initialize haskell
;;; Commentary:
;;; Code:

(use-package intero
  :ensure t
  :config
  (flycheck-add-next-checker 'intero
			     '(warning . haskell-hlint)))

(use-package haskell-mode
  :mode ("\\.ghci\\" . haskell-mode)
  :ensure t
  :config
  (intero-global-mode)
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'eldoc-mode))


(use-package hindent
  :ensure t
  :config 
  (add-hook 'haskell-mode-hook 'hindent-mode)
  (setq-default hindent-extra-args nil))

(provide 'init-haskell)
;;; init-haskell.el ends here

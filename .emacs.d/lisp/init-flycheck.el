;;; package --- initialize flycheck settings
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-color-mode-line
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here

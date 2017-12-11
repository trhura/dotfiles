;;; package --- initialize yaml & toml settings
;;; Commentary:
;;; Code:
(use-package toml-mode
  :ensure t
  :config (add-hook 'toml-mode-hook 'goto-address-prog-mode))

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)
	 ("\\.yaml\\'" . yaml-mode))
  :config
  (add-hook 'yaml-mode-hook 'goto-address-prog-mode))

(provide 'init-xxml)
;;; init-xxml.el ends here

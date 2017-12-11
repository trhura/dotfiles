;;; package --- initialize company
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :bind (("M-/" . company-complete)
	 ("M-/" . company-select-next)
	 ("M-C-/" . company-select-previous))
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here

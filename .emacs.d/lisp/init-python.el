;;; package --- initialize python
;;; Commentary:
;;; Code:

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (elpy-use-ipython)
  :config
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (setq py-indent-offset 4
	elpy-rpc-backend "jedi"
	pylint "/usr/bin/epylint")
  (highlight-indentation-current-column-mode))

(use-package py-autopep8
  :ensure t)

(use-package py-isort
  :ensure t)

(defun my/python-mode-hook ()
  (hs-minor-mode 1)
  (subword-mode 1)
  (add-hook 'before-save-hook 'py-isort-before-save nil t)
  (add-hook 'before-save-hook 'elpy-format-code nil t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))

(provide 'init-python)
;;; init-python.el ends here

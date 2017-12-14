;;; package --- initialize python
;;; Commentary:
;;; Code:

(defcustom python-autoflake-path (executable-find "autoflake")
  "Autoflake executable path.  Allows working with a virtualenv."
  :group 'python
  :type 'string)

(defun python-remove-unused-imports ()
  "Use Autoflake to remove unused function."
  (interactive)
  (when (eq major-mode 'python-mode)
    (shell-command (format "%s --remove-all-unused-imports -i %s"
			   python-autoflake-path
			   (shell-quote-argument (buffer-file-name))))
    (revert-buffer t t t))
  nil)

(defun my/python-mode-hook ()
  "Customization for python hook."
  (subword-mode 1)
  ;;(add-hook 'before-save-hook 'py-isort-before-save nil t)
  (add-hook 'before-save-hook 'python-remove-unused-imports)
  (add-hook 'before-save-hook 'elpy-format-code nil t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t))


(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  ;; (elpy-use-ipython)
  :config
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (setq python-indent-offset 4
	elpy-rpc-backend "jedi")
  (highlight-indentation-mode -1))

(use-package py-autopep8
  :ensure t)

(use-package py-isort
  :ensure t)

(provide 'init-python)
;;; init-python.el ends here

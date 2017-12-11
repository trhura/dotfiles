;;; package --- initialize indentation
;;; Commentary:
;;; Code:

(use-package web-mode
  :ensure t
  :mode (("\\.tsx\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode))
  :config  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (or (string-equal "tsx" (file-name-extension buffer-file-name))
			(string-equal "jsx" (file-name-extension buffer-file-name)))
		(my/tide-setup)))))

;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

(provide 'init-web)
;;; init-web.el ends here

;;; package --- initialize js
;;; Commentary:
;;; Code:

;; Setup Json
(use-package flycheck-demjsonlint
  :ensure t
  :mode (("\\.eslintrc.*$" . json-mode)
	 ("\\.babelrc$" . json-mode)))

;; Typescript 
(defun my/tide-setup ()
  "Set up tide mode."
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

(use-package tide
  :ensure t
  :config
  (add-hook 'typescript-mode-hook #'my/tide-setup)
  (add-hook 'before-save-hook 'tide-format-before-save))


;; Use project-level eslint & flow settings for flycheck-js
(defun my/use-eslint-from-node-modules()
  (let* ((root (locate-dominating-file
		(or(buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint(file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun my/use-flow-from-node-modules()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
                "node_modules"))
	 (flow (and root
		    (expand-file-name "node_modules/flow-bin/vendor/flow"
                                      root))))
    (when (and flow(file-executable-p flow))
      (setq-local flycheck-javascript-flow-executable flow))))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :config
  (add-hook 'js2-mode-hook #'my/tide-setup)
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules))

(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

(provide 'init-js)
;;; init-js.el ends here

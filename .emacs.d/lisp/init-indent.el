;;; package --- initialize indentation
;;; Commentary:
;;; Code:

(use-package aggressive-indent
  :ensure t
  :config
  ;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode))
  (global-aggressive-indent-mode 1))

(setq-default c-basic-offset 4)

(provide 'init-indent)
;;; init-indent.el ends here

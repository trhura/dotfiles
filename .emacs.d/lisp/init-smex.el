;;; package --- initialize indentation
;;; Commentary:
;;; Code:

(use-package smex
    :defer t
    :bind (("M-x" . smex)
           ("M-X" . smex-major-mode-commands)
           ;; This is your old M-x.
           ("C-c M-x" . execute-extended-command)
           ("A-x" . execute-extended-command))
    :config
    (smex-initialize)
    :ensure t)

(provide 'init-smex)
;;; init-smex.el ends here

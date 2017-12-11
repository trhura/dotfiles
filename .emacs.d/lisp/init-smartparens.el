;;; package --- initialize smartparens
;;; Commentary:
;;; Code:

(use-package smartparens
  :ensure t
  :init (require 'smartparens-config)
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))


(provide 'init-smartparens)
;;; init-smartparens.el ends here

;;; package --- initialize overall display settings
;;; Commentary:
;;; Code:

;; Install fonts https://github.com/powerline/fonts
(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(tool-bar-mode 0);; Hide annoying toolbar
(menu-bar-mode 0);; Hide annoying menubar

(use-package ample-zen-theme
  :ensure t
  :config (load-theme 'wombat t))

;; disable multiple windows on startup
(add-hook 'window-setup-hook 'delete-other-windows)
(add-hook 'emacs-startup-hook 'delete-other-windows)

(provide 'init-display)
;;; init-display.el ends here

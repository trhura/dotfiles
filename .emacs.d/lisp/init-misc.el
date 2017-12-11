;;; package --- initialize misc settings
;;; Commentary:
;;; Code:

;; No more custom please
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq server-use-tcp t
      backup-inhibited t
      auto-save-default nil
      inhibit-startup-buffer-menu t)

(use-package time-stamp
  :commands time-stamp
  :init (add-hook 'before-save-hook 'time-stamp)
  :config (progn
	    ;; Turn on time stamping
	    (setq time-stamp-active t)
	    ;; Sets new format for the time stamp, also used with the creation tag.
	    (setq time-stamp-format "%02d/%02m/%:y %02H:%02M:%02S %U")))

(provide 'init-misc)
;;; init-misc.el ends here

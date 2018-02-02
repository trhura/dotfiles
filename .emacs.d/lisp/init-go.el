;;; package --- initialize golang
;;; Commentary:
;;; https://github.com/sigma/dotemacs/blob/master/lisp/config/go-config.el
;;; Code:

;; Install these packages
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u github.com/nsf/gocode
;; go get -u github.com/golang/lint/golint
;; go get -u gopkg.in/alecthomas/gometalinter.v1
;; gometalinter --install

(defun my/go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save t)

  ;; Customize compile command to run go build
  (if (not (and (stringp compile-command)
                ;; so that we can have a per-project setting too
                (string-match "go" compile-command)))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet && golint && gocyclo -over 15 ."))

  ;; company-go
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)

  ;; go-eldoc
  (go-eldoc-setup)

  ;; eyes and hands comfort
  (subword-mode 1))

(use-package go-eldoc
  :ensure t)

(use-package company-go
  :config (setq company-go-show-annotation t)
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  ;; needed for gofmt replacement
  (setq gofmt-command "goimports")
  (bind-key "M-." 'godef-jump go-mode-map)
  (add-hook 'go-mode-hook 'my/go-mode-hook))

(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))

(provide 'init-go)
;;; init-go.el ends here

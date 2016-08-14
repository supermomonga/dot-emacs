
;;; Code:
(el-get-bundle go-mode)
(el-get-bundle go-autocomplete)
;; (el-get-bundle! go-eldoc)

(defun my-go-mode-hook ()
  (lambda ()
    (setq gofmt-command "goimports")
    ;; (set (make-local-variable 'compile-command)
    ;;      "go build -v && go test -v && go vet")
    ;; (local-set-key (kbd "M-.") 'godef-jump)
    ))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'my-go-mode-hook)


(let ((gopath (expand-file-name "~/.go")))
  (setenv "GOPATH" gopath)
  (setenv "GOPATH" (concat (getenv "GOPATH")
                           ":"
                           (expand-file-name "~/")))
  (append-path (concat gopath "/bin"))
  (apply-path))


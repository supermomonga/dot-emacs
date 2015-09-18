
(setq eshell-directory-name (locate-user-emacs-file "cache/eshell/"))
(setq eshell-history-size 100000)

;;(add-hook 'after-init-hook (lambda() (eshell)))

(defun my/eshell-mode-hook ()
  (setq-local ac-sources
              '(
                ac-source-pcomplete
                ac-source-functions
                ac-source-symbols
                ac-source-variables
                ))
  (setq-local ac-auto-start nil)
  (evil-define-key 'insert ac-mode-map (kbd "TAB") 'auto-complete)
  (setq-local show-trailing-whitespace nil))

(add-hook 'eshell-mode-hook 'add-pcomplete-to-capf)
(add-hook 'eshell-mode-hook 'my/eshell-mode-hook)

(setq eshell-command-aliases-list '())
(add-to-list 'eshell-command-aliases-list (list "op" "open ."))
(add-to-list 'eshell-command-aliases-list (list "ls" "ls -la"))
(add-to-list 'eshell-command-aliases-list (list "e" "find-file $1"))
;; Ruby bundler
(add-to-list 'eshell-command-aliases-list (list "be" "bundle exec $*"))
(add-to-list 'eshell-command-aliases-list (list "bi" "bundle install"))
(add-to-list 'eshell-command-aliases-list (list "bu" "bundle update"))
;; Git
(add-to-list 'eshell-command-aliases-list (list "git" "gh $*"))
(add-to-list 'eshell-command-aliases-list (list "gb" "git browse"))
(add-to-list 'eshell-command-aliases-list (list "gs" "git status"))
(add-to-list 'eshell-command-aliases-list (list "ga" "git add $*"))
(add-to-list 'eshell-command-aliases-list (list "gd" "git diff"))
(add-to-list 'eshell-command-aliases-list (list "gc" "git commit $*"))
(add-to-list 'eshell-command-aliases-list (list "gcm" "git commit -m $*"))
(add-to-list 'eshell-command-aliases-list (list "gcam" "git commit -am $*"))

(setq eshell-prompt-regexp "^[~/].* ❯ ")
(setq eshell-prompt-function (lambda ()
             (concat
        (abbreviate-file-name (eshell/pwd))
        " ❯ ")))

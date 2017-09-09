
(el-get-bundle term-run)

(setq explicit-shell-file-name "/bin/sh")

(add-to-list 'same-window-regexps "Term-Run")

(defun my/term-mode-hook ()
  ;; (face-remap-add-relative 'default :background "#000000")
  (setq-local show-trailing-whitespace nil))

(add-hook 'term-mode-hook 'my/term-mode-hook)

(evil-set-initial-state 'term-mode 'motion)

(defun htop ()
  (interactive)
  (term-run-shell-command "htop"))

(defun twterm ()
  (interactive)
  (term-run-shell-command "twterm"))

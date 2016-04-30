
;;; Code:
(setf slime-lisp-implementations
      `((sbcl    ("sbcl" "--dynamic-space-size" "2000"))
        (roswell ("ros" "dynamic-space-size=2000" "-Q" "-l" "~/.sbclrc" "run"))))

(append-path "~/.roswell/bin/")

(setf slime-default-lisp 'roswell)

(defun my/slime-with-qlot ()
  (interactive)
  (let* ((slime-connected-hook (append slime-connected-hook
                                       (lambda ()
                                         (message "!!!!!!!!!!!!!!")
                                         (slime-repl-eval-string
                                          "(progn (ql:quickload :qlot))"))))
         (slime-default-lisp 'roswell-qlot)
         (project-dir (repository-root default-directory))
         (slime-lisp-implementations
          (list (append
                 '(roswell-qlot ("qlot" "exec" "ros" "dynamic-space-size=2000" "-Q" "-l" "~/.sbclrc" "run"))
                 (list :directory project-dir)))))
    (slime)))

(let ((slime-default-lisp 'moge))
  slime-default-lisp)

(setq slime-startup-animation nil)

(defun my/slime-repl-pop ()
  (interactive)
  (popwin:popup-buffer "*slime-repl roswell*"))

(with-eval-after-load 'slime
  (add-to-list 'slime-contribs 'slime-autodoc)
  (slime-setup '(slime-repl slime-fancy slime-banner))
  (evil-define-key 'normal lisp-mode-map (kbd "SPC d") 'slime-documentation)
  (evil-define-key 'normal lisp-mode-map (kbd "SPC p") 'my/slime-repl-pop)
  (evil-define-key 'normal slime-repl-mode-map (kbd "C-p") 'slime-repl-previous-input)
  (evil-define-key 'normal slime-repl-mode-map (kbd "C-n") 'slime-repl-next-input)
  (evil-define-key 'insert slime-repl-mode-map (kbd "C-p") 'slime-repl-previous-input)
  (evil-define-key 'insert slime-repl-mode-map (kbd "C-n") 'slime-repl-next-input)
  (evil-define-key 'insert slime-repl-mode-map (kbd "C-a") 'beginning-of-line))

(el-get-bundle ac-slime)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; Kill slime buffer
(defun slime-smart-quit ()
  (interactive)
  (when (slime-connected-p)
    (slime-quit-lisp)
    (slime-disconnect))
  (slime-kill-all-buffers))

; Emacs終了時に自動的に呼び出し
(add-hook 'kill-emacs-hook 'slime-smart-quit)

(defun my/slime-repl-mode-hook ()
  (setq-local show-trailing-whitespace nil))

(add-hook 'slime-repl-mode-hook 'my/slime-repl-mode-hook)

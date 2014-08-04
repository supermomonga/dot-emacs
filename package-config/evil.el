
;; Behavior
(setq evil-search-module 'evil-search)
;; Don't use emacs-state in any modes
(setq evil-emacs-state-modes nil)

(el-get 'sync 'evil)
(el-get 'sync 'evil-indent-textobject)
;; (el-get 'sync 'evil-leader)
(el-get 'sync 'evil-matchit)
(el-get 'sync 'evil-nerd-commenter)
(el-get 'sync 'evil-numbers)
(el-get 'sync 'evil-paredit)
(el-get 'sync 'evil-surround)

(bundle 'evil
	    (evil-mode 1)
	    ;; keymap
	    (define-key evil-normal-state-map (kbd "C-h") #'(lambda ()
							      (interactive)
							      (evil-insert-state)
							      (insert-string " ")
							      (evil-normal-state)))
	    (define-key evil-normal-state-map (kbd "C-l") #'(lambda ()
							      (interactive)
							      (evil-insert-state)
							      (insert-string " ")
							      (evil-normal-state)
							      (evil-forward-char)
							      ))
			(define-key evil-normal-state-map (kbd "|") 'evil-window-vsplit)
			(define-key evil-normal-state-map (kbd "_") 'evil-window-split)
	    (define-key evil-motion-state-map (kbd ";") 'evil-ex)
	    (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
	    (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

			;;; bind escape key to cancel or go back to normal state
			(defun evil-escape-or-quit (&optional prompt)
				(interactive)
				(cond
				 ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
							(evil-replace-state-p) (evil-visual-state-p)) (kbd "<escape>"))
				 (t (kbd "C-g"))))
			(define-key key-translation-map (kbd "s-w") #'evil-escape-or-quit)
			(define-key evil-operator-state-map (kbd "s-w") #'evil-escape-or-quit)
			(keyboard-translate ?\e ?\s-w)
			;; (define-key key-translation-map (kbd "ESC") #'evil-escape-or-quit)
			;; (define-key evil-operator-state-map (kbd "ESC") #'evil-escape-or-quit)


	    ;; specific mode
	    ;; (evil-set-initial-state 'eshell-mode 'emacs)
	    ;; Fix cursor color
	    (setq evil-default-cursor t)
	    (set-cursor-color "#FFFFFF")
	    )

(when (require 'evil-nerd-commenter nil t)
  (define-key evil-normal-state-map (kbd "C-- C--") 'evilnc-comment-or-uncomment-lines))

(bundle 'surround
	    (global-surround-mode 1))

(when (require 'evil-matchit nil t)
  (global-evil-matchit-mode 1))

(when (require 'evil-elscreen nil t))


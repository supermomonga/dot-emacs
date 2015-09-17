
(el-get-bundle! elpa:evil)

;; enable evil
(evil-mode t)
(setq evil-emacs-state-modes nil)

(evil-define-command evil-quit-without-kill (&optional force)
  "Closes the current window, current frame, Emacs.
If the current frame belongs to some client the client connection
is closed."
  :repeat nil
  (interactive "<!>")
  (condition-case nil (delete-window)
    (error
     (if (and (boundp 'server-buffer-clients)
              (fboundp 'server-edit)
              (fboundp 'server-buffer-done)
              server-buffer-clients)
         (if force (server-buffer-done (current-buffer)) (server-edit))
       (condition-case nil (delete-frame)
         (error (if force (kill-emacs) (kill-buffer))))))))
(evil-ex-define-cmd "q[uit]" 'evil-quit-without-kill)

;; for eshell
(with-eval-after-load 'eshell
  (evil-define-key 'insert eshell-mode-map (kbd "C-i")   'company-complete)
  (evil-define-key 'insert eshell-mode-map (kbd "<tab>") 'company-complete)
  (evil-define-key 'normal eshell-mode-map (kbd "C-k") 'eshell-previous-prompt)
  (evil-define-key 'normal eshell-mode-map (kbd "C-j") 'eshell-next-prompt)
  (evil-define-key 'normal eshell-mode-map (kbd "C-p") 'eshell-previous-prompt)
  (evil-define-key 'normal eshell-mode-map (kbd "C-n") 'eshell-next-prompt)
  (evil-define-key 'normal eshell-mode-map (kbd "0") 'eshell-bol)
  (evil-define-key 'insert eshell-mode-map (kbd "C-a") 'eshell-bol)
  (evil-define-key 'insert eshell-mode-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
  (evil-define-key 'insert eshell-mode-map (kbd "C-n") 'eshell-next-matching-input-from-input))

;; surround
(el-get-bundle! elpa:evil-surround
  (global-evil-surround-mode 1))

;; anzu
(el-get-bundle elpa:evil-anzu)
(el-get-bundle! elpa:anzu
  (with-eval-after-load 'evil
    (require 'evil-anzu))
  (global-anzu-mode +1))


;; Disable default emacs key-binds
(global-unset-key (kbd "C-x C-b"))
;; (global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-f"))
(global-unset-key (kbd "M-x"))

(define-key evil-normal-state-map (kbd "C-h")
  #'(lambda ()
      (interactive)
      (evil-insert-state)
      (insert-string " ")
      (evil-normal-state)))
(define-key evil-normal-state-map (kbd "C-l")
  #'(lambda ()
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
(define-key evil-ex-search-keymap "\C-p" #'previous-complete-history-element)
(define-key evil-ex-search-keymap "\C-n" #'next-complete-history-element)
(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)


(el-get-bundle! supermomonga/evil-textobj-entire)
(el-get-bundle! supermomonga/evil-textobj-multiblock
  (define-key evil-outer-text-objects-map evil-textobj-multiblock-outer-key 'evil-multiblock-outer-block)
  (define-key evil-inner-text-objects-map evil-textobj-multiblock-inner-key 'evil-multiblock-inner-block))


;; To use ESC and Ctrl-[ like C-g
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
        (evil-replace-state-p) (evil-visual-state-p))
    (kbd "<escape>"))
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "s-w") #'evil-escape-or-quit)
(if window-system
    (keyboard-translate ?\e ?\s-w))


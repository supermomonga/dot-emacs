
;; (el-get-bundle omnisharp)

(el-get-bundle omnisharp
  :type github
  :pkgname "OmniSharp/omnisharp-emacs"
  :depends (shut-up helm flycheck)
  )

;; (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
(setq omnisharp-server-executable-path (expand-file-name "~/.emacs.d/.cache/omnisharp/server/v1.22.0/omnisharp"))


(defun my-csharp-mode-hook ()
  omnisharp-mode
  (setq-local ac-quick-help-delay 0.0)
  (setq-local ac-delay 0.5))

(defun my-ac-omnisharp-prefix ()
  "symbol or dot"
  (or (ac-prefix-default)
      (ac-prefix-c-dot)))

(defvar my-ac-source-omnisharp
  '((candidates . omnisharp--get-auto-complete-result-in-popup-format)
    (action . omnisharp--ac-expand)
    (prefix . my-ac-omnisharp-prefix)))

(defun my-omnisharp-after-save-hook ()
  ;; (when (and (omnisharp-server-running-p) (omnisharp-buffer-file-in-current-project-p))
  ;;   (omnisharp-code-format-entire-file))
  )

(defun my-turn-on-eldoc-mode () (eldoc-mode 1))
(defun my-turn-off-eldoc-mode () (eldoc-mode -1))

(defun my-ac-omnisharp-hook ()
  (add-hook 'evil-insert-state-entry-hook 'my-turn-off-eldoc-mode nil t)
  (add-hook 'evil-insert-state-exit-hook 'my-turn-on-eldoc-mode nil t)
  (add-hook 'before-save-hook 'my-omnisharp-after-save-hook nil t)
  (setq ac-sources
        '(my-ac-source-omnisharp)))

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'omnisharp-mode-hook 'my-ac-omnisharp-hook)

(evil-define-key 'normal omnisharp-mode-map (kbd "SPC d") 'omnisharp-current-type-documentation)

;; shut-up causes error
(defun omnisharp--log (single-or-multiline-log-string)
  (when omnisharp-debug
    ;; shut-up
    (let* ((log-buffer (get-buffer-create "*omnisharp-debug*")))
      (save-window-excursion
        (with-current-buffer log-buffer
          (end-of-buffer)
          (insert single-or-multiline-log-string)
          (insert "\n"))))))


;; evil cursor fix
(defadvice omnisharp--current-column (around evil activate)
  "In normal-state or motion-state, last sexp ends at point."
  ;; (let (res ad-do-it)
  ;;   (if (or (evil-normal-state-p) (evil-motion-state-p))
  ;;       (+ res 1)
  ;;     res))
  ad-do-it
  (+ 100 10)
  )

(defun advice:omnisharp--current-column (f)
  (let* ((pos (apply f nil))
         (bobdiff (if (bobp) -0 0))
         (statediff (if (or (evil-normal-state-p) (evil-motion-state-p)) 0 0)))
    (+ pos bobdiff statediff)))
(advice-remove 'omnisharp--current-column 'advice:omnisharp--current-column)
(advice-add 'omnisharp--current-column :around 'advice:omnisharp--current-column)


(defun omnisharp--display-type-information (stuff-to-display)
  (popup-tip stuff-to-display))

(defun omnisharp--display-result-message (message)
  (popup-tip message))

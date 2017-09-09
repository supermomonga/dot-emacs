;;; Highlight current line
(global-hl-line-mode 1)

;; Set margin to zero
(setq-default left-margin-width 0 right-margin-width 0)
(set-window-buffer nil (current-buffer))

;; (set-frame-parameter nil 'internal-border-width 0)

;;; Disable startup message
(setq inhibit-startup-message t)

;;; Open file when drag and frop files from another applications
(define-key global-map [ns-drag-file] 'ns-find-file)

;;; Symply use y/n to select yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;; Don't create backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;;; Hide menu bar
(menu-bar-mode 0)

;;; Hide toolbar
(if window-system
    (tool-bar-mode 0))

;;; Hide scrollbar
(if window-system
    (set-scroll-bar-mode nil))

;;; Tab width
(setq default-tab-width 4)

;;; Whitespace
(setq whitespace-style '(spaces tabs space-mark tab-mark))
(setq whitespace-display-mappings
      '(
        ;;; (space-mark 32 [183] [46]) ; normal space, ·
        (space-mark 160 [164] [95])
        (space-mark 2208 [2212] [95])
        (space-mark 2336 [2340] [95])
        (space-mark 3616 [3620] [95])
        (space-mark 3872 [3876] [95])
        (space-mark ?\x3000 [?\□]) ;;; Zenkaku space [　]
        (tab-mark ?\t [?\x276F ?\t] [?\\ ?\t]) ; tab, ❯ [ ]
        ))
(global-whitespace-mode 1)
(set-face-attribute 'whitespace-tab nil
                    :foreground "LightSkyBlue"
                    :underline t)

;;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;;; Show line number
(global-linum-mode t)
(setq linum-exceptional-regexp-list '("\\*cider-.+\\*" "\\*eshell\\*" " \\*WM:.+" "\\*scratch\\*" ".+helm.+" "\\*Async Shell Command\\*" "Term-Run"))
(defvar linum-exceptional-mode-list '(direx:direx-mode slack-mode help-mode))

(defadvice linum-mode (around hoge activate)
  (when (or (eq linum-mode t)
            (and (not (cl-find
                       (buffer-name)
                       linum-exceptional-regexp-list :test (lambda (str rx) (string-match rx str))))
                 (not (cl-find
                       major-mode
                       linum-exceptional-mode-list :test (lambda (buf-mode mode) (eq buf-mode mode))))))
    ad-do-it))

;;; Always truncate lines
(global-visual-line-mode)


;; Highlight respond parent
(show-paren-mode t)

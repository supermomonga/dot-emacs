;;; Font
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'jit-lock-mode))

(when window-system
  (create-fontset-from-ascii-font "Source Code Pro Light-14:weight=normal:slant=normal" nil "september")
  ;; Symbola font: http://users.teilar.gr/~g1951d/
  (set-fontset-font "fontset-september" '(#x2700 . #x27BF) (font-spec :family "Symbola" :size 14) nil 'append)
  (set-fontset-font "fontset-september" 'japanese-jisx0208 (font-spec :family "September" :size 14) nil 'append)
  (set-fontset-font "fontset-september" 'katakana-jisx0201 (font-spec :family "September" :size 14) nil 'append) ;; hankaku kana
  (add-to-list 'default-frame-alist '(font . "fontset-september"))
  (global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
  (global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
  (global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-increase 0))))



;;; Highlight current line
(global-hl-line-mode 1)

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
(tool-bar-mode 0)

;;; Hide scrollbar
(set-scroll-bar-mode nil)


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
(defvar linum-exceptional-regexp-list '("\\*cider-.+\\*" "\\*eshell\\*" " \\*WM:.+" "\\*scratch\\*" ".+helm.+"))

(defadvice linum-mode (around hoge activate)
  (when (or (eq linum-mode t)
            (not (cl-find (buffer-name) linum-exceptional-regexp-list :test (lambda (str rx) (string-match rx str)))))
    ad-do-it))

;;; Always truncate lines
(setq-default global-visual-line-mode t)


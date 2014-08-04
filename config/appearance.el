
(setq whitespace-style '(spaces tabs space-mark tab-mark))
(setq whitespace-display-mappings
      '(
	;; (space-mark 32 [183] [46]) ; normal space, ·
        (space-mark 160 [164] [95])
        (space-mark 2208 [2212] [95])
        (space-mark 2336 [2340] [95])
        (space-mark 3616 [3620] [95])
        (space-mark 3872 [3876] [95])
        (space-mark ?\x3000 [?\□]) ;; Zenkaku space
        (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
        ))

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Transparent window
;; (set-frame-parameter (selected-frame) 'alpha '(100 100))

;; Hide toolbar
(tool-bar-mode 0)

;; Hide scrollbar
(set-scroll-bar-mode nil)

;; (column-number-mode t)

;; Show line number
;; (global-linum-mode t)

;; Window transparency
;; (set-frame-parameter nil 'alpha 97)


;; hex color
(defvar hexcolor-keywords
  '(("#[ABCDEFabcdef0-9]\\{3,6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))

(defun hexcolor-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolor-keywords))

(add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-add-to-font-lock)


;; Show empty line marker
(setq indicate-empty-lines t)


;; normal-state map
(evil-define-key 'normal eshell-mode-map (kbd "C-k") 'eshell-previous-prompt)
(evil-define-key 'normal eshell-mode-map (kbd "C-j") 'eshell-next-prompt)
(evil-define-key 'normal eshell-mode-map (kbd "C-p") 'eshell-previous-prompt)
(evil-define-key 'normal eshell-mode-map (kbd "C-n") 'eshell-next-prompt)
(evil-define-key 'normal eshell-mode-map (kbd "i") 'evilshell/insert-state)
(evil-define-key 'normal eshell-mode-map (kbd "0") 'eshell-bol)

;; insert-state map
(evil-define-key 'insert eshell-mode-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
(evil-define-key 'insert eshell-mode-map (kbd "C-n") 'eshell-next-matching-input-from-input)
;;; Need to define those two keybinds to overwrite TAB key
(evil-define-key 'insert eshell-mode-map (kbd "C-i") 'auto-complete)
(evil-define-key 'insert eshell-mode-map (kbd "<tab>") 'auto-complete)

;; Startup message
(setq eshell-banner-message "
萌えるエディタは正義の印！！（ﾋﾞﾑｲ〜ﾝ）

卑劣な環境を打ち砕く！！｡ﾟ+.*(+･｀ω･)9


びびびびびびび びむびむーっ！(」*ﾟﾛﾟ)」
びびび びむびむーっ！(」*ﾟﾛﾟ)」*ﾟﾛﾟ)」
ｊｋｊｋｊｋｊｋ 大好き～っ☆⌒ヽ(*'､＾*)

ビムで世界中シ・ア・ワ・セ☆(b^ｰﾟ)

")

;; Theme
(custom-set-faces
 '(eshell-prompt ((t (:foreground "#CC7833" :weight normal))))
)

;; Dont highlight trailing whitespace in eshell
(add-hook 'eshell-mode-hook
          (lambda ()
						(setq-local ac-sources
									'(ac-source-pcomplete
										ac-source-filename
										;; ac-source-files-in-current-dir
										;; ac-source-words-in-buffer
										ac-source-dictionary
										))
						(setq-local ac-auto-start nil)
						(evil-define-key 'insert ac-mode-map (kbd "TAB") 'auto-complete)
            (setq-local show-trailing-whitespace nil)))

(add-hook 'eshell-preoutput-filter-functions
					'ansi-color-filter-apply)

(require 'ansi-color)
(add-hook 'eshell-load-hook 'ansi-color-for-comint-mode-on)


;; Launch eshell after initialize emacs
(add-hook 'after-init-hook (lambda() (eshell)))

;; Aliases
(setq eshell-command-aliases-list '())
(add-to-list 'eshell-command-aliases-list (list "op" "open ."))
(add-to-list 'eshell-command-aliases-list (list "ls" "ls -la"))
(add-to-list 'eshell-command-aliases-list (list "e" "find-file $1"))
(add-to-list 'eshell-command-aliases-list (list "be" "bundle exec $1"))

;; Prompt
(setq eshell-prompt-regexp "^[~/].* ❯ ")
(setq eshell-prompt-function (lambda ()
			       (concat
				(abbreviate-file-name (eshell/pwd))
				" ❯ ")))

;; ;; (setq eshell-prompt-regexp "^\\([~/]?*$\\|❯ \\)")
;; (setq eshell-prompt-function (lambda ()
;; 			       (concat
;; 				(abbreviate-file-name (eshell/pwd))
;; 				"\n"
;; 				"❯ ")))

;; (defcustom eshell-prompt-regexp-lastline "^❯ "
;;   "A regexp pattern of the last line of multi-line prompt"
;;   :type 'regexp
;;   :group 'eshell-prompt)

;; ;; Treat multi-line prompt
;; (defadvice eshell-skip-prompt (around eshell-skip-prompt-ext activate)
;;   (if (looking-at eshell-prompt-regexp)
;;       (re-search-forward eshell-prompt-regexp-lastline nil t)))

(defun evilshell/cd (dir)
  ;; Start eshell and move to home directory,
  ;; then enable insert state.
  (interactive)
  (eshell)
  (eshell/cd dir)
  (eshell-send-input)
  (evil-insert-state)
  (eshell-bol)
  )

(defun evilshell/insert-state ()
  (interactive)
  (evil-insert-state)
  (eshell-bol)
)

;; (defun evilshell/insert-state ()
;;   (interactive)
;;   (evil-insert-state)
;;   (eshell-bol)
;; )

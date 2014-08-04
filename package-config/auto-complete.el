
(el-get 'sync 'auto-complete)


(bundle 'auto-complete
	(require 'auto-complete-config)
	(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
	(ac-config-default)
	(setq ac-use-menu-map t)
	(setq ac-menu-height 20)
	;; (print ac-modes)
	;; (set-face-background 'ac-candidate-face "lightgray")
	;; (set-face-underline 'ac-candidate-face "darkgray")
	;; (set-face-background 'ac-selection-face "steelblue")
	;; (print ac-use-quick-help)
	;; (setq ac-quick-help-prefer-x t)
	(setq ac-quick-help-delay 0.0)
	(ac-define-source pcomplete
	  '((candidates . pcomplete-completions)))
	;; ac-sources
	(defvar my-ac-sources
		'(ac-source-yasnippet
			ac-source-abbrev
			ac-source-dictionary
			ac-source-words-in-same-mode-buffers))
	(add-to-list 'ac-sources 'ac-source-yasnippet)
	(add-to-list 'ac-modes 'eshell-mode)
	(add-to-list 'ac-modes 'coffee-mode)
	(add-to-list 'ac-modes 'clojure-mode)
	(add-to-list 'ac-modes 'go-mode)
	(add-to-list 'ac-modes 'ruby-mode)
	;; (print ac-sources)
	;; (evil-define-key 'normal eshell-mode-map (kbd "C-M-i") 'auto-complete)
	;; (evil-define-key 'insert eshell-mode-map (kbd "C-M-i") 'auto-complete)
	)



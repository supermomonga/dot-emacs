
;; Treat rbenv
(el-get 'sync 'rbenv)

;; Improved highlight, indent, and benri features like syntax checker.
(el-get 'sync 'Enhanced-Ruby-Mode)

;; auto insert `end` for block
(el-get 'sync 'ruby-end)

;; auto insert `end` for block
(el-get 'sync 'ruby-electric)

;; Highlight pair blocks
(el-get 'sync 'ruby-block)

(bundle 'rbenv)

(bundle 'Enhanced-Ruby-Mode
	(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
	(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
	(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
	)

(bundle 'ruby-block
	(ruby-block-mode t)
	(setq ruby-block-highlight-toggle t))

;; (bundle 'ruby-end t)

(add-hook 'enh-ruby-mode-hook '(lambda ()
																 (bundle 'ruby-electric (ruby-electric-mode t))
																 (add-to-list 'ac-sources 'ac-source-yasnippet)
																 ))


(bundle 'auto-complete
	(add-to-list 'ac-modes 'enh-ruby-mode))


;; template
(define-auto-insert "\.rb" "template.rb")
(define-auto-insert "Gemfile" "Gemfile")


;; Treat Gemfile as ruby script
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))



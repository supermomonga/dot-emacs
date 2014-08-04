
(add-to-list 'el-get-sources
             '(
							 :name yasnippet-golang
										 :type github
										 :website "https://github.com/atotto/yasnippet-golang"
										 :description "emacs snippet (yasnippets) for golang"
										 :pkgname "atotto/yasnippet-golang")
						 )

(el-get 'sync 'go-mode)
(el-get 'sync 'go-autocomplete)
(bundle 'direx (el-get 'sync 'go-direx))
(el-get 'sync 'go-def)
(el-get 'sync 'go-eldoc)
(el-get 'sync 'yasnippet-golang)


;; yas-snippet-dirs

(bundle 'auto-complete
	(add-to-list 'ac-modes 'go-mode))

(add-hook 'go-mode-hook '(lambda ()
													 (add-to-list 'ac-sources 'ac-source-yasnippet)
													 (setq tab-width 2)))

(add-hook 'before-save-hook 'gofmt-before-save)

(bundle 'go-direx
	(evil-define-key 'normal go-mode-map (kbd "SPC e") 'go-direx-pop-to-buffer))

(bundle 'go-eldoc
	;; (set-face-attribute 'eldoc-highlight-function-argument nil
        ;;             :underline t :foreground "green"
        ;;             :weight 'bold)
	(add-hook 'go-mode-hook 'go-eldoc-setup))


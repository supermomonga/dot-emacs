

(el-get 'sync 'yasnippet)
(el-get 'sync 'dropdown-list)



(bundle 'yasnippet
				(require 'dropdown-list nil t)
				(setq yas-prompt-functions '(yas-dropdown-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt))
				(add-to-list 'yas-snippet-dirs "~/.emacs.d/el-get/yasnippet-golang")
				(yas-global-mode 1))

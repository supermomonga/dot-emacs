

(el-get 'sync 'e2wm)


(bundle 'e2wm
				;; keybinds
				;;; Toggle e2wm
				(define-key evil-normal-state-map (kbd "SPC m")
					#'(lambda ()
							(interactive)
							(if (e2wm:managed-p)
									(e2wm:stop-management)
								  (e2wm:start-management))))
				(evil-define-key nil e2wm:pst-minor-mode-keymap (kbd "<M-left>") 'e2wm:dp-code)
				(evil-define-key nil e2wm:pst-minor-mode-keymap (kbd "<M-right>") 'e2wm:dp-two)
				(evil-define-key nil e2wm:pst-minor-mode-keymap (kbd "<M-up>") 'e2wm:dp-dashboard)
				(evil-define-key nil e2wm:pst-minor-mode-keymap (kbd "<M-down>") 'e2wm:dp-doc)


;; its 80 chars
; ------------------------------------------------------------------------------
				(setq e2wm:c-code-recipe
							'(| (:left-max-size 30)
									(- (:upper-size-ratio 0.7) files history)
									(- (:upper-size-ratio 0.7)
										 (| (:right-max-size 35) main imenu)
										 sub)))
				(add-hook 'e2wm:def-plugin-files-mode-hook '(lambda ()
																											(buffer-face-set (font-face-attributes "Source Code Pro Light-12:weight=normal:slant=normal"))
																											))
				(add-hook 'e2wm:def-plugin-imenu-mode-hook '(lambda ()
																											(buffer-face-set (font-face-attributes "Source Code Pro Light-12:weight=normal:slant=normal"))
																											))

				(add-hook 'e2wm:pre-start-hook '(lambda () (tabbar-mode 0)))
				(add-hook 'e2wm:post-stop-hook '(lambda () (tabbar-mode t)))

        ;;; Plugin: Files
				;;; e2wm:def-plugin-files-mode-map
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "RET") 'e2wm:def-plugin-files-select-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "SPC") 'e2wm:def-plugin-files-show-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "+") 'e2wm:def-plugin-files-mkdir-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "D") 'e2wm:def-plugin-files-open-dired-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "^") 'e2wm:def-plugin-files-updir-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "d") 'e2wm:def-plugin-files-delete-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "g") 'e2wm:def-plugin-files-update-by-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "h") 'e2wm:def-plugin-files-toggle-hidden-files-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "r") 'e2wm:def-plugin-files-rename-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "s") 'e2wm:def-plugin-files-sort-name-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "t") 'e2wm:def-plugin-files-sort-time-command)
        (evil-define-key 'normal e2wm:def-plugin-files-mode-map
					(kbd "z") 'e2wm:def-plugin-files-sort-size-command)
				;;; e2wm:def-plugin-imenu-mode-map
				(evil-define-key 'normal e2wm:def-plugin-imenu-mode-map
					(kbd "RET") 'e2wm:def-plugin-imenu-jump-command)
				(evil-define-key 'normal e2wm:def-plugin-imenu-mode-map
					(kbd "SPC") 'e2wm:def-plugin-imenu-show-command)
				;;; (print e2wm:def-plugin-history-list-mode-map)

)

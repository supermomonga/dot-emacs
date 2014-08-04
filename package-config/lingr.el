
(el-get 'sync 'lingr)
(bundle 'lingr
	(setq lingr-username secret-lingr-username
	      lingr-password secret-lingr-password
	      lingr-icon-mode t
	      lingr-image-convert-program "/usr/local/bin/convert"
	      lingr-icon-fix-size 24
	      )
	(evil-define-key 'normal lingr-room-map (kbd "j") 'lingr-room-next-nick)
	(evil-define-key 'normal lingr-room-map (kbd "k") 'lingr-room-previous-nick)
	(evil-define-key 'normal lingr-room-map (kbd "s") 'lingr-say-command)
	(evil-define-key 'normal lingr-room-map (kbd "r") 'lingr-refresh-room)
	(evil-define-key 'normal lingr-room-map (kbd "S-s") 'lingr-show-status)
	(evil-define-key 'normal lingr-room-map (kbd "C-j") 'lingr-room-next-message)
	(evil-define-key 'normal lingr-room-map (kbd "C-k") 'lingr-room-previous-message)
	;; (evil-define-key 'normal lingr-status-buffer-map (kbd "C-RET") 'lingr-status-switch-room)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "RET") 'lingr-status-switch-room)
	;; (evil-define-key 'normal lingr-status-buffer-map (kbd "RET") 'lingr-status-switch-room-other-window)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "n") 'lingr-room-next-message)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "p") 'lingr-room-previous-message)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "j") 'lingr-status-next-room)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "k") 'lingr-status-previous-room)
	(evil-define-key 'normal lingr-status-buffer-map (kbd "f") 'lingr-status-jump-message)
	;; (evil-define-key 'insert lingr-status-buffer-map (kbd "C-RET") ')
	;; (print lingr-say-buffer-map)
	(defun lingr-notif-message (message)
	  (notif (concat "Lingr " (lingr-message-room message))
		 (concat (lingr-message-nick message) ":" (lingr-message-text message))))
	(add-hook 'lingr-message-hook 'lingr-notif-message)
	)

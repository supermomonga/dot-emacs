

(evil-define-key 'normal twittering-mode-map (kbd "SPC r") 'twittering-replies-timeline)
(evil-define-key 'normal twittering-mode-map (kbd "SPC h") 'twittering-home-timeline)
(evil-define-key 'normal twittering-mode-map (kbd "SPC d") 'twittering-direct-messages-timeline)
(evil-define-key 'normal twittering-mode-map (kbd "t") 'twittering-retweet)
(evil-define-key 'normal twittering-mode-map (kbd "v") 'twittering-other-user-timeline)
(evil-define-key 'normal twittering-mode-map (kbd "V") 'twittering-visit-timeline)
(evil-define-key 'normal twittering-mode-map (kbd "C-m") 'twittering-enter)
(evil-define-key 'normal twittering-mode-map (kbd "L") 'twittering-other-user-list-interactive)
(evil-define-key 'normal twittering-mode-map (kbd "j") 'twittering-goto-next-status)
(evil-define-key 'normal twittering-mode-map (kbd "k") 'twittering-goto-previous-status)
(evil-define-key 'normal twittering-mode-map (kbd "f") 'twittering-favorite)
(evil-define-key 'normal twittering-mode-map (kbd "a") 'twittering-toggle-activate-buffer)
(evil-define-key 'normal twittering-mode-map (kbd "i") 'twittering-icon-mode)
(evil-define-key 'normal twittering-mode-map (kbd "s") 'twittering-update-status-interactive)
(evil-define-key 'normal twittering-mode-map (kbd "u") 'twittering-push-uri-onto-kill-ring)
;; (evil-define-key 'normal twittering-mode-map (kbd "") 'twittering-)
;; (evil-define-key 'normal twittering-mode-map (kbd "") 'twittering-)
(evil-define-key 'normal twittering-edit-mode-map (kbd "<C-return>") 'twittering-edit-post-status)
(evil-define-key 'insert twittering-edit-mode-map (kbd "<C-return>") 'twittering-edit-post-status)

(setq twittering-status-format "%i %S(%s), %F  %@ from %f%L%r%R\n%FILL[     ]{%T}\n ")
(setq twittering-convert-fix-size 36)

(el-get 'sync 'twittering-mode)
(bundle 'twittering-mode
	(require 'epa-file nil t)
	(setq twittering-use-master-password t)
	(setq twittering-icon-mode t)
	(setq twittering-timer-interval 300)
	(add-hook 'twittering-mode-hook
						'(lambda () (setq-local show-trailing-whitespace nil))))












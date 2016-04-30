


(el-get-bundle direx)



(define-key evil-normal-state-map (kbd "SPC e") 'direx:jump-to-directory-other-window)

(evil-define-key 'normal direx:direx-mode-map (kbd "D") 'direx:do-delete-files)
(evil-define-key 'normal direx:direx-mode-map (kbd "r") 'direx:do-rename-file)
(evil-define-key 'normal direx:direx-mode-map (kbd "j") 'direx:next-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "k") 'direx:previous-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-j") 'direx:next-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-k") 'direx:previous-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "SPC") 'direx:toggle-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "RET") 'direx:find-item)

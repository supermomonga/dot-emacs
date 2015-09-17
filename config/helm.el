
(el-get-bundle elpa:helm
  (define-key evil-normal-state-map (kbd "SPC f") 'helm-mini)
  (define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)
  (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC s") 'helm-swoop)
  (define-key evil-normal-state-map (kbd "SPC g") 'helm-ag))

(el-get-bundle elpa:helm-ag)
(el-get-bundle elpa:helm-descbinds)
(el-get-bundle elpa:helm-swoop)

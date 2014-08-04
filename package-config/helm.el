
(el-get 'sync 'helm)
(el-get 'sync 'helm-descbinds)
(bundle 'helm
	    (define-key evil-normal-state-map (kbd "SPC f") 'helm-mini)
	    (define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)
	    (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
			(define-key evil-normal-state-map (kbd "SPC s") 'helm-yas-complete)
	    )

(when (require 'helm-descbinds nil t))



(el-get 'sync 'tabbar)


(bundle 'tabbar
	(tabbar-mode 1)
	(tabbar-mwheel-mode -1)
	(setq tabbar-buffer-groups-function nil)
	(dolist (btn '(tabbar-buffer-home-button tabbar-scroll-left-button tabbar-scroll-right-button))
	  (set btn (cons (cons "" nil) (cons "" nil))))
	;; (setq tabbar-auto-scroll-flag nil)
	(setq tabbar-separator '(1.0))
	;;;
	(custom-set-variables
	 ;; custom-set-variables was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(tabbar-background-color "#323232")
	 '(tabbar-cycle-scope (quote tabs)))
	(custom-set-faces
	 ;; custom-set-faces was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(tabbar-default ((t (:background "#424242" :foreground "#999" :height 0.9))))
	 '(tabbar-unselected ((t (:background "#424242" :foreground "#999" :height 0.9))))
	 '(tabbar-selected ((t (:background "#424242" :foreground "#fff" :height 0.9))))
	 '(tabbar-button ((t (:background "#424242" :foreground "#999"))))
	 '(tabbar-button-highlight ((t (:background "#424242" :foreground "#999"))))
	 '(tabbar-modified ((t (:background "#424242" :foreground "#999" :height 0.9))))
	 '(tabbar-separator ((t (:background "#424242" :height 1.0)))))
	;;;
	;; (set-face-attribute 'tabbar-default    nil :background "#323232" :foreground "#999999" :family "September" :height 0.9 :box nil)
	;; (set-face-attribute 'tabbar-default    nil :background "#323232" :foreground "#999999" :height 0.9 :box nil)
	;; (set-face-attribute 'tabbar-unselected nil :background "#424242" :foreground "#999999" :box nil)
	;; (set-face-attribute 'tabbar-selected   nil :background "#424242" :foreground "#ffffff" :box nil)
	;; (set-face-attribute 'tabbar-button nil :box nil)
	;; (set-face-attribute 'tabbar-separator nil :height 1.0 :background "#424242")
	(defvar my-tabbar-show-buffers
	  '("*Faces*" "*vc-" "*eshell*" "*Lingr Status*"))
	(defvar my-tabbar-hide-buffers
	  '("*" "Lingr["))
	(defun my-tabbar-buffer-list ()
	  ;; (let* ((hides (list ?\  ?\*))
	  (let* ((hides (regexp-opt my-tabbar-hide-buffers))
		 (shows (regexp-opt my-tabbar-show-buffers))
		 (cur-buf (current-buffer))
		 (tabs (delq
			nil
			(mapcar (lambda (buf)
				  (let ((name (buffer-name buf)))
				    (when (or (string-match shows name)
					      (not (string-match hides name)))
				      buf)))
				(buffer-list)))))
	    (if (memq cur-buf tabs) tabs (cons cur-buf tabs))))
	(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
	)

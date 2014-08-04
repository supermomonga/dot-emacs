
(el-get 'sync 'smartrep)
(el-get 'sync 'tabbar)

(defun smart-forward-buffer ()
	(cond ((tabbar-mode-on-p) (tabbar-forward-tab))
				((e2wm:managed-p) (e2wm:pst-history-back-command))))

(defun smart-backward-buffer ()
	(cond ((tabbar-mode-on-p) (tabbar-backward-tab))
				((e2wm:managed-p) (e2wm:pst-history-forward-command))))

(bundle 'smartrep
	(smartrep-define-key evil-normal-state-map "C-w"
	  '((">" . 'evil-window-increase-width)
	    ("<" . 'evil-window-decrease-width)
			("+" . 'evil-window-increase-height)
			("-" . 'evil-window-decrease-height)))
	(smartrep-define-key evil-normal-state-map "C-c"
	  '(("+" . 'evil-numbers/inc-at-pt)
	    ("-" . 'evil-numbers/dec-at-pt)))
	(bundle 'tabbar
		(smartrep-define-key evil-normal-state-map "g"
		  '(("t" . 'smart-forward-buffer)
		    ("T" . 'smart-backward-buffer)))
		)
)



(add-to-list 'el-get-sources
             '(:name railscasts-theme
										 :type github
										 :website "https://github.com/itiut/railscasts-theme"
										 :description "Railscasts color theme for GNU Emacs 24"
										 :pkgname "itiut/railscasts-theme")

						 )
(add-to-list 'el-get-sources
             '(:name replace-colorthemes
		     :type github
		     :website "https://github.com/emacs-jp/replace-colorthemes"
		     :description "Replace color-theme with Emacs theme framework"
		     :pkgname "emacs-jp/replace-colorthemes")

	     )


(bundle 'helm-themes)

(el-get 'sync 'replace-colorthemes)
(bundle 'replace-colorthemes
	(add-to-list 'custom-theme-load-path
		     (file-name-as-directory "~/.emacs.d/el-get/replace-colorthemes/"))
	(load-theme 'desert t nil))

(el-get 'sync 'railscasts-theme)
(bundle 'railscasts-theme
	(add-to-list 'custom-theme-load-path
		     (file-name-as-directory "~/.emacs.d/el-get/railscasts-theme/"))
	(load-theme 'railscasts t nil))




;; (enable-theme 'desert)
(enable-theme 'railscasts)

(set-face-background 'default "#2b2b2b")
(set-face-background 'fringe "#2b2b2b")
(set-face-foreground 'vertical-border "#414141")
(set-face-background 'highlight "#3c3c3c")
(set-face-foreground 'highlight nil)
(set-face-background 'region "#6c6c6c")
(set-face-foreground 'region nil)
(set-face-attribute hl-line-face nil :underline nil)
(set-cursor-color "#FFFFFF")

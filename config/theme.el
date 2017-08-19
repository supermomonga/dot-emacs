(el-get-bundle! itiut/railscasts-theme
  (add-to-list 'custom-theme-load-path
         (file-name-as-directory "~/.emacs.d/el-get/railscasts-theme/"))
  ;; (load-theme 'railscasts t nil)
  ;; (enable-theme 'railscasts)

  (load-theme 'railscast-modified t nil)
  (enable-theme 'railscast-modified)
  ;; (set-face-background 'default "#2b2b2b")
  ;; (set-face-background 'fringe "#2b2b2b")
  ;; (set-face-foreground 'vertical-border "#414141")
  ;; (set-face-background 'highlight "#3c3c3c")
  ;; (set-face-foreground 'highlight nil)
  ;; (set-face-background 'region "#6c6c6c")
  ;; (set-face-foreground 'region nil)

  (set-face-attribute hl-line-face nil :underline nil)
  (set-cursor-color "#FFFFFF")
  (custom-set-faces
   '(eshell-prompt ((t (:foreground "#CC7833" :weight normal))))))

(el-get-bundle helm-themes)
(el-get-bundle! load-theme-buffer-local)

(el-get-bundle! plan9-theme
  (add-to-list 'custom-theme-load-path
         (file-name-as-directory "~/.emacs.d/el-get/plan9-theme/"))
  ;; (load-theme 'plan9 t nil)
  )


;; (set-frame-parameter nil 'background-mode 'light)


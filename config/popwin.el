
(el-get-bundle! popwin)

(popwin-mode 1)
(push '("cider-repl"
        :regexp t :noselect t)
      popwin:special-display-config)
(push '("*Help*"
        :position right :width 0.5)
      popwin:special-display-config)
(push '("*cider-doc*"
        :noselect t)
      popwin:special-display-config)
(push '("*cider-error*"
        :noselect t)
      popwin:special-display-config)
(push '("*cider-repl"
        :noselect t)
      popwin:special-display-config)
(push '("*ruby*")
      popwin:special-display-config)
(push '("*quickrun*"
        :height 0.5)
      popwin:special-display-config)
(push '("*twittering-edit*")
      popwin:special-display-config)
(push '("*coffee-compiled*"
        :position right :noselect t :width 0.5)
      popwin:special-display-config)
(push '("*el-get packages*"
        :height 0.7)
      popwin:special-display-config)
(push '(" *auto-async-byte-compile*"
        :noselect t :height 10)
      popwin:special-display-config)
;; (push '("*Async Shell Command*"
;;         :position bottom :noselect t :height 10)
;;       popwin:special-display-config)
(push '("^\*go-direx:"
        :regexp t :position left :width 30 :dedicated t :stick t)
      popwin:special-display-config)
(push '(direx:direx-mode
        :position left :width 40 :dedicated t)
      popwin:special-display-config)
(push '(slime-repl-mode
        :position bottom :height 40 :dedicated t)
      popwin:special-display-config)
;; (evil-define-key 'normal popwin:keymap (kbd "C-q") 'popwin:close-popup-window)

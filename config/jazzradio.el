
(el-get-bundle syohex/emacs-jazzradio)
(with-eval-after-load 'jazzradio
  (evil-define-key 'normal jazzradio-menu-mode-map (kbd "RET") 'jazzradio--play)
  (evil-define-key 'normal jazzradio-menu-mode-map (kbd "s") 'jazzradio--stop)
  (evil-define-key 'normal jazzradio-menu-mode-map (kbd "SPC") 'jazzradio--toggle-pause)
  (evil-define-key 'normal jazzradio-menu-mode-map (kbd "-") 'jazzradio--volume-decrease)
  (evil-define-key 'normal jazzradio-menu-mode-map (kbd "+") 'jazzradio--volume-increase))
(add-hook 'jazzradio-menu-mode-hook
  '(lambda () (setq-local show-trailing-whitespace nil)))

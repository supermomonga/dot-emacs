
(el-get-bundle inf-ruby
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode))

(el-get-bundle purcell/ac-inf-ruby
  (with-eval-after-load 'auto-complete
    (add-to-list 'ac-modes 'inf-ruby-mode))
  (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable))

(el-get-bundle! inf-ruby-extension)

(defun my/inf-ruby-mode-hook ()
  (setq-local show-trailing-whitespace nil))

(add-hook 'inf-ruby-mode-hook 'my/inf-ruby-mode-hook)

(with-eval-after-load 'inf-ruby
  (evil-define-key 'insert inf-ruby-mode-map (kbd "TAB") 'auto-complete)
  (evil-define-key 'insert inf-ruby-mode-map (kbd "C-a") 'comint-bol)
  (evil-define-key 'insert inf-ruby-mode-map (kbd "C-n") 'comint-next-matching-input-from-input)
  (evil-define-key 'insert inf-ruby-mode-map (kbd "C-p") 'comint-previous-matching-input-from-input)
  (setq inf-ruby-default-implementation "pry")
  (setq inf-ruby-eval-binding "Pry.toplevel_binding")
  (add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on))


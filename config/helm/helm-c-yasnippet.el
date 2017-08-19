
(el-get-bundle helm-c-yasnippet)


(with-eval-after-load 'yasnippet
  (with-eval-after-load 'helm
    (define-key evil-normal-state-map (kbd "SPC y") 'helm-yas-complete)))


(el-get-bundle quickrun)

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC r") 'quickrun))

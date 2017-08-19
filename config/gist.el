
(el-get-bundle gist)

(with-eval-after-load 'gist
  (evil-define-key 'motion gist-list-mode-map (kbd "RET") 'gist-fetch-current))

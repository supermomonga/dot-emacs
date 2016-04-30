
(el-get-bundle robe
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  )

;; (defun my-ac-robe-setup ()
;;   (setq-default ac-sources '())
;;   (push 'ac-source-robe (default-value 'ac-sources)))

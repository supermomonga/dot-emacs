
(el-get-bundle typescript-mode
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

(el-get-bundle 'tide
  (add-hook 'typescript-mode-hook 'my/typescript-mode-hook))

(defun my/typescript-mode-hook ()
  (tide-setup)
  (flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode t))

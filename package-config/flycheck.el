
(el-get 'sync 'flycheck)
(el-get 'sync 'flycheck-pos-tip)

(bundle 'flycheck
	(add-hook 'go-mode-hook 'flycheck-mode))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function 'flycheck-pos-tip-error-messages)))


(el-get-bundle php-mode)

(add-hook 'php-mode-hook 'my/php-mode-hook)
(defun my/php-mode-hook ()
  "My PHP mode configuration."
  (setq indent-tabs-mode nil
        tab-width 2
        c-basic-offset 2))

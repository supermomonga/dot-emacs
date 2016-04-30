
(el-get-bundle tern)

(defun my-js2-mode-hook ()
  (tern-mode t))

(add-hook 'js2-mode-hook #'my-js2-mode-hook)


(eval-after-load 'tern
    '(progn
        (require 'tern-auto-complete)
        (tern-ac-setup)))

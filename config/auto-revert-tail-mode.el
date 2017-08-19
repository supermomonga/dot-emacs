
(require 'autorevert nil t)

(setq auto-revert-interval 0.5)

;; .logファイルでは自動で auto-revert-tail-mode にする
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

;; ファイル更新やバッファオープン時、自動でカーソルを末尾に移動する
(defun do-end-of-buffer()
  (when (and (boundp auto-revert-tail-mode) (auto-revert-active-p))
    (end-of-buffer)))
(add-hook 'after-revert-hook 'do-end-of-buffer)
(add-hook 'find-file-hook 'do-end-of-buffer)


(defun my-shell-mode-hook ()
  (buffer-face-set '(:family "wanpakuruika" :height 120)))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)


(el-get-bundle! elpa:smartparens)
;;(require 'smartparens nil t)
(smartparens-global-strict-mode t)

(with-eval-after-load 'smartparens
  (require 'smartparens-config))

(el-get-bundle expez/evil-smartparens
  (add-hook 'eshell-mode-hook #'smartparens-mode)
  ;;(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)
  ;;(add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  ;;(add-hook 'evil-smartparens-mode-hook #'turn-on-smartparens-strict-mode)
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  )

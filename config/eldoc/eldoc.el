
;;; Code:
(require 'eldoc)

(setq eldoc-idle-delay 0.3)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'slime-repl-mode-hook 'turn-on-eldoc-mode)
(add-hook 'enh-ruby-mode-hook 'turn-on-eldoc-mode)
(add-hook 'go-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

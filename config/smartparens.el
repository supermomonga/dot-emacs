
(el-get-bundle! elpa:smartparens)
;;(require 'smartparens nil t)
;; (smartparens-global-strict-mode t)

(with-eval-after-load 'smartparens
  (require 'smartparens-config))

(setq my-smartparens-mode-hooks
      '(eshell-mode-hook
        emacs-lisp-mode-hook
        lisp-interaction-mode-hook
        clojure-mode-hook
        js2-mode-hook
        enh-ruby-mode-hook))

(setq my-smartparens-strict-modes
      '(eshell-mode
        emacs-lisp-mode
        lisp-interaction-mode
        clojure-mode
        lisp-mode))

(setq my-evil-smartparens-modes
      '(eshell-mode
        emacs-lisp-mode
        lisp-interaction-mode
        clojure-mode
        lisp-mode))

(defun my-smartparens-enabled-hook ()
  (with-current-buffer (current-buffer)
      (when (find major-mode my-smartparens-strict-modes)
        (smartparens-strict-mode))
      (when (find major-mode my-evil-smartparens-modes)
        (evil-smartparens-mode))))

(el-get-bundle expez/evil-smartparens
  ;; smartparens
  (dolist (hook my-smartparens-mode-hooks)
    (add-hook hook #'smartparens-mode))
  (add-hook 'smartparens-enabled-hook #'my-smartparens-enabled-hook)
  ;;(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)
  ;;(add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  ;;(add-hook 'evil-smartparens-mode-hook #'turn-on-smartparens-strict-mode)
  )


(evil-define-key 'normal evil-smartparens-mode-map (kbd "SPC (") 'my-wrap-next-thing-with-paren)
(evil-define-key 'normal evil-smartparens-mode-map (kbd "SPC w") 'my-wrap-next-thing-with-paren)
(evil-define-key 'normal evil-smartparens-mode-map (kbd "SPC )") 'sp-unwrap-sexp)
(evil-define-key 'normal evil-smartparens-mode-map (kbd "SPC u") 'sp-unwrap-sexp)
(evil-define-key 'visual evil-smartparens-mode-map (kbd "(") 'my-wrap-with-paren)

(defun my-wrap-next-thing-with-paren (&optional arg)
  (interactive "p")
  (sp-select-next-thing-exchange arg)
  (execute-kbd-macro (kbd "S )"))
  (evil-append 1)
  (execute-kbd-macro (kbd "SPC"))
  (evil-normal-state))

(defun my-wrap-with-paren (&optional arg)
  (interactive "p")
  (execute-kbd-macro (kbd "S )"))
  (evil-append 1)
  (execute-kbd-macro (kbd "SPC"))
  (evil-normal-state))

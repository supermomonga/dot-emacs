
(el-get-bundle elpa:cider)
(el-get-bundle elpa:ac-cider)

(evil-define-key 'normal cider-mode-map (kbd "SPC d") 'ac-cider-popup-doc)

(evil-define-key 'normal cider-repl-mode-map (kbd "C-p") 'cider-repl-previous-prompt)
(evil-define-key 'normal cider-repl-mode-map (kbd "C-n") 'cider-repl-next-prompt)
(evil-define-key 'insert cider-repl-mode-map (kbd "C-p") 'cider-repl-previous-input)
(evil-define-key 'insert cider-repl-mode-map (kbd "C-n") 'cider-repl-next-input)
(evil-define-key 'insert cider-repl-mode-map (kbd "C-a") 'comint-bol)
(evil-define-key 'normal cider-repl-mode-map (kbd "SPC d") 'ac-cider-popup-doc)

(setq cider-test-show-report-on-success t)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (setq-local show-trailing-whitespace nil)))

(with-eval-after-load 'cider
  (defun cider-repl-default-prompt (namespace)
    "Return a prompt string that mentions NAMESPACE."
    (format "%s ❯ " namespace)))

(autoload 'ac-cider "ac-cider" nil t)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(with-eval-after-load "auto-complete"
  (add-to-list 'ac-modes 'cider-mode)
  (add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

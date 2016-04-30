

;; dependency
(el-get-bundle NicolasPetton/seq.el)

(el-get-bundle flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode))


(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint
                          json-jsonlist
                          emacs-lisp-checkdoc))))

(setq flycheck-idle-change-delay 2)

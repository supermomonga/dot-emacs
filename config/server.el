

(defun switch-server-recipe (recipe)
  ;; TODO
  )

(defun server-eval-last-sexp ()
  (interactive)
  (save-excursion
    (message "%s" (server-eval-at "emacs_server" (preceding-sexp)))))

(evil-define-key 'normal emacs-lisp-mode-map (kbd "SPC e") 'server-eval-last-sexp)

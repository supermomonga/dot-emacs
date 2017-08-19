

(defun my-org-table-auto-align ()
  (interactive)
  (when (org-at-table-p)
      (org-table-align)))

(with-eval-after-load 'evil
  (defun my-org-mode-hook ()
    (add-hook 'evil-insert-state-exit-hook 'my-org-table-auto-align nil t))
  (add-hook 'org-mode-hook 'my-org-mode-hook))


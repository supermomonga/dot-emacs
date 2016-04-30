


(with-eval-after-load 'org-mode
  (setq org-agenda-files (list org-directory)))

  (defun my-org-ageda-mode-hook ()
    (hl-line-mode 1)
    (setq-local hl-line-face 'underline))

  (add-hook 'org-agenda-mode-hook 'my-org-ageda-mode-hook)

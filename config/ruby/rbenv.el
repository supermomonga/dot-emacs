
(el-get-bundle rbenv
  (defvar rbenv-installation-dir (file-truename "~/.rbenv")))

(with-eval-after-load 'rbenv
  (setq rbenv-modeline-function 'rbenv--modeline-plain))

(defun my/rbenv-use-corresponding-or-global ()
  "search for .ruby-version and activate the corresponding ruby, or just use global ruby."
  (interactive)
  (let ((version-file-path (or (rbenv--locate-file ".ruby-version")
                               (rbenv--locate-file ".rbenv-version"))))
    (if version-file-path (rbenv-use (rbenv--read-version-from-file version-file-path))
      (rbenv-use-global))))

(defun my/enh-ruby-mode-hook ()
  (global-rbenv-mode)
  (my/rbenv-use-corresponding-or-global))

(add-hook 'enh-ruby-mode-hook
          'my/enh-ruby-mode-hook)

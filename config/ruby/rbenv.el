
(el-get-bundle rbenv
  (defvar rbenv-installation-dir (file-truename "~/.rbenv")))

(with-eval-after-load 'rbenv
  (setq rbenv-modeline-function 'rbenv--modeline-plain))

(defun my/enh-ruby-mode-hook ()
  (global-rbenv-mode)
  (rbenv-use-corresponding))

(add-hook 'enh-ruby-mode-hook
          'my/enh-ruby-mode-hook)

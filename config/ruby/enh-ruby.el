
(setq enh-ruby-add-encoding-comment-on-save nil)
(el-get-bundle Enhanced-Ruby-Mode
  (defvar enh-ruby-deep-indent-paren nil)
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("config.ru$" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))


(defun rspec-at-point ()
  (interactive)
  (let* ((cmd "git rev-parse --show-toplevel")
         (topdir (with-temp-buffer
                   (call-process-shell-command cmd nil t nil)
                   (goto-char (point-min))
                   (if (re-search-forward "^\\(.+\\)$" nil t)
                       (match-string 1))))
         (line (line-number-at-pos)))
    (quickrun :source `((:command . "bundle exec rspec")
                        (:default-directory . ,topdir)
                        (:exec . ,(concat
                                   "%c -fd %s:"
                                   (number-to-string line)))))))

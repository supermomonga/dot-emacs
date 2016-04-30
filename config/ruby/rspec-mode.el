
;; Code
(el-get-bundle rspec-mode
  (add-hook 'enh-ruby-mode-hook 'rspec-mode))

(setq rspec-use-rake-flag t)
(setq rspec-rake-command "foreman run rake")

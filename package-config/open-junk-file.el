
(el-get 'sync 'open-junk-file)

(define-key evil-normal-state-map (kbd "SPC j") 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk-files/%Y-%m/%Y-%m-%d-%H%M%S.")
(setq open-junk-file-find-file-function 'find-file)

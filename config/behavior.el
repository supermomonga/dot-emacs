
;; Emacsclient
(bundle 'server
        (unless (server-running-p)
          (server-start)))

;; Highlight current line
(global-hl-line-mode 1)

;; Disable startup message
(setq inhibit-startup-message t)

;; Open file when drag and frop files from another applications
(define-key global-map [ns-drag-file] 'ns-find-file)

;; Symply use y/n to select yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Don't create backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)



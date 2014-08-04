
;; Save cursor position
(bundle 'saveplace
	    (setq-default save-place t))

;; Automatically insert newline
(setq require-final-newline t)

;; Tab width
(setq-default tab-width 2)
(setq default-tab-width 2)
(setq tab-stop-list '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; enable eldoc
(when (require 'eldoc nil t)
	(eldoc-mode t)
	(setq eldoc-idle-delay 0.2)
	(setq eldoc-echo-area-use-multiline-p t))


;; Recentf file
(setq recentf-max-saved-items 100000)
(setq history-length 100000)


;; auto insert
(require 'autoinsert nil t)
(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/templates/")

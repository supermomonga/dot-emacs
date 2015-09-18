;;; Enable emacs server to use emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;;; Diable using tabs as indent
(setq-default indent-tabs-mode nil)


;; History

;; Command history
(setq history-length 100000)
(setq savehist-file (locate-user-emacs-file "cache/savehist/history"))
(savehist-mode t)
(unless (find 'extended-command-history savehist-minibuffer-history-variables)
  (add-to-list 'savehist-minibuffer-history-variables 'extended-command-history))

;; Recent file history
(setq recentf-max-saved-items 100000)
(setq recentf-save-file (locate-user-emacs-file "cache/recentf/recentf"))
(recentf-mode t)

;; Save cursor place for each files
(setq save-place-file (locate-user-emacs-file "cache/place/places"))
(require 'saveplace)

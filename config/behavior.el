;;; Enable emacs server to use emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;;; Diable using tabs as indent
(setq-default indent-tabs-mode nil)


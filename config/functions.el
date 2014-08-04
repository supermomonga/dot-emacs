
;; load config file
(defun load-config (name)
  (load-file (concat "~/.emacs.d/config/" name ".el")))

;; load package's config file
(defun load-package-config (name)
  (load-file (concat "~/.emacs.d/package-config/" name ".el")))

;; PATH
(defun append-path (path)
  (setenv "PATH" (concat (file-truename path)":" (getenv "PATH")))
  (setq eshell-path-env (getenv "PATH"))
  (setq exec-path (split-string (getenv "PATH") ":"))
  (print exec-path))

;;; Notification center
(defun notif (title message)
  (shell-command
   (concat
    "echo 'display notification \"'"
    message
    "'\" with title \""
    title
    "\"' | osascript"))
  )



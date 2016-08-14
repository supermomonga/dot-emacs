
;;------------------------------------------------------------------------------
;; Benri functions
;;------------------------------------------------------------------------------

(defun append-path (path)
  (setenv "PATH" (concat (file-truename path) ":" (getenv "PATH")))
  (apply-path))

(defun prepend-path (path)
  (setenv "PATH" (concat (getenv "PATH") ":" (file-truename path)))
  (apply-path))

(defun apply-path ()
  ;;; eshell
  (setq eshell-path-env (getenv "PATH"))
  ;;; exec path
  (setq exec-path (split-string (getenv "PATH") ":")))

;;------------------------------------------------------------------------------
;; PATHs
;;------------------------------------------------------------------------------

;; .NET
(append-path "/usr/local/share/dotnet/")

;; rbenv
(append-path "~/.rbenv/bin/")
(append-path "~/.rbenv/shims/")

;; User installed packages
(append-path "/usr/local/bin")

;;------------------------------------------------------------------------------
;; Other environment variables
;;------------------------------------------------------------------------------

;; Enable emacsclient to use itself via eshell
(setenv "GIT_EDITOR" "emacsclient")
(setenv "EDITOR" "emacsclient")

;; LANG
(setenv "LANG" "ja_JP.UTF-8")

;; Pager
(setenv "PAGER" "")

;; Term
(setenv "TERM" "xterm-256color")


;;------------------------------------------------------------------------------
;; File encoding system
;;------------------------------------------------------------------------------

(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

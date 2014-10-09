; Kanari sugoi init.el (kanari)


; ==============================================================================
; Use common lisp features
; ==============================================================================
(require 'cl)


; ==============================================================================
; Load user-defined macro and function
; ==============================================================================
(load-file "~/.emacs.d/config/macros.el")
(load-file "~/.emacs.d/config/functions.el")


; ==============================================================================
; Add some pathes
; ==============================================================================
(append-path "~/.rbenv/bin/")
(append-path "~/.rbenv/shims/")
(append-path "/usr/local/bin")

;; TODO: move to golang config file
;; golang
(setenv "GOPATH" (file-truename "~/.go"))
(append-path (concat (getenv "GOPATH") "/bin"))
(append-path "/usr/local/Cellar/go/1.3rc1/bin")


; ==============================================================================
; Load config files
; ==============================================================================

;; Load secret settings.
(load "~/.emacs.d/secret.el" nil t)
;; Config
(load-config "behavior")
(load-config "appearance")
(load-config "language")
(load-config "edit")
(load-config "font")
;; Config plugins
(load-package-config "el-get")
(load-package-config "evil")
(load-package-config "yasnippet")
(load-package-config "helm")
(load-package-config "auto-complete")
(load-package-config "smartrep") ;; Repeat keybind easily
(load-package-config "tabbar")
(load-package-config "theme")
(load-package-config "eshell")
(load-package-config "quickrun")
(load-package-config "direx")
(load-package-config "flycheck")
(load-package-config "auto-async-byte-compile")
(load-package-config "e2wm")
(load-package-config "powerline")
(load-package-config "open-junk-file")
;; (load-package-config "") ;; TODO
(load-package-config "popwin") ;; Handle temporally
;;; Ruby
(load-package-config "ruby")
;;; Emacs lisp
(load-package-config "elisp")
;;; golang
(load-package-config "golang")
;;; Coffee Script
(load-package-config "coffee_script")
;; Applications
(load-package-config "mailer")
(load-package-config "lingr")
(load-package-config "twitter")


; ==============================================================================
; Misc
; ==============================================================================

;; Change directory to user home
(cd "~/")


; ==============================================================================
; Startup behavior
; ==============================================================================



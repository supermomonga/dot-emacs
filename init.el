
;;------------------------------------------------------------------------------
;; Enable Common Lisp features
;;------------------------------------------------------------------------------
(require 'cl-lib)

;;------------------------------------------------------------------------------
;; Setup package manager
;;------------------------------------------------------------------------------
(add-to-list 'load-path
             (locate-user-emacs-file "el-get/el-get"))

;; Install el-get if not installed
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Only use MELPA to avoid breaking dependency tree
(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")))

;; User defined recipe
(add-to-list 'el-get-recipe-path
             (locate-user-emacs-file "el-get-user-recipes"))

;;------------------------------------------------------------------------------
;; Muanual init Loader
;;------------------------------------------------------------------------------
;; Avoid compile error
(el-get-bundle tarao/with-eval-after-load-feature-el)

;; init-loader
(el-get-bundle! kenoss/manual-init-loader
  (setq milo-raise-error nil))
(milo-load user-emacs-directory
           '(config "appearance.el"
                    "behavior.el"
                    "theme.el"
                    "evil.el"
                    "helm.el"
                    "auto-complete.el"
                    "eshell.el"
                    "tabbar.el"
                    "smartrep.el"
                    "misc.el"))



;;------------------------------------------------------------------------------
;; Language environment
;;------------------------------------------------------------------------------
(set-language-environment "Japanese")


;;------------------------------------------------------------------------------
;; Enable Common Lisp features
;;------------------------------------------------------------------------------
(require 'cl-lib)
(require 'color)

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
  (setq milo-raise-error t))
(milo-load user-emacs-directory
           '(config "font.el"
                    "appearance.el"
                    "behavior.el"
                    "environment.el"
                    "libraries.el"
                    "theme.el"
                    "undo-tree.el"
                    "evil.el"
                    "helm.el"
                    "auto-complete.el"
                    "eshell.el"
                    "tabbar.el"
                    "smartrep.el"
                    "haml.el"
                    "slim.el"
                    (ruby "enh-ruby.el"
                          "rbenv.el"
                          "inf-ruby.el"
                          "robe.el")
                    (lisp "rainbow-delimiters.el")
                    (clojure "clojure.el"
                             "cider.el")
                    "markdown.el"
                    "quickrun.el"
                    "smartparens.el"
                    "open-junk-file.el"
                    "persistent-scratch.el"
                    "server.el"
                    "epub.el"
                    "popwin.el"
                    "jazzradio.el"
                    "misc.el"))


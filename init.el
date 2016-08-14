;;------------------------------------------------------------------------------
;; Language environment
;;------------------------------------------------------------------------------
;; (set-language-environment "Japanese")
(prefer-coding-system 'utf-8)


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

;; Use Package
(el-get-bundle! use-package)

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
                    "diff.el"
                    "tramp.el"
                    (evil
                     "evil.el"
                     "nerd-commenter.el")
                    (util
                     "repository-root.el")
                    (helm
                     "helm.el"
                     "helm-c-yasnippet.el"
                     "fontawesome.el")
                    (yasnippet
                     "yasnippet.el")
                    "auto-complete.el"
                    "eshell.el"
                    "tabbar.el"
                    "smartrep.el"
                    "haml.el"
                    "slim.el"
                    "direx.el"
                    (ruby
                     "enh-ruby.el"
                     "rbenv.el"
                     "inf-ruby.el"
                     "robe.el"
                     "rspec-mode.el")
                    (elisp
                     "lispxmp.el"
                     "misc.el")
                    (lisp
                     "rainbow-delimiters.el")
                    (clojure
                     "clojure.el"
                     "cider.el")
                    (coffee
                     "coffee.el")
                    (javascript
                     "javascript.el"
                     "js2-mode.el"
                     "tern-mode.el")
                    (common-lisp
                     "common-lisp.el"
                     "slime.el"
                     "slime-annot.el")
                    (golang
                     "go.el")
                    (scss
                     "scss.el")
                    (docker
                     "dockerfile.el")
                    (csharp
                     "csharp.el"
                     "omnisharp-roslyn.el")
                    "markdown.el"
                    "yaml.el"
                    "toml.el"
                    "quickrun.el"
                    "smartparens.el"
                    "open-junk-file.el"
                    "persistent-scratch.el"
                    "server.el"
                    "epub.el"
                    "popwin.el"
                    "jazzradio.el"
                    "gist.el"
                    ;; "magit.el"
                    (php
                     "php.el"
                     "web-mode.el")
                    (e2wm
                     "e2wm.el")
                    (flycheck
                     "flycheck.el")
                    (eldoc
                     "eldoc.el")
                    (org
                     "agenda.el"
                     "ioslide.el"
                     "gfm.el")
                    (csv
                     "csv.el")
                    (irc
                     "weechat.el")
                    "misc.el"))


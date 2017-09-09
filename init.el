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
                    "document.el"
                    "libraries.el"
                    "emoji.el"
                    "theme.el"
                    "undo-tree.el"
                    "diff.el"
                    "tramp.el"
                    (evil
                     "evil.el"
                     "nerd-commenter.el")
                    (projectile
                     "projectile.el"
                     "projectile-rails.el")
                    (util
                     "pcre2el.el"
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
                    (vue
                     "vue-mode.el")
                    (javascript
                     "javascript.el"
                     "js2-mode.el"
                     "tern-mode.el")
                    (typescript
                     "typescript.el")
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
                    "auto-revert-tail-mode.el"
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
                     "org.el"
                     "agenda.el"
                     "ioslide.el"
                     "gfm.el")
                    (csv
                     "csv.el")
                    (irc
                     "weechat.el")
                    "term-run.el"
                    (test
                     "test.el")
                    "misc.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("2cf7f9d1d8e4d735ba53facdc3c6f3271086b6906c4165b12e4fd8e3865469a6" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(fci-rule-color "#f8fce8" t)
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")) t)
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")) t)
 '(package-selected-packages
   (quote
    (term-run srefactor plan9-theme load-theme-buffer-local inflections ssass-mode vue-mode vue-html-mode oauth2 csv-mode persistent-scratch queue robe osx-plist)))
 '(sml/active-background-color "#98ece8" t)
 '(sml/active-foreground-color "#424242" t)
 '(sml/inactive-background-color "#4fa8a8" t)
 '(sml/inactive-foreground-color "#424242" t)
 '(tabbar-background-color "#323232")
 '(tabbar-cycle-scope (quote tabs))
 '(vue-modes
   (quote
    ((:type template :name html :mode vue-html-mode)
     (:type script :name js :mode js-mode)
     (:type style :name css :mode css-mode)
     (:type style :name scss :mode scss-mode))) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "#CC7833" :weight normal))))
 '(tabbar-button ((t (:background "#424242" :underline nil :foreground "#999"))))
 '(tabbar-button-highlight ((t (:background "#424242" :underline nil :foreground "#999"))))
 '(tabbar-default ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9))))
 '(tabbar-modified ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9))))
 '(tabbar-selected ((t (:background "#424242" :underline nil :foreground "#fff" :height 0.9))))
 '(tabbar-separator ((t (:background "#424242" :underline nil :height 1.0))))
 '(tabbar-unselected ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9)))))


(package-initialize)

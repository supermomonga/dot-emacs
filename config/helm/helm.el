
(el-get-bundle elpa:helm
  (define-key evil-normal-state-map (kbd "SPC y") 'helm-yas-complete)
  (define-key evil-normal-state-map (kbd "SPC f") 'helm-mini)
  (define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)
  (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC s") 'helm-swoop)
  (define-key evil-normal-state-map (kbd "SPC g") 'helm-ag))

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(el-get-bundle elpa:helm-ag)
(el-get-bundle elpa:helm-descbinds)
(el-get-bundle elpa:helm-swoop)

(with-eval-after-load 'helm
  (setq helm-mode-fuzzy-match nil
        helm-completion-in-region-fuzzy-match nil
        helm-M-x-fuzzy-match nil
        helm-recentf-fuzzy-match nil
        helm-buffers-fuzzy-matching nil))

;; This elisp uses the obsoleted function `nrepl-send-string-sync`
;; https://github.com/clojure-emacs/cider/blob/master/CHANGELOG.md#changes-2
(el-get-bundle prepor/helm-clojure)
(with-eval-after-load 'helm-clojure
  (setq helm-source-clojure
        `((name . "Clojure")
          (init . helm-clojure-inject)
          (candidates . helm-clojure-candidates)
          (action . (("Show doc" . helm-clojure-doc)
                     ("Go to definition" . helm-clojure-jump)
                     ("Insert" . helm-clojure-insert)))
          (requires-pattern . 1)
          (persistent-action . helm-clojure-persistent)
          (persistent-help . ,helm-clojure-persistent-help1)
          (volatile . t)
          (keymap . ,helm-clojure-map))))

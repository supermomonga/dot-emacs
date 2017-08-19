
(el-get-bundle! tabbar)
(tabbar-mode 1)
(tabbar-mwheel-mode -1)
(setq tabbar-buffer-groups-function nil)

(setq my-tabbar-show-buffer-names
      '("*trace-output*" "*Faces*" "*vc-" "*eshell*" "*Lingr Status*" "*scratch*" "*cider-scratch*" "*cider-repl " "*rails*" "*pry*" "*Slack" "*github" "*Async Shell Command*"))

(setq my-tabbar-hide-buffer-names
      '("*" "Omni-Server" "Lingr[" "org-src-fontification:"))

(setq my-tabbar-show-buffer-modes
      '(slack-mode))

(setq my-tabbar-hide-buffer-modes
      '(direx:direx-mode))

(dolist (btn '(tabbar-buffer-home-button tabbar-scroll-left-button tabbar-scroll-right-button))
  (set btn (cons (cons "" nil) (cons "" nil))))
;; (setq tabbar-auto-scroll-flag nil)
(setq tabbar-separator '(1.0))
  ;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-background-color "#323232")
 '(tabbar-cycle-scope (quote tabs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-button-highlight ((t (:background "#424242" :underline nil :foreground "#999"))))
 '(tabbar-default          ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9))))
 '(tabbar-unselected       ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9))))
 '(tabbar-selected         ((t (:background "#424242" :underline nil :foreground "#fff" :height 0.9))))
 '(tabbar-button           ((t (:background "#424242" :underline nil :foreground "#999"))))
 '(tabbar-modified         ((t (:background "#424242" :underline nil :foreground "#999" :height 0.9))))
 '(tabbar-separator        ((t (:background "#424242" :underline nil :height 1.0)))))
  ;;;
;; (set-face-attribute 'tabbar-default    nil :background "#323232" :foreground "#999999" :family "September" :height 0.9 :box nil)
;; (set-face-attribute 'tabbar-default    nil :background "#323232" :foreground "#999999" :height 0.9 :box nil)
;; (set-face-attribute 'tabbar-unselected nil :background "#424242" :foreground "#999999" :box nil)
;; (set-face-attribute 'tabbar-selected   nil :background "#424242" :foreground "#ffffff" :box nil)
;; (set-face-attribute 'tabbar-button nil :box nil)
;; (set-face-attribute 'tabbar-separator nil :height 1.0 :background "#424242")

(defun my-tabbar-visible-buffer-name? (show-names hide-names buf)
  (let ((name (buffer-name buf)))
    (or (string-match show-names name)
        (not (string-match hide-names name)))))

(defun my-tabbar-visible-buffer-mode? (show-modes hide-modes buf)
  (let ((buf-mode (with-current-buffer buf major-mode)))
    (or (cl-find buf-mode show-modes)
        (not (cl-find buf-mode hide-modes)))))

(defun my-tabbar-visible-buffer? (buf)
  (when (and
         (my-tabbar-visible-buffer-name? show-names hide-names buf)
         (my-tabbar-visible-buffer-mode? my-tabbar-show-buffer-modes my-tabbar-hide-buffer-modes buf)) buf))

(defun my-tabbar-buffer-list ()
  (let* ((hide-names (regexp-opt my-tabbar-hide-buffer-names))
         (show-names (regexp-opt my-tabbar-show-buffer-names))
         (cur-buf (current-buffer))
         (tabs (delq
                nil
                (mapcar 'my-tabbar-visible-buffer?
                        (buffer-list)))))
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


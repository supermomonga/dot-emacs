


(el-get-bundle direx)

;; (make-face 'direx-face)
;; (set-face-font 'direx-face "fontset-wanpakuruikamini")

(defun my-direx-mode-hook ()
  (emojify-mode t)
  (when (tabbar-mode-on-p)
    (tabbar-local-mode nil)))

(add-hook 'direx:direx-mode-hook 'my-direx-mode-hook)

;; TODO: Make it works
(add-to-list 'completion-ignored-extensions ".DS_Store")
(setq direx:ignored-files-regexp (concat "\\(?:" (regexp-opt completion-ignored-extensions) "\\|#\\)$"))


(setq direx:leaf-icon   ":1: "
      direx:open-icon   ":2: "
      direx:closed-icon ":3: ")

(defun direx:item-icon-part-offset (item)
  (* (direx:item-depth item) 2))

;; TODO: use icon determined by item extension
(defun direx:item-render-icon-part (item)
  (if (direx:item-leaf-p item)
      direx:leaf-icon
    direx:closed-icon))


(evil-define-key 'normal direx:direx-mode-map (kbd "D") 'direx:do-delete-files)
(evil-define-key 'normal direx:direx-mode-map (kbd "r") 'direx:do-rename-file)
(evil-define-key 'normal direx:direx-mode-map (kbd "j") 'direx:next-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "k") 'direx:previous-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-j") 'direx:next-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-k") 'direx:previous-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "SPC") 'direx:toggle-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "RET") 'direx:find-item)

(setq find-directory-functions '(direx:find-directory-other-window cvs-dired-noselect dired-noselect))


(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun git-project-p ()
  (string=
   (chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree")) "true"))

(defun git-root-directory ()
  (cond ((git-project-p)
         (chomp
          (shell-command-to-string "git rev-parse --show-toplevel")))
        (t "")))

(defun direx:jump-to-git-project-directory-other-window ()
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window))))

;; (define-key evil-normal-state-map (kbd "SPC e") 'direx:jump-to-directory-other-window)
(define-key evil-normal-state-map (kbd "SPC e") 'direx:jump-to-git-project-directory-other-window)

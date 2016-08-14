


(el-get-bundle direx)




(evil-define-key 'normal direx:direx-mode-map (kbd "D") 'direx:do-delete-files)
(evil-define-key 'normal direx:direx-mode-map (kbd "r") 'direx:do-rename-file)
(evil-define-key 'normal direx:direx-mode-map (kbd "j") 'direx:next-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "k") 'direx:previous-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-j") 'direx:next-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "C-k") 'direx:previous-sibling-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "SPC") 'direx:toggle-item)
(evil-define-key 'normal direx:direx-mode-map (kbd "RET") 'direx:find-item)


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

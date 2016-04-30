
;;; Code:
(el-get-bundle org-ioslide)

(el-get-bundle makey)

(with-eval-after-load 'org-mode
  (require 'ox-ioslide)
  (require 'ox-ioslide-helper))

(with-eval-after-load 'ox-ioslide-helper
  (add-to-list 'evil-emacs-state-modes 'makey-key-mode))




;; package manager config for el-get.
;; Note that el-get depends on package.el.
(require 'package)

;;; Add MELPA repository
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Update load-path to load plugins which managed by el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Install el-get if it's not installed.
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

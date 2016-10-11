;;------------------------------------------------------------------------------
;; Japanese Info
;;------------------------------------------------------------------------------

(require 'info)
(add-to-list 'Info-directory-list (expand-file-name (locate-user-emacs-file "info/")))
(defun Info-find-node--info-ja (orig-fn filename &rest args)
  (apply orig-fn
         (pcase filename
           ("emacs" "emacs245-ja")
           (t filename))
         args))
(advice-add 'Info-find-node :around 'Info-find-node--info-ja)

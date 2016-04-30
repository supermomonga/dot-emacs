
;;; Code:


(defun my-beautify-javascript (begin end)
  "beautify the code in the region"
  (interactive "r")
  (if (executable-find "js-beautify")
      (call-process-region begin end "js-beautify" t t)
    (message "Can't find js-beautify")))

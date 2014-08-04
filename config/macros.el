
;; bundle macro
(defmacro bundle (name &rest body)
  `(when (require ,name nil t) ,@body))



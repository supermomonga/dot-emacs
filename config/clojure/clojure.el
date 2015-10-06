
(el-get-bundle elpa:clojure-mode)

(add-hook 'clojure-mode-hook
          (lambda()
            (define-clojure-indent
              (defroutes 'defun)
              (GET 2)
              (POST 2)
              (PUT 2)
              (DELETE 2)
              (HEAD 2)
              (ANY 2)
              (context 2))))

(add-hook 'clojure-mode-hook 'cider-mode)


(with-eval-after-load 'clojure-mode
  ;; Indent for midge
  (put-clojure-indent 'facts 1)
  (put-clojure-indent 'fact 1))

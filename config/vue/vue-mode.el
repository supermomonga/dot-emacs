
(el-get-bundle elpa:vue-html-mode)
(el-get-bundle elpa:ssass-mode)
(el-get-bundle mmm-mode)

(custom-set-variables '(vue-modes
                        '((:type template :name html :mode vue-html-mode)
                          (:type script :name js :mode js-mode)
                          (:type style :name css :mode css-mode)
                          (:type style :name scss :mode scss-mode))))

(el-get-bundle CodeFalling/vue-mode
  :depends (vue-html-mode mmm-mode ssass-mode))

(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(setq mmm-submode-decoration-level 2)


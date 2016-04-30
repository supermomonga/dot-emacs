
(el-get-bundle js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override t)

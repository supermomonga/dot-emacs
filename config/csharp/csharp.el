
(el-get-bundle csharp-mode)


(defun my-csharp-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0))

(add-to-list 'auto-mode-alist '("\\.cake$" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.csx$" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.csproj$" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.sln$" . xml-mode))

(add-hook 'csharp-mode-hook #'my-csharp-mode-hook)
;; (add-hook 'csharp-mode-hook #'turn-on-eldoc-mode)

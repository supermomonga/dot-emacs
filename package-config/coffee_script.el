
(el-get 'sync 'coffee-mode)
(el-get 'sync 'sourcemap)


;; This gives you a tab of 2 spaces
(custom-set-variables
 '(coffee-tab-width 2)
 '(coffee-args-compile '("-c" "-m")))

;; generating sourcemap
(add-hook 'coffee-after-compile-hook 'sourcemap-goto-corresponding-point)

(eval-after-load "coffee-mode"
	'(progn
		 (evil-define-key 'normal coffee-mode-map (kbd "SPC r") 'coffee-compile-buffer)))

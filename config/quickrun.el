
(el-get-bundle quickrun)

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "SPC r") 'quickrun))

(with-eval-after-load 'quickrun
  (quickrun-add-command "dotnet"
                        '((:command . "dotnet /Users/momonga/RiderProjects/QuickSharp/QuickSharp/bin/Release/netcoreapp1.0/dotnet-quicksharp.dll")
                          (:exec . ("%c -f %s"))))
  (add-to-list 'quickrun-file-alist '("\\.cs$" . "dotnet")))


(defun my/quickrun-mode-hook ()
  (setq-local show-trailing-whitespace nil))

(add-hook 'quickrun/mode-hook 'my/quickrun-mode-hook)

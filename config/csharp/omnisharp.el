
(el-get-bundle omnisharp-mode)

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'omnisharp-mode-hook 'my-ac-omnisharp-setup)
(setq omnisharp-server-executable-path (expand-file-name "~/bin/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe"))






(defun my-ac-omnisharp-setup ()
  (push 'ac-source-omnisharp-methods ac-sources)
  (push 'ac-source-omnisharp-properties ac-sources))

(defun my-omnisharp--simplify-name (propertized)
  (nth 1 (split-string propertized "[ ()]")))

(defun my-omnisharp--is-method-name (name)
  (string-match "(.*)" name))

(defun my-omnisharp--ac-method-candidates ()
  (let ((xs (remove-if-not
             'my-omnisharp--is-method-name
             (omnisharp--get-auto-complete-result-in-popup-format))))
    (mapcar 'my-omnisharp--simplify-name xs)))

(defun my-omnisharp--ac-property-candidates ()
  (let ((xs (remove-if
             'my-omnisharp--is-method-name
             (omnisharp--get-auto-complete-result-in-popup-format))))
    (mapcar 'my-omnisharp--simplify-name xs)))

(defvar ac-source-omnisharp-methods
  '((candidates . my-omnisharp--ac-method-candidates)
    (symbol . "f")))
(defun ac-complete-omnisharp-methods ()
  (interactive)
  (auto-complete '(ac-source-omnisharp-methods)))

(defvar ac-source-omnisharp-properties
  '((candidates . my-omnisharp--ac-property-candidates)
    (symbol . "v")))
(defun ac-complete-omnisharp-properties ()
  (interactive)
  (auto-complete '(ac-source-omnisharp-properties)))

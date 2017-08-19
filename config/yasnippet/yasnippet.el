
(el-get-bundle! yasnippet
  ;; (setq yas-snippet-dirs)
  ;; yas-installed-snippets-dir
  (yas-global-mode 1))

; for some snippets
(el-get-bundle inflections)

(defun plural-table-name ()
  (save-excursion
    (let*
        ((file-path (buffer-file-name))
         (file-name (file-name-nondirectory file-path))
         (file-name-non-ext (file-name-sans-extension file-name))
         (controller-re (rxt-pcre-to-elisp "_controller\.rb$"))
         (model-re (rxt-pcre-to-elisp "models\/.+\.rb$"))
         (view-re (rxt-pcre-to-elisp "views.*\/[a-z_^.]+\..+$")))
      (cond
       ((s-matches? controller-re file-path)
        (s-replace "_controller" "" file-name-non-ext))
       ((s-matches? model-re file-path)
        (inflection-pluralize-string file-name-non-re))))))

(defun singular-table-name ()
  (save-excursion (inflection-singularize-string (plural-table-name))))

(defun model-class-name ()
  (save-excursion (s-upper-camel-case (singular-table-name))))


(with-eval-after-load 'yasnippet)

;; Use popup.el to choose value
(defun yas-popup-prompt (_prompt choices &optional display-fn)
  (when (fboundp 'popup-menu*)
    (let* ((formatted-choices
            (if display-fn (mapcar display-fn choices) choices))
           (choice (popup-menu* formatted-choices)))
      (if choice
          choice
        (keyboard-quit)))))

(setq yas-prompt-functions '(yas-popup-prompt
                             yas-dropdown-prompt
                             yas-completing-prompt
                             yas-maybe-ido-prompt
                             yas-no-prompt))


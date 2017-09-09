;; document-at-point


(defun mou-get-symbol-document (symbol)
  (cond ((fboundp symbol)
         (function-documentation symbol))
        ((boundp symbol)
         (variable-documentation symbol))))

(functionp (lambda ()))

(setq mou-smart-menu-menus
      `((enh-ruby-mode
         . (
            ,(popup-make-item "Find Model" :value #'projectile-rails-find-model)
            ,(popup-make-item "Find Controller" :value #'projectile-rails-find-controller)
            ,(popup-make-item "Find View" :value #'projectile-rails-find-view)
            ,(popup-make-item "Find Spec" :value #'projectile-rails-find-spec)
            ,(popup-make-item "Goto Gemfile" :value #'projectile-rails-goto-gemfile)
            ;; ,(popup-make-item "Execute rake db:migrate" :value  #'projectile-rails-rake)
            ,(popup-make-item "Execute rails generate" :value #'projectile-rails-generate)
            ))))

(setq mou-smart-menu-at-point-menus
      `((emacs-lisp-mode
         . (
            (popup-make-item "Show help" :value #'help-at-point :document
                             (lambda (_) (mou-get-symbol-document (intern (thing-at-point 'symbol)))))
            ,(popup-make-item "Go to definition" :value #'find-function-at-point)
            ))
        (enh-ruby-mode
         . (
            ,(popup-make-item "Go to Model" :value #'projectile-rails-find-current-model)
            ,(popup-make-item "Go to Controller" :value #'projectile-rails-find-current-controller)
            ,(popup-make-item "Go to View" :value #'projectile-rails-find-current-view)
            ,(popup-make-item "Go to Spec" :value #'projectile-rails-find-current-spec)
            ))))

(defun mou-smart-menu-menu-names ()
  `(,major-mode
    ,@minor-mode-list
    ))

(defun mou-smart-menu-get-menu (menu-name)
  ;; List all major-mode and minor-modes
  (loop for item in (cdr (assoc menu-name mou-smart-menu-menus))
        if (listp item) collect (eval item)
        else collect item
        ))


(defun mou-smart-menu ()
  (interactive)
  (let* ((menu-names (mou-smart-menu-menu-names))
         (menus (loop for name in menu-names
                      append (mou-smart-menu-get-menu name)))
         (func (popup-menu* menus :help-delay 0.1)))
    (if (functionp func)
        (funcall func))))

(defun mou-smart-menu-at-point ()
  (interactive)
  (let ((mou-smart-menu-menus mou-smart-menu-at-point-menus))
    (mou-smart-menu)))

(defun variable-documentation (symbol)
  (let* ((file-path (ac-symbol-file symbol 'defvar))
         (file-name (if (eq file-path 'C-source)
                        "C source code"
                      (file-name-nondirectory file-path)))
         (property-doc (or (documentation-property symbol 'variable-documentation t)
                           "Not documented.")))
    (concat "a variable defined in "
            file-name
            ".\n\n"
            property-doc)))

(defun function-documentation (symbol)
  (concat
   (format "%s is " symbol)
   (with-temp-buffer
     (let* ((standard-output (current-buffer)))
       (describe-function-1 symbol))
     (buffer-string))))

(defun document-at-point ()
  (interactive)
  (let* ((symbol (intern (thing-at-point 'symbol)))
         (document (cond ((fboundp symbol)
                          (function-documentation symbol))
                         ((boundp symbol)
                          (variable-documentation symbol)))))
    (popup-tip document)))

(defun help-at-point ()
  (interactive)
  (let* ((symbol (intern (thing-at-point 'symbol))))
    (cond ((fboundp symbol)
           (describe-function symbol))
          ((boundp symbol)
           (describe-variable symbol)))))

;;(setq ac-use-quick-help)

;;(file-name  (ac-symbol-file 'ac-use-quick-help 'defvar))
;;(fboundp 'describe-function)
;;(documentation-property 'ac-use-quick-help 'variable-documentation t)

;; (evil-define-key 'normal emacs-lisp-mode-map (kbd "SPC d") 'document-at-point)
(evil-define-key 'normal eshell-mode-map (kbd "SPC d") 'mou-smart-menu-at-point)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "SPC d") 'mou-smart-menu-at-point)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "SPC h") 'mou-smart-menu-at-point)
(evil-define-key 'normal lisp-interaction-mode-map (kbd "SPC d") 'mou-smart-menu-at-point)

;;(evil-define-key 'normal emacs-lisp-mode-map (kbd "SPC h") 'kef-show-help-emacs-lisp-symbol)
;;
;;(with-temp-buffer
;;  (describe-function 'describe-function))
;;
;;(defun kef-show-help-emacs-lisp-symbol (&optional pos) (interactive)
;;       (save-excursion
;;         (save-restriction
;;           (when pos (goto-char pos))
;;           (rlet1 symbol (intern (thing-at-point 'symbol))
;;                  (cond ((fboundp symbol)
;;                         (flet ((completing-read (&rest args) symbol))
;;                           (describe-function symbol)))
;;                        ((boundp symbol)
;;                         (flet ((completing-read (&rest args) symbol))
;;                           (describe-variable symbol)))
;;                        (t (message "Unknown symbol")))))))
;;
;;(defun document-at-point ()
;;  (if (equal (thing-at-) '
;;  (thing-at-point)
;;(with-temp-buffer
;;  (describe-function 'princ)))
;;(describe-function-1 "describe-function-1")

(defvar hexcolor-keywords
  '(("#[ABCDEFabcdef0-9]\\{3,6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))

(defun hexcolor-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolor-keywords))

(add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-add-to-font-lock)


;;------------------------------------------------------------------------------
;; Docset
;;------------------------------------------------------------------------------

(cl-defstruct docset/docset
  path
  identifier
  name
  index-file-path
  sqlite-file-path
  platform-family)

(setq docset/docset-dirs
      (list
        (f-expand "~/Library/Application Support/Dash/DocSets")
        ))

(defun docset/docset-properties (path)
  (osx-plist-parse-file (f-join path "Contents/Info.plist")))

(defun docset/docset-path-to-name (path)
  (f-base path))

(defun docset/list-docsets (docset-dirs)
  (let ((docset-paths
         (-uniq
          (-flatten
           (cl-mapcar
            (lambda (dir)
              (f-glob "**/*.docset" (f-expand dir)))
            docset-dirs)))))
    (cl-mapcar
     (lambda (path)
       (let* ((properties (docset/docset-properties path)))
         (make-docset/docset
          :path path
          :identifier (ht-get properties "CFBundleIdentifier")
          :name (ht-get properties "CFBundleName")
          :index-file-path (-when-let (index-file-path
                                       (ht-get properties "dashIndexFilePath"))
                             (f-join
                              path
                              "Contents/Documents/"
                              index-file-path))
          :sqlite-file-path (f-join
                             path
                             "Contents/Resources/docSet.dsidx")
          :platform-family (ht-get properties "DocSetPlatformFamily"))))
     docset-paths)))

(cl-defun docset/search-docsets (docsets &key identifier name platform-family)
  (-select
   (lambda (docset)
     (cl-letf ((identifier-matched?
                (if identifier
                    (equal identifier (docset/docset-identifier docset)) t))
               (name-matched?
                (if name
                    (equal name (docset/docset-name docset)) t))
               (platform-family-matched?
                (if platform-family
                    (equal platform-family (docset/docset-platform-family docset)) t)))
       (and identifier-matched?
            name-matched?
            platform-family-matched?)))
   docsets))

;; TODO: Dash version 3 will come.
(defun docset/doctype (docset)
  "This function returns the type of docset.
There are two types of docset, which named docset and zdocset."
  (let ((tables (esqlite-read-tables (docset/docset-sqlite-file-path docset))))
    (cond
     ((-contains? tables "searchIndex") :docset)
     ((-contains? tables "ZTOKEN") :zdocset)
     (t :unknown))))

;;(mapcar
;; (lambda (ds) (docset/docset-platform-family ds))
;; (docset/list-docsets docset/docset-dirs))
;;
;;(let ((rails (car (docset/search-docsets (docset/list-docsets docset/docset-dirs) :identifier "rails"))))
;;  (message "%s" (docset/doctype rails))
;;  )
;;
;;;; ZTOKEN table ZTOKENNAME
;;
;;(format "%s" (setq rails-ds
;;        (car
;;         (docset/list-docsets docset/docset-dirs))))




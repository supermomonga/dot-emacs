
(el-get-bundle popup)
(el-get-bundle! auto-complete
  (setq ac-comphist-file (locate-user-emacs-file "cache/auto-complete/ac-comphist.dat"))
  (with-eval-after-load-feature 'eshell
    (evil-define-key 'insert eshell-mode-map (kbd "C-i") 'auto-complete)
    (evil-define-key 'insert eshell-mode-map (kbd "<tab>") 'auto-complete)))

;; (popup-menu* '("aaa" "bbb" "ccc" "ddd" "aaa" "bbb" "ccc" "ddd" "aaa" "bbb" "ccc" "ddd" "aaa" "bbb" "ccc" "ddd" "aaa" "bbb" "ccc" "ddd"))
;; (symbol-function 'popup-select)
;; (defun popup-next (popup)
;;   "Select the next item of POPUP and draw."
;;   (let ((height (popup-height popup))
;;         (cursor (1+ (popup-cursor popup)))
;;         (scroll-top (popup-scroll-top popup))
;;         (length (length (popup-list popup))))
;;     (message (format "cursor: %d" cursor))
;;     (cond
;;      ((>= cursor length)
;;       ;; Back to first page
;;       (setq cursor 0
;;             scroll-top 0))
;;      ((= cursor (+ scroll-top height))
;;       ;; Go to next page
;;       (setq scroll-top (min (1+ scroll-top) (max (- length height) 0)))))
;;     (setf (popup-cursor popup) cursor
;;           (popup-scroll-top popup) scroll-top)
;;     (popup-draw popup)))

;; (defun popup-select (popup i)
;;   "Select the item at I of POPUP and draw."
;;   ;; (setq i (+ i (popup-offset popup)))
;;   (message (format "%d" 1))
;;   ;; (when (and (<= 0 i) (< i (popup-height popup)))
;;     ;; (setf (popup-cursor popup) i)
;;     ;; (popup-draw popup)
;;   ;; t)
;;   )

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-use-fuzzy nil)
(setq ac-use-menu-map t)
(setq ac-menu-height 15)
(setq ac-quick-help-delay 0.4)
(setq ac-delay 0.5)
(setq ac-auto-start 0)
(setq ac-candidate-limit 80)
(setq ac-expand-on-auto-complete t)
;; (print ac-modes)
;; (set-face-background 'ac-candidate-face "lightgray")
;; (set-face-underline 'ac-candidate-face "darkgray")
;; (set-face-background 'ac-selection-face "steelblue")
;; (print ac-use-quick-help)
(setq ac-quick-help-prefer-x nil)
;; (el-get-bundle pos-tip)
;; (require 'pos-tip)
;; ac-sources
;; (defvar my-ac-sources
;;   '(ac-source-yasnippet
;;     ac-source-abbrev
;;     ac-source-dictionary
;;     ;; ac-source-words-in-same-mode-buffers
;;     ))
;; (set-default 'ac-sources my-ac-sources)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-yasnippet)))
;; (add-to-list 'ac-sources 'ac-source-yasnippet)
(add-to-list 'ac-modes 'eshell-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'clojure-mode)
(add-to-list 'ac-modes 'go-mode)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'slim-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'csharp-mode)
(add-to-list 'ac-modes 'typescript-mode)

(defun remote-directory-p (dir)
  (s-matches? "\/scp:" dir))

(require 'pcomplete)
(defun ac-pcomplete ()
  ;; eshell uses `insert-and-inherit' to insert a \t if no completion
  ;; can be found, but this must not happen as auto-complete source
  (flet ((insert-and-inherit (&rest args)))
    ;; this code is stolen from `pcomplete' in pcomplete.el
    (let* (
           ;; Automatically complete remote stuff if in remote dir
           (tramp-mode (if (remote-directory-p default-directory) t nil))
           (pcomplete-stub)
           (pcomplete-show-list t) ;; inhibit patterns like * being deleted
           pcomplete-seen pcomplete-norm-func
           pcomplete-args pcomplete-last pcomplete-index
           (pcomplete-autolist pcomplete-autolist)
           (pcomplete-suffix-list pcomplete-suffix-list)
           (candidates (pcomplete-completions))
           (beg (pcomplete-begin))
           ;; note, buffer text and completion argument may be
           ;; different because the buffer text may bet transformed
           ;; before being completed (e.g. variables like $HOME may be
           ;; expanded)
           (buftext (buffer-substring beg (point)))
           (arg (nth pcomplete-index pcomplete-args)))
      ;; we auto-complete only if the stub is non-empty and matches
      ;; the end of the buffer text
      (when (and (not (zerop (length pcomplete-stub)))
                 (or (string= pcomplete-stub ; Emacs 23
                              (substring buftext
                                         (max 0
                                              (- (length buftext)
                                                 (length pcomplete-stub)))))
                     (string= pcomplete-stub ; Emacs 24
                              (substring arg
                                         (max 0
                                              (- (length arg)
                                                 (length pcomplete-stub)))))))
        ;; Collect all possible completions for the stub. Note that
        ;; `candidates` may be a function, that's why we use
        ;; `all-completions`.
        (let* ((cnds (all-completions pcomplete-stub candidates))
               (bnds (completion-boundaries pcomplete-stub
                                            candidates
                                            nil
                                            ""))
               (skip (- (length pcomplete-stub) (car bnds))))
          ;; We replace the stub at the beginning of each candidate by
          ;; the real buffer content.
          (mapcar #'(lambda (cand) (concat buftext (substring cand skip)))
                  cnds))))))
(ac-define-source pcomplete
  '((candidates . ac-pcomplete)))

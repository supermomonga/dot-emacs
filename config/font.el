;;; Font
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'jit-lock-mode))

;; カナｶﾅ
;; ┏┓┗┛
(concat
 " あいうえお かきくけこ あいうえお かきくけこ あいうえお かきくけこ あいうえお かきくけこ "
 " AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ "
 " 0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 0123456789 "
 " 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 "
 " ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ")

(when window-system
  (create-fontset-from-ascii-font "WanpakuRuikaMono-14:weight=thin:slant=normal" nil "wanpakuruika")
  (create-fontset-from-ascii-font "WanpakuRuikaMono-13:weight=thin:slant=normal" nil "wanpakuruikamini")

  (dolist (symbol-subgroup
           '((#x2500 . #x257F)
             ;; Emacs default
             (#x0250 . #x02AF) (#x0370 . #x03FF) (#x0500 . #x052F) (#x2000 . #x206F) (#x2070 . #x209F)
             (#x20A0 . #x20CF) (#x2100 . #x214F) (#x2150 . #x218F) (#x2190 . #x21FF) (#x2200 . #x22FF)
             (#x2300 . #x23FF) (#x2400 . #x243F) (#x2440 . #x245F) (#x2460 . #x24FF) (#x25A0 . #x25FF)
             (#x2600 . #x26FF) (#x2700 . #x27bF) (#x27C0 . #x27EF) (#x27F0 . #x27FF) (#x2900 . #x297F)
             (#x2980 . #x29FF) (#x2A00 . #x2AFF) (#x2B00 . #x2BFF) (#x2E00 . #x2E7F) (#x4DC0 . #x4DFF)
             (#xFE10 . #xFE1F) (#x10100 . #x1013F) (#x102E0 . #x102FF) (#x1D000 . #x1D0FF) (#x1D200 . #x1D24F)
             (#x1F0A0 . #x1F0FF) (#x1F100 . #x1F1FF) (#x1F300 . #x1F5FF) (#x1F600 . #x1F64F) (#x1F650 . #x1F67F)
             (#x1F680 . #x1F6FF) (#x1F700 . #x1F77F) (#x1F780 . #x1F7FF) (#x1F800 . #x1F8FF)))
    (set-fontset-font "fontset-wanpakuruika" symbol-subgroup (font-spec :family "Symbola" :size 14) nil 'append)
    (set-fontset-font "fontset-wanpakuruikamini" symbol-subgroup (font-spec :family "Symbola" :size 13) nil 'append))

  (add-to-list 'default-frame-alist '(font . "fontset-wanpakuruika"))
  ;; (add-to-list 'default-frame-alist '(font . "fontset-wanpakuruikamini"))
  ;; -*-wanpakuruikamono-thin-normal-normal-*-*-140-*-*-m-0-fontset-wanpakuruika
  ;; -*-WanpakuRuikaMono-thin-normal-normal-*-*-   -*-*-m-0-iso10646-1
  ;; -*-WanpakuRuikaMono-thin-normal-normal-*-*-*-*-*-m-0-iso10646-1

  (global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
  (global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
  (global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-increase 0))))

(defun popup-current-font-scale (&rest args)
  (interactive)
  (save-excursion
    (let* ((scale
            (cond
             ((plusp text-scale-mode-amount)
              (format "+%s" text-scale-mode-amount))
             ((minusp text-scale-mode-amount)
              (format "%s" text-scale-mode-amount))
             ((zerop text-scale-mode-amount)
              "ordinary"))))
      (popup-tip (format "Font scale: %s " scale)
                 :point (point)))))

(advice-add 'text-scale-increase :after 'popup-current-font-scale)
(advice-add 'text-scale-decrease :after 'popup-current-font-scale)

(defun global-text-scale-set (&rest args)
  (interactive)
  (let ((current-scale text-scale-mode-amount))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (text-scale-set current-scale)))))

(advice-add 'text-scale-increase :after 'global-text-scale-set)
(advice-add 'text-scale-decrease :after 'global-text-scale-set)


;;; Font
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'jit-lock-mode))

;; カナｶﾅ
;; ┏┓┗┛
(concat
 " あいうえお かきくけこ あいうえお かきくけこ あいうえお かきくけこ あいうえお かきくけこ "
 " AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ AABBCCDDEE FFGGHHIIJJ "
 " 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 幸福な人生 "
 " ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ｱｲｳｴｵｶｷｸｹｺ ")

(when window-system
  (create-fontset-from-ascii-font "WanpakuRuikaMono-14:weight=thin:slant=normal" nil "wanpakuruika")
  (set-fontset-font "fontset-wanpakuruika" '(#x2500 . #x257F) (font-spec :family "Symbola" :size 14) nil 'append)
  (set-fontset-font "fontset-wanpakuruika" '(#x2700 . #x27BF) (font-spec :family "Symbola" :size 14) nil 'append)
  (add-to-list 'default-frame-alist '(font . "fontset-wanpakuruika"))
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
              (format "ordinary")))))
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


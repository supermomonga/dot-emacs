
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'jit-lock-mode))

;; Sample text:
;;   あのイーハトーヴォの
;;   すきとおった風、
;;   夏でも底に冷たさをもつ青いそら、
;;   うつくしい森で飾られたモーリオ市、
;;   郊外のぎらぎらひかる草の波。
;;   祇辻飴葛蛸鯖鰯噌庖箸
;;   ABCDEFGHIJKLM
;;   abcdefghijklm
;;   1234567890
;;   ┏┓┗┛
;;   Dingbats: [❯][☯][♞][☎]
;;   русский язык
(create-fontset-from-ascii-font "Source Code Pro Light-14:weight=normal:slant=normal" nil "september")

;; Symbola font: http://users.teilar.gr/~g1951d/
(set-fontset-font "fontset-september" '(#x2700 . #x27BF) (font-spec :family "Symbola" :size 14) nil 'append)
(set-fontset-font "fontset-september" 'japanese-jisx0208 (font-spec :family "September" :size 14) nil 'append)
(set-fontset-font "fontset-september" 'katakana-jisx0201 (font-spec :family "September" :size 14) nil 'append) ;; hankaku kana
(add-to-list 'default-frame-alist '(font . "fontset-september"))

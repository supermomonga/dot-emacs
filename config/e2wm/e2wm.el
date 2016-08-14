
(el-get-bundle! e2wm)
(el-get-bundle! e2wm-direx)

(setq e2wm:c-code-recipe
      '(| (:left-max-size 30)
          (- (:upper-size-ratio 0.75)
             tree history)
          (- (:lower-max-size 150)
             (| (:right-max-size 30)
                main imenu)
             sub)))

(setq e2wm:c-code-winfo
      '((:name main)
        (:name tree    :plugin direx)
        (:name history :plugin history-list)
        (:name imenu   :plugin imenu :default-hide nil)
        (:name sub     :buffer "*info*" :default-hide t)))

(defun disable-tabbar (&rest args)
  (tabbar-mode 0))

(defun enable-tabbar (&rest args)
  (tabbar-mode 1))

(advice-add 'e2wm:start-management :before #'disable-tabbar)
(advice-add 'e2wm:stop-management :after #'enable-tabbar)

(defvar e2wm:def-plugin-files-mode-map)
(evil-make-overriding-map e2wm:def-plugin-files-mode-map 'normal)

(defvar e2wm:def-plugin-imenu-mode-map)
(evil-make-overriding-map e2wm:def-plugin-imenu-mode-map 'normal)

(defvar e2wm:def-plugin-history-list-mode-map)
(evil-make-overriding-map e2wm:def-plugin-history-list-mode-map 'normal)


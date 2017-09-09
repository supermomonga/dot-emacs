
;; emoji
(setq emojify-user-emojis
      '((":1:" . (("name" . "file")
                  ("image" . "~/Downloads/file.png")
                  ("style" . "github")))
        (":2:" . (("name" . "Opened folder")
                  ("image" . "~/Downloads/folder_open.png")
                  ("style" . "github")))
        (":3:" . (("name" . "Folder")
                  ("image" . "~/Downloads/folder.png")
                  ("style" . "github")))))
(el-get-bundle! emojify
  (setq
   emojify-emoji-styles '(unicode github)
   ;; emojify-inhibit-major-modes '(direx:direx-mode dired-mode doc-view-mode help-mode
   ;;                                                ibuffer-mode magit-popup-mode magit-diff-mode
   ;;                                                ert-results-mode compilation-mode mu4e-headers-mode)
   )
  (emojify-set-emoji-data))

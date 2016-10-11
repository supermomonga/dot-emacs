

(setq find-function-C-source-directory
      (file-truename (case system-type
                       ('darwin  (expand-file-name "~/Develops/sources/emacs-24.5/src"))
                       ('gnu/linux "~/dev/emacs/src"))))

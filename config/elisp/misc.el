

(setq find-function-C-source-directory
      (file-truename (case system-type
                       ('darwin  "~/momonga/Develops/sources/emacs-24.5/src")
                       ('gnu/linux "~/dev/emacs/src"))))

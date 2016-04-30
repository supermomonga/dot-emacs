
(el-get-bundle cask/shut-up)
(require 'shut-up nil t)



(el-get-bundle OmniSharp/omnisharp-emacs
  :depends (shut-up helm flycheck)
  :branch "feature-omnisharp-roslyn-support")

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(with-eval-after-load 'helm
  (with-eval-after-load 'flycheck
    (require 'omnisharp nil t)
    (defun omnisharp--find-project-files ()
      "Find project files in parent directories. Returns a list
containing the directory and matching filenames, or nil if no
project files were found."
      (let ((projects nil))
        (when buffer-file-name
          (locate-dominating-file
           (file-name-directory buffer-file-name)
           (lambda (file)
             (-when-let (dir-files (directory-files file nil "^project\\.json$"))
               (setq projects (cons (file-name-as-directory file)
                                    dir-files))))))
        projects))

    (defun omnisharp--find-solution-or-project-files ()
      "Find solution or project files in parent directories. Returns a list
containing the directory and matching filenames, or nil if no
matching files were found."
      (or (omnisharp--find-solution-files)
          (omnisharp--find-project-files)))

    (defun omnisharp-start-omnisharp-server (path-to-solution)
      "Starts an OmniSharpServer for a given path to a solution file or a directory"
      (interactive
       (list
        (-let [(directory filename . rest) (omnisharp--find-solution-or-project-files)]
          (read-file-name "Start OmniSharpServer.exe for solution/project: "
                          directory
                          nil
                          t
                          filename))))
      (setq BufferName "*Omni-Server*")
      (if (equal nil omnisharp-server-executable-path)
          (error "Could not find the OmniSharpServer. Please set the variable omnisharp-server-executable-path to a valid path")
        (if (or
             (omnisharp--valid-project-path-p path-to-solution)
             (omnisharp--valid-solution-path-p path-to-solution))
            (progn
              (cond
               ((string= (file-name-extension path-to-solution) "sln")
                (message (format "Starting OmniSharpServer for solution file: %s" path-to-solution)))
               ((string= (file-name-nondirectory path-to-solution) "project.json")
                (message (format "Starting OmniSharpServer for project file: %s" path-to-solution)))
               (t (message (format "Starting OmniSharpServer using folder mode in: %s" path-to-solution))))

              (when (not (eq nil (get-buffer BufferName)))
                (kill-buffer BufferName))

              (setq omnisharp--server-info
                    (make-omnisharp--server-info
                     ;; use a pipe for the connection instead of a pty
                     (let ((process-connection-type nil)
                           (process (start-process
                                     "Omni-Server" ; process name
                                     "Omni-Server" ; buffer name
                                     omnisharp-server-executable-path
                                     ;; remaining arguments
                                     ;; "-v"
                                     "--stdio" "-s" (file-truename path-to-solution))))
                       (set-process-filter process 'omnisharp--handle-server-message)
                       process))))
          (error (format "Path does not lead to a valid solution/project path: %s" path-to-solution)))))

    (defun omnisharp--valid-project-path-p (path-to-solution)
      (or (string= (file-name-nondirectory path-to-solution) "project.json")
          (file-directory-p path-to-solution)))


    (defun omnisharp--log (single-or-multiline-log-string)
      (when (and (require 'shut-up nil t) omnisharp-debug)
        (shut-up
          (let* ((log-buffer (get-buffer-create "*omnisharp-debug*")))
            (save-window-excursion
              (with-current-buffer log-buffer
                (end-of-buffer)
                (insert single-or-multiline-log-string)
                (insert "\n")))))))


    (setq omnisharp-debug t)

    (defun my-ac-omnisharp-setup ()
      (setq ac-sources
            '(my-ac-source-omnisharp)))

    (defun my-omnisharp--simplify-name (name)
      (nth 0 (split-string name "[ ()]")))

    (defun my-omnisharp--is-method-name (name)
      (string-match "(.*)" name))

    (defun my-omnisharp--ac-candidates ()
      (omnisharp--get-auto-complete-result-in-popup-format))

    (defvar my-ac-source-omnisharp
      '((candidates . my-omnisharp--ac-candidates)
        (prefix . my-ac-omnisharp-prefix)
        (action . my-ac-omnisharp-expand-method-args)))

    (defun my-ac-omnisharp-expand-method-args ()
      (interactive)
      (message ac-last-completion)
      (let ((ac-sources '(my-ac-source-omnisharp-with-args)))
        (auto-complete)))

    (defun omnisharp--convert-auto-complete-result-to-popup-format (json-result-alist)
      (mapcar
       (-lambda ((&alist 'DisplayText display-text
                         'CompletionText completion-text
                         'Description description
                         'Snippet snippet
                         'RequiredNamespaceImport require-ns-import))
         (let ((symbol (if (my-omnisharp--is-method-name display-text) "f" "v")))
           (popup-make-item display-text
                            :value (propertize completion-text 'Snippet snippet 'RequiredNamespaceImport require-ns-import)
                            :symbol symbol
                            :document description)))
       json-result-alist))


    (add-hook 'omnisharp-mode-hook 'my-ac-omnisharp-setup)




    (defun omnisharp-auto-complete (&optional invert-importable-types-setting)
      "If called with a prefix argument, will complete types that are not
present in the current namespace or imported namespaces, inverting the
default `omnisharp-auto-complete-want-importable-types'
value. Selecting one of these will import the required namespace."
      (interactive "P")
      (let* ((auto-complete-request
              (let ((omnisharp-auto-complete-want-importable-types
                     ;; Invert the user configuration value if requested
                     (if invert-importable-types-setting
                         (not omnisharp-auto-complete-want-importable-types)
                       omnisharp-auto-complete-want-importable-types)))
                (omnisharp--create-auto-complete-request))))

        (omnisharp--wait-until-request-completed
         (omnisharp-auto-complete-worker
          auto-complete-request
          (lambda (auto-complete-response)
            (funcall (omnisharp--get-auto-complete-display-function)
                     auto-complete-response))))))


    (defun my-ac-omnisharp-prefix ()
      "symbol or dot"
      (or (ac-prefix-default)
          (ac-prefix-c-dot)))
    ))





(el-get-bundle jorgenschaefer/circe)
(el-get-bundle iqbalansari/emacs-emojify)
(el-get-bundle yuya373/emacs-slack
  :depends (emacs-emojify websocket request circe alert oauth2))


(defun my/slack-mode-hook ()
  (setq-local ac-auto-start nil)
  (setq-local show-trailing-whitespace nil))

(add-hook 'slack-mode-hook 'my/slack-mode-hook)

(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t)
  (setq slack-prefer-current-team t)
  (setq slack-buffer-function #'switch-to-buffer)
  :config

  (slack-register-team
   :name "pgoftheline"
   :default t
   :client-id "7200663011.43042632597"
   :client-secret "24811e949d1ff6195acb98db3e701a22"
   :token "xoxp-7200663011-7225350131-43043149589-d107630f9f"
   :subscribed-channels '(darui_inc general mobamasu mobile_proxying notif_tutum omochi-bot outsource random server syunwa takeguchi towngetter twitter_account_gen visual_studio yahoo_account_gen))

  ;; (slack-register-team
  ;;  :name "test"
  ;;  :client-id "3333333333.77777777777"
  ;;  :client-secret "cccccccccccccccccccccccccccccccc"
  ;;  :token "xxxx-yyyyyyyyyy-zzzzzzzzzzz-hhhhhhhhhhh-llllllllll"
  ;;  :subscribed-channels '(hoge fuga))

  (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",u" 'slack-room-update-messages
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel)
   (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel))

(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

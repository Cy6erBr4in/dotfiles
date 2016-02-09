(require 'jabber)

(global-set-key (kbd "C-c C-j C-r") 'jabber-switch-to-roster-buffer)
(global-set-key (kbd "C-c C-j C-c") 'jabber-connect-all)
(global-set-key (kbd "C-c C-j C-d") 'jabber-disconnect)
(global-set-key (kbd "C-c C-j C-l") 'jabber-activity-switch-to)
(global-set-key (kbd "C-c C-j C-a") 'jabber-send-away-presence)
(global-set-key (kbd "C-c C-j C-o") 'jabber-send-default-presence)

(setq jabber-account-list '())
(setq jabber-alert-info-message-hooks '(jabber-info-libnotify
                                        jabber-info-screen
                                        jabber-info-echo
                                        jabber-info-display))
(setq jabber-alert-muc-hooks '(jabber-muc-libnotify-personal
                               jabber-muc-echo-personal
                               jabber-muc-echo
                               jabber-muc-scroll))
(setq jabber-auto-reconnect t)
(setq jabber-chat-buffer-show-avatar nil)
(setq jabber-history-enabled t)
(setq jabber-history-muc-enabled t)
(setq jabber-muc-colorize-foreign t)
(setq jabber-roster-line-format " %c %-25n %u %-8s")
(setq jabber-roster-subscription-display '(("none" . "   ")
                                           ("from" . "←")
                                           ("to" . "→")
                                           ("both" . "↔")))
(setq jabber-use-global-history nil)

(set-face-attribute 'jabber-chat-prompt-foreign nil
                    :foreground "orange"
                    :weight 'bold)
(set-face-attribute 'jabber-chat-prompt-local nil
                    :foreground "#8A2BE2"
                    :weight 'bold)
(set-face-attribute 'jabber-title-large nil
                    :weight 'bold)
(set-face-attribute 'jabber-title-medium nil
                    :weight 'bold)
(set-face-attribute 'jabber-title-small nil
                    :weight 'bold)

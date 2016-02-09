(require 'erc)
(require 'erc-track-score)
(require 'erc-hl-nicks)
(setq erc-modules '(autoaway
                    autojoin
                    button
                    completion
                    dcc
                    fill
                    irccontrols
                    list
                    log
                    match
                    menu
                    move-to-prompt
                    netsplit
                    networks
                    noncommands
                    readonly
                    ring
                    stamp
                    track
                    hl-nicks))
(erc-update-modules)
(setq erc-save-buffer-on-part t)
(setq erc-log-channels-directory "~/.emacs.d/erc/logs/")
(setq erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "[%R-%m/%d] "
      erc-insert-timestamp-function 'erc-insert-timestamp-left)
(erc-log-mode t)
(setq erc-auto-set-away nil)
(erc-autoaway-mode -1)
(erc-autojoin-mode t)
(erc-button-mode t)
(erc-dcc-mode t)
(erc-fill-mode t)
(erc-irccontrols-mode t)
(erc-list-mode t)
(erc-match-mode t)
(erc-menu-mode t)
(erc-move-to-prompt-mode t)
(erc-netsplit-mode t)
(erc-networks-mode t)
(erc-noncommands-mode t)
(erc-pcomplete-mode t)
(erc-readonly-mode t)
(erc-ring-mode t)
(erc-stamp-mode t)
(erc-track-minor-mode t)
(erc-track-mode t)
(erc-hl-nicks-mode t)

;; [S] Set highlight keyword list
(setq erc-keywords '("\\blunch\\b"
                     "\\blåda\\b"
                     "\\bäta\\b"
                     "\\bmat\\b"
                     "\\blunchlåda\\b"
                     "\\bhamburgare\\b"
                     "\\bfredagsburgare\\b"
                     "\\bburgare\\b"
                     "\\bbox\\b"
                     "\\bburger\\b"
                     "\\bfood\\b"))
;; [E]

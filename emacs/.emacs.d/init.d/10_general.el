;; [S] Colore scheme
(load-file "~/.emacs.d/site-lisp/color-theme-wombat.el")
(color-theme-wombat)
;; [E]

;; [S] Default face
(set-face-attribute 'default nil
                    :height 98
                    :width 'normal
                    :foundry "microsoft"
                    :family "Consolas")
;;[E]

;; [S] General configuration
(setq column-number-mode t)
(setq confirm-kill-emacs 'y-or-n-p)
(setq dired-listing-switches "-aBhl  --group-directories-first")
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice t)
(setq make-backup-files nil)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(savehist-mode t)
(setq save-place-file "~/.emacs.d/emacs-places")
(setq-default save-place t)
(require 'saveplace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-trailing-separator-p t)
(setq uniquify-ignore-buffers-re "^\\*")
(setq x-select-enable-clipboard t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; [E]

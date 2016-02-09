(require 'helm)
(require 'helm-config)
(require 'helm-cmd-t)
(require 'helm-projectile)

;; [S] HELM face configuration
(set-face-attribute 'helm-selection nil
                    :background "#333333"
                    :underline nil)
(set-face-attribute 'helm-source-header nil
                    :background "#656565"
                    :width 'normal
                    :height 98)

(set-face-attribute 'helm-ff-directory nil
                    :foreground "#cae682"
                    :background "#242424")
(set-face-attribute 'helm-ff-file nil
                    :foreground "#f6f3e8")
(set-face-attribute 'helm-ff-symlink nil
                    :foreground "#8ac6f2")
(set-face-attribute 'helm-ff-invalid-symlink nil
                    :foreground "pink"
                    :weight 'bold)
;; [E]

;; ;; [S] HELM custome key bindings
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-c h i")
                '(lambda () (interactive (progn
                              (semantic-mode 1)
                              (helm-semantic-or-imenu nil)
                              (semantic-mode -1)))))
;; [E]

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)


;; [S] Define list of sources for helm-for-files
(setq helm-for-files-preferred-list '(helm-source-buffers-list
                                      helm-source-recentf
                                      helm-source-bookmarks
                                      helm-source-file-cache
                                      helm-source-files-in-current-dir
                                      helm-source-locate))

;; [S] Setup projectile mode
(projectile-global-mode)
(setq projectile-compiletion-system 'helm)
(helm-projectile-on)
;; [E]

(helm-mode 1)

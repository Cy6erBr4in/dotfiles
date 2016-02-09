;; [S] load-path configuration
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;; [E]

;; [S] Package management configuration
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(thrift
                      sx
                      slime
                      multi
                      markdown-toc
                      markdown-mode+
                      magit
                      latex-preview-pane
                      latex-pretty-symbols
                      latex-extra
                      jedi
                      jabber
                      init-loader
                      highlight-current-line
                      helm-projectile
                      helm-google
                      helm-cmd-t
                      helm-ag
                      evil-search-highlight-persist
                      erc-view-log
                      erc-track-score
                      erc-hl-nicks
                      edts
                      diff-hl
                      color-theme
                      cider
                      buffer-move)
  "A list of packages that will be installed if not present when firing Emacs")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
;; [E]

;; [S] Load local configuration
(init-loader-load "~/.emacs.d/init.d/")
;; [E]

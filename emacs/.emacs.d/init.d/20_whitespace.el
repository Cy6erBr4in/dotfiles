(require 'whitespace)
(set-face-attribute 'whitespace-hspace nil
                    :background "dark blue"
                    :foreground "white")
(set-face-attribute 'whitespace-line nil
                    :background "grey30"
                    :foreground "white")
(set-face-attribute 'whitespace-newline nil
                    :background "blue"
                    :foreground "white"
                    :weight     'normal)
(set-face-attribute 'whitespace-space nil
                    :background "dark blue"
                    :foreground "white")
(setq whitespace-style  '(face empty tabs lines-tail trailing))
(setq whitespace-global-modes '(not erc-mode))
(global-whitespace-mode t)

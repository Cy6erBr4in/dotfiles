(require 'highlight)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(setq evil-search-highlight-string-min-len 3)
(set-face-attribute 'evil-search-highlight-persist-highlight-face nil
                    :background "darkolivegreen")

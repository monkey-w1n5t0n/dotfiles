;; Windows performance tweaks
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

;;;;;;;;;;;;;;;;; Setup package stuff
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("org"   . "http://orgmode.org/elpa/")))
(package-initialize)
(package-refresh-contents)

;; Install use-package if it's not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(use-package org)

(defconst literate-config (expand-file-name "~/.config/emacs/config.org"))
(defconst tangled-config "config.el")
(when (file-exists-p literate-config)
  (org-babel-tangle-file literate-config tangled-config)
  (org-babel-load-file literate-config))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (dockerfile-mode multiple-cursors cmake-mode load-directory evil-snipe extempore-mode scel smartparens linum-relative solaire-mode doom-themes treemacs-evil treemacs intero doom-modeline modeline smart-mode-line evil nord-theme ido-vertical-mode haskell-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

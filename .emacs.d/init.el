;;;;;; Initialize package manager and archives (require 'package)
;; Set the window's name
(setq frame-title-format "TimeLines")

;; Remove unecessary distractions from the frame
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ("gnu" . "http://elpa.gnu.org/packages/")
    ("org" . "http://orgmode.org/elpa/")))

(package-initialize)
(package-refresh-contents)


;; Install use-package if it's not already installed
(unless
    (package-installed-p 'use-package) (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

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
    (expand-region avy yasnippet intero ghc haskell-mode org-ref smart-mode-line one-themes which-key ido-vertical-mode smartparens scroll-restore evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(org-babel-load-file (expand-file-name "~/.emacs.d/timelines-setup.org"))

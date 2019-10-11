;;; An example config file to get you started with Emacs.
;;; It uses use-package for automatic package installation and management,
;;; it maintains the familiar-to-many Ctrl-c for copy, Ctrl-x for cut, Ctrl-v for paste.

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

;; Haskell mode provides syntax highlighting and other goodies

;; Use General for easy key binding definitions
;; Load up timelines-mode, the star of the evening
(load "~/.emacs.d/timelines-mode.el")

;;
;; ~~~ Change this if you cloned the TimeLines source repo in any other path ~~~
;;
(setq timelines-path "~/timelines")

;; Snippets = less typing = good


(defvar literate-config "~/.config/emacs/config.org")
(org-babel-load-file (expand-file-name literate-config))


(setq initial-major-mode 'lisp-interaction-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil nord-theme ido-vertical-mode monokai-theme haskell-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defconst config-file-path 
    (expand-file-name "~/.config/emacs/config.org"))

(setq explicit-shell-file-name
  "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files/Git/bin")

;;(use-package smart-mode-line
    ;; :config
    ;;(sml/setup)
   ;;(setq sml/theme 'respectful))

  ;;(use-package all-the-icons)
  ;;(use-package nord-theme)


(use-package doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-nord t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
  ;;(use-package doom-modeline
  ;;  :config
  ;;  (doom-modeline-mode 1))

(use-package solaire-mode
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg))

(use-package treemacs)
(use-package treemacs-evil)


(use-package general)

(use-package evil
  :config
  (evil-mode 1))

(use-package yasnippet
  :config 
  (yas-global-mode 1)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand))

(use-package which-key
  :config (which-key-mode))

(use-package ido
  :config
  (ido-mode 1)
  (setq ido-enable-flex-matching t
	ido-create-new-buffer 'always
	ido-everywhere t))
(use-package ido-vertical-mode
  :init
  (ido-vertical-mode 1))

(use-package linum-relative
  :config
  (linum-relative-mode))

(use-package haskell-mode)
(use-package intero)

(defconst timelines-mode-path "~/.emacs.d/timelines-mode.el")
(load timelines-mode-path)
(defconst timelines-path "~/timelines")

(global-display-line-numbers-mode 1)

(general-def
  :keymaps 'timelines-mode-map
  :states 'normal
  "RET" 'timelines-eval-region)

(general-def
  :states '(normal visual motion)
  :keymaps 'visual-line-mode-map
  "t" 'evil-next-visual-line
  "n" 'evil-previous-visual-line
  )

  ;;;; Inside a buffer
(general-def
  :states '(normal visual motion)
  :keymaps 'override

  "h" 'backward-char
  "t" 'evil-next-visual-line
  "n" 'evil-previous-visual-line
  "s" 'forward-char

  "H" 'evil-backward-word-begin
  "T" 'evil-forward-paragraph
  "N" 'evil-backward-paragraph
  "S" 'evil-forward-word-end

  "e" 'evil-delete
  "a" 'evil-avy-goto-char

  ";" 'undo-tree-undo
  ":" 'undo-tree-redo

  "'" 'evil-ex

  "E" 'evil-delete-whole-line

  "cg" 'evil-snipe-F
  "cG" 'evil-snipe-T
  "cr" 'evil-snipe-f
  "cR" 'evil-snipe-t
  "cc" 'evil-snipe-repeat

  "gg" 'evil-beginning-of-visual-line
  "gr" 'evil-end-of-visual-line
  "gc" 'evil-goto-first-line
  "gt" 'evil-goto-line

  "G" 'evil-scroll-down
  "R" 'evil-scroll-up


  "SPC c /" 'comment-or-uncomment-region
  "j" 'evil-change


  "u" 'evil-insert
  "U" 'evil-insert-line
  "i" 'evil-append
  "I" 'evil-append-line


  "p" 'evil-paste-after;; -from-0

  "oe" 'evil-open-below
  "ou" 'evil-open-above

  "-" 'newline-and-indent

  "k" 'evil-scroll-page-down
  "K" 'evil-scroll-page-up
  )



(defconst leader-key "SPC")


;;;; WINDOWS AND BUFFERS
(general-def
  :states 'normal
  :keymaps 'override
  :prefix leader-key


  "w k" 'split-window-below
  "w u" 'split-window-right
  ;;
  "w E" 'delete-other-windows
  "w e" 'delete-window
  ;;
  "w h" 'evil-window-left
  "w s" 'evil-window-right
  "w t" 'evil-window-down
  "w n" 'evil-window-up

  "f f" 'ido-find-file
  "f p" 'open-config-file 

  "b s" 'save-buffer
  "b b" 'ido-switch-buffer
  "b e" 'ido-kill-buffer

  "o e" 'shell
  ;;"w H" '+evil/window-move-left
  ;;"w S" '+evil/window-move-right
  ;;"w T" '+evil/window-move-down
  ;;"w N" '+evil/window-move-up
  )

(defun open-config-file ()
  (interactive)
  (find-file config-file-path))


;;"SPC-f-." 'counsel-find-file


;;
;;
;;(lookup-key (current-global-map) (kbd "Esc-g"))





(general-def
  "C-}" 'text-scale-increase
  "C-{" 'text-scale-decrease)



;;;;;;;;;;;;;; Setup some more user-friendly functionality and defaults (e.g. the usual cut/copy/paste bindings)

;; When a key combination has started, after a while
;; displays all possible keys to complete it
;; Type 'y' or 'n' instead of 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Replaces a selection with any letter pressed
(delete-selection-mode 1)

(setq scroll-conservatively 100
      select-enable-clipboard t
      show-paren-delay 0
      show-trailing-whitespace nil)


;;;;;;;;;;;;;; Setup themes and other aesthetic stuff

;; Set the mood, there's plenty of other themes to choose from here:
;; https://emacsthemes.ocm/popular/index.html

;; Set the window's name
(setq frame-title-format "TimeLines")

;; Remove unecessary distractions from the frame
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(line-number-mode 1)
(show-paren-mode 1)

;; Cursor settings
(blink-cursor-mode 0)
(set-default 'cursor-type 'box)
(set-cursor-color "#ff1493")

;; Highlight the line the cursor is on
(global-hl-line-mode t)

;; Operate on visual, rather than logical, lines
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Reload the init file with a key binding
(global-set-key (kbd "C-c p")
		(lambda ()
		  (interactive)
		  (load-file "~/.emacs.d/init.el")))


;; Clean up startup behaviour
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore)

;; Go to any line with Alt-g
(global-set-key "\M-g" 'goto-line)

(setq initial-major-mode 'lisp-interaction-mode)
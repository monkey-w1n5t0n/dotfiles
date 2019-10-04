;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; NOTE remap C-x and C-c to be the same in Dvorak
(general-def
  :keymaps 'override
  "C-q" 'Control-X-prefix
  "C-j" 'mode-specific-command-prefix
  )

(general-def
  :keymaps 'timelines-mode-map
  :states 'normal
  "RET" 'timelines-eval-region)

;; Toggle region comment
(general-def
  :states '(normal visual motion)
  :keymaps 'visual-line-mode-map
  "t" 'evil-next-visual-line
  "n" 'evil-previous-visual-line
  )

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


(general-def
  :states 'normal
  :keymaps 'override
  :prefix doom-leader-key

  "b s" 'save-buffer

  "w h" 'evil-window-left
  "w s" 'evil-window-right
  "w t" 'evil-window-down
  "w n" 'evil-window-up

  "w H" '+evil/window-move-left
  "w S" '+evil/window-move-right
  "w T" '+evil/window-move-down
  "w N" '+evil/window-move-up
  )




;;"SPC-f-." 'counsel-find-file


;;
;;
;;(lookup-key (current-global-map) (kbd "Esc-g"))





(general-def
  "C-}" 'text-scale-increase
  "C-{" 'text-scale-decrease)

(general-def
  :keymaps 'ranger-normal-mode-map
  "h" 'ranger-prev-parent
  "t" 'ranger-next-file
  "n" 'ranger-previous-file
  "s" 'ranger-parent-child-select)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(97 . 80))
(add-to-list 'default-frame-alist '(alpha . (97 . 80)))


(setq doom-theme 'doom-nord)
;(setq doom-theme 'doom-spacegrey)
(setq global-visual-line-mode t)

;(defconst path-to-timelines-mode "~/code/timelines-emacs/")
;;(add-to-list 'load-path path-to-timelines-mode)
;; (require 'timelines-mode)
;; (setq timelines-path "~/code/timelines")

;(add-to-list 'load-path "~/code/supercollider-emacs/el")
;; (require 'sclang)


;; Use a key sequence as escape instead of a dedicated button
;; Caps lock can now be control!
(setq-default evil-escape-key-sequence ",.")
(global-hl-line-mode t)

; Set backup directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(setq default-directory "~/code")

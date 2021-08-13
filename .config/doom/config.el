;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "w1n5t0n"
      user-mail-address "infinitemonkeys@tuta.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(set-face-attribute 'default nil :height 130)



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(general-def
  :states '(normal visual motion)
  :keymaps 'visual-line-mode-map
  "t" 'evil-next-visual-line
  "n" 'evil-previous-visual-line)


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

  ";" 'evil-undo
  ":" 'evil-redo

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

  "ou" 'evil-open-below
  "oe" 'evil-open-above

  "ou" 'sp-select-next-thing

  "os" 'sp-slurp-hybrid-sexp
  "oS" 'sp-forward-barf-sexp
  "oh" 'sp-backward-slurp-sexp
  "oH" 'sp-backward-barf-sexp

  "-" 'newline-and-indent

  "k" 'evil-scroll-page-down
  "K" 'evil-scroll-page-up

  "SPC w h" 'evil-window-left
  "SPC w s" 'evil-window-right

  "SPC w t" 'evil-window-bottom
  "SPC w n" 'evil-window-up
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


  "k n" 'sp-up-sexp
  "k t" 'sp-down-sexp
  "k h" 'sp-backward-sexp
  "k s" 'sp-forward-sexp

  "k b h" 'sp-backward-barf-sexp
  "k b s" 'sp-forward-barf-sexp

  "k m h" 'sp-slurp-hybrid-sexp

  "k d" 'sp-splice-sexp

  "k e" 'sp-kill-sexp)


(defun browse-scored ()
  (interactive)
  (doom-project-browse "~/dev/scored"))



;;"SPC-f-." 'counsel-find-file


;;
;;
;;(lookup-key (current-global-map) (kbd "Esc-g"))





(general-def
  "C-}" 'text-scale-increase
  "C-{" 'text-scale-decrease)

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/bin/sbcl")

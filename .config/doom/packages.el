;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! timelines-mode
  :recipe (:host github :repo "lnfiniteMonkeys/TimeLines-emacs"))

(after! timelines-mode
  (setq timelines-path "~/code/timelines"))


(package! general)
(package! evil-escape)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Cameron Schmitter"
      user-mail-address "cdmschmitter@hotmail.com")

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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 20))
(setq doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))
;; (setq doom-variable-pitch-font (font-spec :family "Latin Modern Mono"))

(setq-default evil-insert-state-cursor '(hbar . 3))

;; Modeline
;; (custom-set-faces
;;   '(mode-line ((t (:family "Noto Sans" :size 20))))
;;   '(mode-line-inactive ((t (:family "Noto Sans" :size 20)))))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)
;; (color-theme-approximate-on)
(add-to-list 'term-file-aliases
             '("screen.xterm-256color" . "xterm-256color"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; load the custom binding
(load! "+bindings")

;; set fullscreen on start up
(toggle-frame-fullscreen)

;; -- pdf view --
;; causes pdfs to reload automatically when recompiled from .tex or .md
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; -- zen mode --
(add-hook 'writeroom-mode-hook
          '(lambda () (if (bound-and-true-p writeroom-mode)
                          (load-theme 'doom-tomorrow-day)
                        (load-theme 'doom-tomorrow-night))))

;; -- LaTex --

;; -- Haskell --
(add-hook 'haskell-mode-hook 'flycheck-mode)

;; -- Org-mode --
;; This doesn't seem to work... I need to figure out doom org-mode
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "DOINGNOW(d!)" "TOSUBMIT(s!)"
                  "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)"
                  "|" "CANCELLED(c!)" "DONE(F!)")))

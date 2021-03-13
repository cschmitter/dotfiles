;;; private/default/+bindings.el -*- lexical-binding: t; -*-

;; This files defines a Spacemacs-esque keybinding scheme

(map! [remap evil-jump-to-tag] #'projectile-find-tag
      [remap find-tag]         #'projectile-find-tag

      ;; Ensure there are no conflicts
      :nmvo doom-leader-key nil
      :nmvo doom-localleader-key nil

      ;; --- Global keybindings ---------------------------
      ;; Text-scaling
      "C-+"       (λ! (text-scale-set 0))
      "C-="       #'text-scale-increase
      "C--"       #'text-scale-decrease

      ;; --- <leader> -------------------------------------
      (:leader
        :desc "M-x"                     :nv ":"  #'execute-extended-command
        :desc "Switch"
        :desc "Pop up scratch buffer"   :nv "x"  #'doom/open-scratch-buffer
        :desc "Org Capture"             :nv "X"  #'+org-capture/open

        ;; Most commonly used
        :desc "Previous buffer"         :n "["   #'previous-buffer
        :desc "Next buffer"             :n "]"   #'next-buffer
        :desc "Switch buffer"           :n "<"   #'switch-to-buffer
        :desc "Browse files"            :n "SPC"   #'find-file
        :desc "Toggle last popup"       :n "~"   #'popup-toggle
        :desc "Eval expression"         :n ";"   #'eval-expression

        ;; C-u is used by evil
        :desc "Universal argument"      :n "u"  #'universal-argument
        :desc "window"                  :n "w"  evil-window-map

        ;; for aligning the section properly
        :desc "Align Current"           :nv "a" #'align-current

        (:desc "buffer" :prefix "b"
          :desc "New empty buffer"        :n "n" #'evil-buffer-new
          :desc "Switch workspace buffer" :n "b" #'persp-switch-to-buffer
          :desc "Switch buffer"           :n "B" #'switch-to-buffer
          :desc "Kill buffer"             :n "k" #'doom/kill-this-buffer
          :desc "Kill other buffers"      :n "o" #'doom/kill-other-buffers
          :desc "Save buffer"             :n "s" #'save-buffer
          :desc "Pop scratch buffer"      :n "x" #'doom/open-scratch-buffer
          :desc "Bury buffer"             :n "z" #'bury-buffer
          :desc "Next buffer"             :n "]" #'next-buffer
          :desc "Previous buffer"         :n "[" #'previous-buffer
          :desc "Sudo edit this file"     :n "S" #'doom/sudo-this-file)

        (:desc "code" :prefix "c"
          :desc "Comment line"              :n  "l" #'comment-line
          :desc "List errors"               :n  "x" #'flycheck-list-errors
          :desc "Evaluate buffer/region"    :n  "e" #'+eval/buffer
                                            :v  "e" #'+eval/region
          :desc "Evaluate & replace region" :nv "E" #'+eval:replace-region
          :desc "Build tasks"               :nv "b" #'+eval/build
          :desc "Jump to definition"        :n  "d" #'+jump/definition
          :desc "Jump to references"        :n  "D" #'+jump/references
          :desc "Open REPL"                 :n  "r" #'+eval/open-repl
                                            :v  "r" #'+eval:repl)

        (:desc "file" :prefix "f"
          :desc "Find file"                 :n "." #'find-file
          :desc "Sudo find file"            :n ">" #'doom/sudo-find-file
          :desc "Find file in project"      :n "/" #'projectile-find-file
          :desc "Find file from here"       :n "?" #'counsel-file-jump
          :desc "Find other file"           :n "a" #'projectile-find-other-file
          :desc "Open project editorconfig" :n "c" #'editorconfig-find-current-editorconfig
          :desc "Find file in dotfiles"     :n "d" #'+default/find-in-dotfiles
          :desc "Browse dotfiles"           :n "D" #'+default/browse-dotfiles
          :desc "Find file in emacs.d"      :n "e" #'+default/find-in-emacsd
          :desc "Browse emacs.d"            :n "E" #'+default/browse-emacsd
          :desc "Recent files"              :n "r" #'recentf-open-files
          :desc "Recent project files"      :n "R" #'projectile-recentf
          :desc "Yank filename"             :n "y" #'+default/yank-buffer-filename)

        (:desc "git" :prefix "g"
          :desc "Git status"            :n  "S" #'magit-status
          :desc "Git blame"             :n  "b" #'magit-blame
          :desc "Git time machine"      :n  "t" #'git-timemachine-toggle
          :desc "Git stage hunk"        :n  "s" #'git-gutter:stage-hunk
          :desc "Git revert hunk"       :n  "r" #'git-gutter:revert-hunk
          :desc "Git revert buffer"     :n  "R" #'vc-revert
          :desc "List gists"            :n  "g" #'+gist:list
          :desc "Next hunk"             :nv "]" #'git-gutter:next-hunk
          :desc "Previous hunk"         :nv "[" #'git-gutter:previous-hunk)

        (:desc "open" :prefix "o"
          :desc "Default browser"       :n  "b" #'browse-url-of-file
          :desc "Debugger"              :n  "d" #'+debug/open
          :desc "REPL"                  :n  "r" #'+eval/open-repl
                                        :v  "r" #'+eval:repl
          :desc "Neotree"               :n  "n" #'+neotree/toggle
          :desc "Terminal"              :n  "t" #'+term/open-popup
          :desc "Terminal in project"   :n  "T" #'+term/open-popup-in-project)

        (:desc "toggle" :prefix "t"
          :desc "Center cursor"     :n "-" #'centered-cursor-mode
          :desc "Flyspell"              :n "s" #'flyspell-mode
          :desc "Flycheck"              :n "f" #'flycheck-mode
          :desc "Line numbers"          :n "l" #'doom/toggle-line-numbers
          :desc "Fullscreen"            :n "f" #'toggle-frame-fullscreen
          :desc "Big mode"              :n "b" #'doom-big-font-mode
          :desc "Evil goggles"          :n "g" #'+evil-goggles/toggle))


      ;; --- Personal vim-esque bindings ------------------
      ;; don't leave visual mode after shifting
      :v  "<"  #'+evil/visual-dedent  ; vnoremap < <gv
      :v  ">"  #'+evil/visual-indent  ; vnoremap > >gv

      ;; --- Plugin bindings ------------------------------
      ;; flycheck
      :m  "]e" #'next-error
      :m  "[e" #'previous-error

      ;; neotree
      (:after neotree
        :map neotree-mode-map
        :n "g"         nil
        :n [tab]       #'neotree-quick-look
        :n "RET"       #'neotree-enter
        :n [backspace] #'evil-window-prev
        :n "c"         #'neotree-create-node
        :n "r"         #'neotree-rename-node
        :n "d"         #'neotree-delete-node
        :n "j"         #'neotree-next-line
        :n "k"         #'neotree-previous-line
        :n "n"         #'neotree-next-line
        :n "p"         #'neotree-previous-line
        :n "h"         #'+neotree/collapse-or-up
        :n "l"         #'+neotree/expand-or-open
        :n "J"         #'neotree-select-next-sibling-node
        :n "K"         #'neotree-select-previous-sibling-node
        :n "H"         #'neotree-select-up-node
        :n "L"         #'neotree-select-down-node
        :n "G"         #'evil-goto-line
        :n "gg"        #'evil-goto-first-line
        :n "v"         #'neotree-enter-vertical-split
        :n "s"         #'neotree-enter-horizontal-split
        :n "q"         #'neotree-hide
        :n "R"         #'neotree-refresh)
)

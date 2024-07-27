(setq inhibit-startup-message t)
(scroll-bar-mode -1) (tool-bar-mode -1) (tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq warning-minimum-level :emergency)
(setq initial-scratch-message "")
(setq initial-major-mode 'org-mode)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      2 ; how many of the newest versions to keep
      kept-old-versions      1) ; and how many of the old

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'package)
(require 'use-package)
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t))

(use-package mood-line
    :config
    (mood-line-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package rainbow-mode 
    :config
    (rainbow-mode))
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-shift-round nil)
  (setq evil-shift-width 2)

  :config
  (evil-mode 1))
(use-package evil-collection
    :after evil
    :config
    (evil-collection-init))

(use-package general
  :config
  (general-create-definer prayag/leader-keys
    :states '(normal insert motion visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package org-bullets :ensure t
  :config
    (setq org-bullets-bullet-list '( "♣" "♦" "♥" "♠" )))

(use-package consult
  :ensure t
  :hook (completion-list-mode . consult-preview-at-point-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
    (treemacs-project-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))

(use-package vterm
  :config
  (setq vterm-timer-delay 0.01))
(use-package vterm-toggle
  :config
  (add-to-list 'display-buffer-alist
     '("\*vterm\*"
       (display-buffer-in-side-window)
       (window-height . 0.4)
       (side . bottom)
       (slot . 0))))
(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (smartparens-mode))
(use-package org-roam
  :custom
  (org-roam-directory "~/me/notes")
  :config
  (org-roam-db-autosync-enable))
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 30)))
(use-package 'htmlize
  :ensure t)

(general-define-key
"C-=" 'text-scale-increase
"C--" 'text-scale-decrease
"C-u" 'evil-scroll-up)

(prayag/leader-keys
"b" '(:ignore t :which-key "buffers")
"<" '(switch-to-buffer :which-key "switch buffer")
"bk" '(kill-buffer-and-window :which-key "kill buffer"))

(prayag/leader-keys
"w" '(:ignore t :which-key "windows")
"wH" '(evil-window-split :which-key "horizontal split")
"wV" '(evil-window-vsplit :which-key "vertical split")
"wj" '(evil-window-down :which-key "move cursor to the window below")
"wk" '(evil-window-up :which-key "move cursor to the window above")
"wh" '(evil-window-left :which-key "move cursor to the left window")
"wl" '(evil-window-right :which-key "move cursor to the right window")
"wd" '(evil-window-delete :which-key "delete window"))

(prayag/leader-keys
"f" '(:ignore t :which-key "files")
"." '(find-file :which-key "find file")
"fr" '(recentf :which-key "show recent files"))

(general-define-key
:prefix "SPC"
:keymaps 'normal
"TAB" '(:keymap perspective-map :which-key "workspaces" :package perspective))

(prayag/leader-keys
"o" '(:ignore t :which-key "open")
"ot" '(vterm-toggle :which-key "toggle terminal")
"oa" '(org-agenda :which-key "agenda")
"oc" '(org-capture :which-key "capture")
"od" '(dired :which-key "dired"))

(prayag/leader-keys
"t" '(:ignore t :which-key "terminal"))

(prayag/leader-keys
"n" '(:ignore t :which-key "notes")
"nf" '(org-roam-node-find :which-key "find notes")
"ni" '(org-roam-node-insert :which-key "terminal"))

(prayag/leader-keys
":" '(execute-extended-command :which-key "run commands"))

(general-define-key
:states '(normal insert)
:keymaps 'org-mode-map
"TAB" 'org-demote-subtree
"S-TAB" 'org-promote-subtree)

(prayag/leader-keys
:states 'normal
:keymaps 'org-mode-map

"mc" '(:ignore t :which-key "clock")
"mci" 'org-clock-in
"mco" 'org-clock-out
"mcR" 'org-clock-report
"mct" 'org-evaluate-time-range
"mcc" 'org-clock-cancel)

(prayag/leader-keys
:states 'normal
:keymaps 'org-mode-map

"md" '(:ignore t :which-key "dates")
"mdd" 'org-deadline
"mds" 'org-schedule
"mdt" 'org-time-stamp
"mdT" 'org-time-stamp-inactive)
(prayag/leader-keys
:states 'normal
:keymaps 'org-mode-map

"mp" '(:ignore t :which-key "priority")
"mpd" 'org-priority-down
"mpp" 'org-priority
"mpu" 'org-priority-up)
(prayag/leader-keys
:states 'normal
:keymaps 'org-mode-map

"ml" '(:ignore t :which-key "links")
"mll" 'org-insert-link
"mls" 'org-store-link
"mlS" 'org-insert-last-stored-link
"mlt" 'org-toggle-link-display)

(prayag/leader-keys
:states 'normal
:keymaps 'org-mode-map

"m" '(:ignore t :which-key "org mode")
"mt" 'org-todo
"mx" 'org-toggle-checkbox)
(define-key evil-motion-state-map (kbd "RET") nil)

(global-display-line-numbers-mode t)
(dolist (mode '(term-mode-hook
            vterm-mode-hook
            eshell-mode-hook
            neotree-mode-hook
            treemacs-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))
(setq org-hide-leading-stars t)
(evil-set-undo-system 'undo-redo)
(setq history-length 10)
(savehist-mode 1)
(setq use-dialog-box nil)
(set-frame-parameter nil 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))
(setq display-buffer-base-action
  '(display-buffer-reuse-window
    display-buffer-reuse-mode-window
    display-buffer-same-window
    display-buffer-in-previous-window))

(defun prayag-org-mode-hook ()
  (org-indent-mode 1)
  (org-bullets-mode 1)
  (evil-org-mode 1)
  (setq org-src-preserve-indentation nil
        org-edit-src-content-indentation 0))

(add-hook 'org-mode-hook 'prayag-org-mode-hook)

(setq indent-tabs-mode nil)
(setq js-indent-level 2)
(setq web-mode-code-indent-offset 2)
(setq org-extend-today-until 4)
(setq org-image-actual-width 300)
(setq org-src-window-setup 'current-window)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-hide-emphasis-markers t)
(setq org-agenda-start-with-log-mode t)
(setq org-return-follows-link t)
(setq org-agenda-window-setup 'only-window)
(setq org-habit-preceding-days 14)
(setq org-ellipsis " ")
(setq org-habit-graph-column 70)
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t) (python . t) (js . t) (typescript . t) (shell . t)))
(require 'htmlize)
(setq org-html-htmlize-output-type 'css)
(setq org-html-htmlize-font-prefix "org-")
(setq org-src-fontify-natively t)

;; FONT
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-16"))
(set-frame-font "JetBrains Mono-16" t t)
(set-face-attribute 'default nil :family "JetBrains Mono") 
(provide 'init)

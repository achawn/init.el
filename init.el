;;; Configuration --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/hawna")
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Olivetti
(require 'olivetti)

;; Orderless?
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; Magit
(require 'magit)

;; Embark
(require 'embark)
(global-set-key (kbd "C-.") 'embark-act)
(global-set-key (kbd "C-,") 'embark-act-all)

;; Marginalia
(require 'marginalia)
(marginalia-mode)

;; ISearch
;; enable counter for isearch
(setq isearch-lazy-count t)
;; interpret spaces in isearch term
(setq search-whitespace-regexp ".*?")

;; History
(setq-default savehist-additional-variables '(register-alist kill-ring))
(savehist-mode 1)

;; Bookmarks
;; save bookmarks immediately
(setq-default bookmark-save-flag 1)
;; Marks
;; Make Emacs repeat the C-u C-SPC command (`set-mark-command') by
;; following it up with another C-SPC.  It is faster to type
;; C-u C-SPC, C-SPC, C-SPC, than C-u C-SPC, C-u C-SPC, C-u C-SPC...
(setq set-mark-command-repeat-pop t)

;; Helpful UI
;; You will most likely need to adjust this font size for your system!
(defvar config/default-font-size 140)


(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(setq split-height-threshold nil) ; Favor splitting horizontally

;; Ripgrep
(require 'rg)

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :height config/default-font-size)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Source Code Blocks
(require 'org-tempo)

;; Which Key
(require 'which-key)
(which-key-mode)

;; Eglot
(require 'eglot)

;; Company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

;; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(flycheck-add-mode 'javascript-eslint 'vue-mode)
(flycheck-add-mode 'javascript-eslint 'vue-html-mode)

;; Javascript
(setq-default js-indent-level 2)

;; Vue
(require 'vue-mode)
(require 'vue-html-mode)
(setq mmm-submode-decoration-level 0)

;; Dired
(setq-default dired-dwim-target t)
(setq delete-by-moving-to-trash t)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; IComplete
(setq-default icomplete-in-buffer t)
(icomplete-mode 1)
(icomplete-vertical-mode 1)

;; Recentf
(recentf-mode 1)

;; Org Mode
;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

;; Org Babel
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((typescript . t)
   (js . t)
   (shell . t)))

;; Themes
(require 'modus-themes)
(require 'ef-themes)
(load-theme 'modus-vivendi-tinted t)

;; All The Icons
(when (display-graphic-p)
  (require 'all-the-icons))

(provide 'init)
;;; init.el ends here

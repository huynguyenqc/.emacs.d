(require 'package)
(dolist (source '(("melpa" . "https://melpa.org/packages/")))
  (add-to-list 'package-archives source t))

package-archives
(package-initialize)
;;; Make sure it's not empty (e.g. on first run).
(when (not package-archive-contents)
  (package-refresh-contents))
;;; Install `use-package'. Use it to install and configure other packages.
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(defun ublt/switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) t)))

(define-key global-map (kbd "C-c C-s") 'ielm)
(define-key global-map (kbd "s-k") 'ublt/switch-to-last-buffer)

(use-package highlight-symbol
  :ensure t)

(use-package company
  :ensure t
  :config (global-company-mode 1))

(use-package helm
  :config (helm-mode 1))
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(use-package helm-config)
(use-package swiper-helm
  :ensure t)
(global-set-key (kbd "C-f") 'swiper-helm)
(use-package helm-rg
  :ensure t)
(use-package rg
  :ensure t)
(use-package helm-projectile
  :ensure t)

(use-package magit
  :ensure t)

(require 'helm-command)
(define-key global-map (kbd "M-x") 'helm-M-x)

(use-package evil :ensure t)

(use-package elisp-slime-nav
  :ensure t)
(global-set-key (kbd "C-t") 'elisp-slime-nav-find-elisp-thing-at-point)

(use-package avy
  :ensure t
  :config (global-set-key (kbd "C-:") 'avy-goto-char)
  :custom (avy-keys (list
		     ?t ?n ;index
		     ?p ?l ;index
		     ?s ?e ;middle
		     ?f ?u ;middle
		     ?r ?i ;ring
		     ?w ?y ;ring
		     ?a ?o ;pinkies
)))

(global-set-key (kbd "C-x g") 'magit-status)

;;; --------------------------------------------------
;;; CURSOR MOVEMENTS

;; Single char cursor movement
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-e") 'previous-line)
(global-set-key (kbd "M-n") 'next-line)

;; Move by word
(global-set-key (kbd "M-l") 'backward-word)
(global-set-key (kbd "M-u") 'forward-word)

;; Move by paragraph
(global-set-key (kbd "M-L") 'backward-paragraph)
(global-set-key (kbd "M-U") 'forward-paragraph)
(global-set-key (kbd "s-g") 'goto-line)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; (use-package lsp-mode
;;  :ensure t
;;  :config
;;  (require 'lsp-clients)
;;  (add-hook 'python-mode-hook 'lsp))
;; (use-package company-lsp
;;   :ensure t)
;; (use-package lsp-ui
;;   :ensure t)

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-fixed-size nil)

(toggle-scroll-bar -1)
(global-set-key [f7] 'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode ielm-mode) . paredit-mode))

(use-package ggtags
  :ensure t)

;; Elixir mode
(use-package elixir-mode
  :ensure t)

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(global-set-key (kbd "C-o") (kbd "C-e C-m")) ; open and jump to new line
(global-set-key (kbd "<s-down>") (kbd "C-3 C-x ^")) ; enlarge window

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'duplicate-line)

(desktop-save-mode 1)

;; js mode
(use-package js2-mode
  :ensure t)
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
(setq js2-strict-missing-semi-warning nil)

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

(use-package helm)

(use-package magit
  :ensure t)

(require 'helm-command)
(define-key global-map (kbd "M-x") 'helm-M-x)

(use-package evil :ensure t)

(use-package avy
  :ensure t
  :config (global-set-key (kbd "C-:") 'avy-goto-char))

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

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;(use-package lsp-mode
;  :config
;  (require 'lsp-clients)
;  (add-hook 'python-mode-hook 'lsp))
;(use-package company-lsp)
;(use-package lsp-ui)

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(toggle-scroll-bar -1)
(global-set-key [f7] 'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


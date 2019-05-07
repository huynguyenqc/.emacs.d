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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(menu-bar-mode nil)
 '(nyan-mode t)
 '(nyan-wavy-trail nil)
 '(package-selected-packages
   (quote
    (multi-term grep-a-lot nyan-mode solarized-theme avy evil magit helm)))
 '(server-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))

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

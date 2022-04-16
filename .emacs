;;Config Or Something
;;i am dumb so this is just some stuff taken from internet and then edited
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.[<0;134;7M
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flycheck gruvbox-theme))
 '(standard-indent 1)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width) (setq ruby-indent-tabs-mode t)
(defvaralias 'ruby-indent-level 'tab-width) (defvaralias 'sgml-basic-offset 'tab-width)
(setq make-backup-files nil)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(column-number-mode 1)
 ;;idk what is this seriously
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(load-theme 'gruvbox-dark-hard t)
(global-prettify-symbols-mode 1)
(menu-bar-mode -1)
(add-hook 'after-init-hook #'global-flycheck-mode)
(mouse-wheel-mode t)
 ;;(menu-bar-mode -1) 
(global-set-key (kbd "M-o") (lambda () (interactive) (save-buffers-kill-terminal)))
(global-set-key (kbd "M-p") (lambda () (interactive) (menu-bar-mode)))
(set-face-attribute 'menu nil
                    :inverse-video nil
                    :background "#161616"
                    :foreground "white")

(face-spec-set 'mode-line
  '((((class color) (min-colors 88))
     ;;:box (:line-width -1 :style released-button)
     :background "#161616" :foreground "white")
    (t
     :inverse-video t)))

(face-spec-set 'mode-line-inactive
  '((default
     :inherit mode-line)
    (((class color) (min-colors 88) (background light))
     ;;:weight light
     ;;:box (:line-width -1 :color "#222222" :style nil)
     :foreground "#aaaaaa" :background "grey90")
    (((class color) (min-colors 88) (background dark))
      :background "#222222" :foreground "gray70" :box nil)))

(face-spec-set 'mode-line-highlight
  '((((class color) (min-colors 88))
    :foreground "red")
    (t
     :inherit highlight)))

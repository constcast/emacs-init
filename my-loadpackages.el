;;  ~/.emacs.d/my-loadpackages.el
;; loading package
(load "~/.emacs.d/my-packages.el")

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'aggressive-indent)
(global-aggressive-indent-mode 1)

(require 'color-theme)
(color-theme-initialize)

(require 'fill-column-indicator)
(setq fci-rule-width 80)
(setq fci-rule-color "red")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


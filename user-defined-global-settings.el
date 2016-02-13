;; don't show the startup splash screen
(setq inhibit-startup-message t)

;; disable auto save
(setq auto-save-default nil)

;; enable global syntax highlight by default
(setq global-font-lock-mode t)

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; color theme settings, either by package or manual selection
(setq color-theme-selection "blue 0")
(cond ((equal color-theme-selection "blue")
       (load-theme 'deeper-blue)
       )
      ((equal color-theme-selection "zenburn")
       (load-theme 'zenburn)
       )
      (t
       ;; set background and foreground colors
       (set-background-color "black")
       (set-foreground-color "white")
       ;; set background color for marked regions
       (set-face-background 'region "blue")
       (set-face-background 'highlight "blue")
       )
      )


;; enable the narrow command (if not set, there will be an annoying message
;; whenever the command is executed)
(put 'narrow-to-region 'disabled nil)

;;; Text mode and Auto Fill mode
;; The next three lines put Emacs into Text mode
;; and Auto Fill mode, and are for writers who
;; want to start writing prose rather than code.
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'text-mode-hook-identify)
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;(setq fill-column 79)

;; bind goto line to Meta-g
(global-set-key "\M-g" 'goto-line)

;; show ansi colors on M-x shell
(ansi-color-for-comint-mode-on)

;; don't create the filename~ backup files
(setq make-backup-files nil)

;; make sure that the highlighting for regions is activated
(setq transient-mark-mode t)

;; display all header-files in c++-mode, rather than in c-mode
(setq auto-mode-alist (cons '(".*\\.h$" . c++-mode)
			    auto-mode-alist))

;; set calender to european 
(setq calendar-week-start-day 1)
(setq european-calendar-style 't)

;; bind compile function to function key F5
(global-set-key (kbd "<f5>") 'compile-again)
(setq compilation-last-buffer nil)
(defun compile-again (pfx)
  """Run the same compile as the last time.

If there was no last time, or there is a prefix argument, this acts like
M-x compile.
"""
(interactive "p")
(if (and (eq pfx 1)
	 compilation-last-buffer)
    (progn
      (set-buffer compilation-last-buffer)
      (revert-buffer t t))
  (call-interactively 'compile)))

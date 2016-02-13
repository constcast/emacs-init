(setq compile-command "make")
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

;; *************************************************************

(global-set-key (kbd "C-c c") 'compile-again)
(global-set-key [(f5)] 'compile-again)

;; *************************************************************

;; Some code that will change the background color of the lines
;; that the compiler found errors on, should be in another color.

(require 'custom)
(defvar all-overlays ())
(defun delete-this-overlay(overlay is-after begin end &optional len)
  (delete-overlay overlay)
  )

(defun highlight-current-line()
  (interactive)
  (setq current-point (point))
  (beginning-of-line)
  (setq beg (point))
  (forward-line 1)
  (setq end (point))
  ;; Create and place the overlay
  (setq error-line-overlay (make-overlay 1 1))

  ;; Append to list of all overlays
  (setq all-overlays (cons error-line-overlay all-overlays))

  (overlay-put error-line-overlay
	       'face '(background-color . "blue"))
  (overlay-put error-line-overlay
	       'modification-hooks (list 'delete-this-overlay))
  (move-overlay error-line-overlay beg end)
  (goto-char current-point)
  )

(defun delete-all-overlays()
  (interactive)
  (while all-overlays
    (delete-overlay (car all-overlays))
    (setq all-overlays (cdr all-overlays))
    )
  )

(defun highlight-error-lines(compilation-buffer, process-result)
  (interactive)
  (delete-all-overlays)
  (condition-case nil
      (while t
	(next-error)
	(highlight-current-line)
	)
    (error nil))
  (first-error)
  )

(add-hook 'compilation-finish-functions 'highlight-error-lines)

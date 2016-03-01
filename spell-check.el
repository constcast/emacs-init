;;
(cond
 (
  (file-exists-p "/usr/local/bin/aspell")
  (setq ispell-program-name "/usr/local/bin/aspell")
  )
 (t
  (setq ispell-program-name "aspell")
  ))

;; alist leeren und für aspell /de_DE.UTF-8 richtig eingestellen:
(setq ispell-local-dictionary-alist nil)
;;(add-to-list 'ispell-local-dictionary-alist
;;'("deutsch8"
;;"[[:alpha:]]" "[^[:alpha:]]"
;;"[']" t
;;("-C" "-d" "deutsch")
;;"~latin1" iso-8859-1)
;;)

;;(setq ispell-dictionary "deutsch8")
;;(setq ispell-local-dictionary "deutsch8")
;;(setq ispell-default-dictionary "deutsch8")
;;(setq flyspell-default-dictionary "deutsch8")

(flyspell-mode 1)

;; ; setup ipython
;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(elpy-enable)

;; use ipython from specific path (e.g. when not in $PATH)
;; if it exists. otherwise assume that ipython is in $PATH
(cond
 (
  (file-exists-p "/usr/local/bin/ipython")
  (elpy-use-ipython "/usr/local/bin/ipython")
  )
 (t
  (elpy-use-ipython)
  ))

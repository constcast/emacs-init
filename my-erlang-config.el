; start erlang mode
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.7.2/emacs"
      load-path))
      (setq erlang-root-dir "/usr/local/lib/erlang")
      (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
      (require 'erlang-start)
(defvar inferior-erlang-prompt-timeout t)
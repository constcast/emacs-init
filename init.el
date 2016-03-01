;; extend EMACSPATH
(setenv "BREW_BIN" "/usr/local/bin/")
(setenv "BREW_SBIN" "/usr/local/sbin/")
(setenv "PATH" (concat (getenv "PATH") (getenv "BREW_BIN") (getenv "BREW_SBIN") ":/Users/braun/bin/:/usr/local/texlive/2014/bin/x86_64-darwin/:"))

;; common configurations 
(load "~/.emacs.d/my-loadpackages.el")
(load "~/.emacs.d/compilation.el")
(load "~/.emacs.d/cc-style.el")
(load "~/.emacs.d/user-defined-global-settings.el")
(load "~/.emacs.d/spell-check.el")
(load "~/.emacs.d/my-python-config.el")

;; (load "~/.emacs.d/my-erlang-config.el")

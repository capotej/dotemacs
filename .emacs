(setq load-path (cons "~/.emacs.d/" load-path))

(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)


(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

(defun reload-emacs ()
(interactive)
(load "~/.emacs"))

(require 'ruby-electric)

(defun my-ruby-mode-hook ()
(font-lock-mode t)
(setq standard-indent 2)
(ruby-electric-mode t)
(define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(defun ruby-eval-buffer () (interactive)
"Evaluate the buffer with ruby."
(shell-command-on-region (point-min) (point-max) "ruby"))

(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)

(global-set-key "\C-ck" 'mode-compile-kill)

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "rdiscount"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))


(require 'cursor-chg) 
(change-cursor-mode 0)  

(require 'ido)
(ido-mode t)

(custom-set-variables
 '(nxhtml-skip-welcome t))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(transient-mark-mode)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)

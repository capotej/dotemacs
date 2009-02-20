
(setq load-path (cons "~/.emacs.d/color-theme/" load-path))
(setq load-path (cons "~/.emacs.d/ruby-mode/" load-path))
(setq load-path (cons "~/.emacs.d/compile-mode/" load-path))
(setq load-path (cons "~/.emacs.d/markdown-mode/" load-path))


(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

(setq inhibit-splash-screen t)

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

(load "~/.emacs.d/haskell-mode-2.4/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(autoload 'markdown-mode "markdown-mode.el"
        "Major mode for editing Markdown files" t)
     (setq auto-mode-alist
        (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

     (defun markdown-custom ()
       "markdown-mode-hook"
       (setq markdown-command "rdiscount"))
     (add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))



(load "~/.emacs.d/cursor-chg.el")
(require 'cursor-chg) 
(change-cursor-mode 0)  


(setq load-path (append (list (expand-file-name "~/.emacs.d/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(load "~/.emacs.d/nxhtml/autostart.el")

(require 'ido)
(ido-mode t)

;(add-to-list 'load-path "~/.emacs.d/rinari")
;(require 'rinari)

(add-to-list 'load-path "~/.emacs.d/eieio")

(add-to-list 'load-path "~/.emacs.d/semantic")
(setq semantic-load-turn-everything-on t)
(require 'semantic-load)

(add-to-list 'load-path "~/.emacs.d/speedbar")
(add-to-list 'load-path "~/.emacs.d/ecb-snap")
(require 'ecb-autoloads)

(custom-set-variables
 '(ecb-auto-activate t)
 '(ecb-options-version "2.33beta2")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-tip-of-the-day nil)
 '(nxhtml-skip-welcome t))

;(ecb-activate)


(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet-bundle)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(transient-mark-mode)

(setq make-backup-files nil) ;; do not make backup files


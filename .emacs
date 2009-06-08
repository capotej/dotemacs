(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'yasnippet-bundle)
(add-to-list 'load-path "~/.emacs.d/scala")
(require 'scala-mode-auto)
(require 'dropdown-list)
(add-to-list 'load-path "~/.emacs.d/ruby-mode")
(add-to-list 'load-path "~/.emacs.d/rinari")
(load "~/.emacs.d/cursor-chg.el")

(add-to-list 'load-path "~/.emacs.d/egg")
(require 'egg)

(require 'rinari)

;(load "~/.emacs.d/nxhtml/autostart.el")
 ;    (setq
 ;     nxhtml-global-minor-mode t
 ;     mumamo-chunk-coloring 'submode-colored
 ;     nxhtml-skip-welcome t
 ;     indent-region-mode t
 ;     rng-nxml-auto-validate-flag nil
 ;     nxml-degraded t)
 ;    (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(global-set-key [f11] 'fullscreen)


(setq yas/text-popup-function
      #'yas/dropdown-list-popup-for-template)

(setq yas/window-system-popup-function
      #'yas/dropdown-list-popup-for-template)

(setq auto-save-default nil)
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
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(egg-git-command "/usr/bin/git")
 '(nxhtml-skip-welcome t)
 '(paren-match-face (quote paren-face-match-light))
 '(paren-sexp-mode t))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(transient-mark-mode)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :family "apple-monaco")))))
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)



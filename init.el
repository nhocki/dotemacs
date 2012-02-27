(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(setq make-backup-files nil)

(setq ns-command-modifier 'meta)
(setq ns-pop-up-frames nil)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Delete trailing whitespace before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(setq ns-alternate-modifier nil)

;; hide all the chrome.
(setq inhibit-startup-message t)
(setq user-mail-address "nhocki@gmail.com")
(setq user-full-name "Nicolas Hock Isaza")

(ido-mode t)
(blink-cursor-mode t)
(show-paren-mode 1)
(prefer-coding-system 'utf-8)
(line-number-mode 1)
(server-start)

(setq case-fold-search t
      search-highlight t
      query-replace-highlight t
      default-fill-column 100
      c-tab-always-indent "other"
      browse-url-browser-function 'browse-default-macosx-browser
      make-backup-files nil
      markdown-command "Markdown.pl | SmartyPants.pl"
      standard-indent 4
      css-indent-offset 2
      transient-mark-mode t
      visible-bell nil
      show-paren-delay 0
      ns-pop-up-frames nil)

;; nice parentheses
(setq-default show-trailing-whitespace t)


(setq search-highlight t)
(setq query-replace-highlight t)
(setq next-line-add-newlines nil)

(setq js-indent-level 2)
(setq css-indent-offset 2)


;; This should fix the clipboard
(setq x-select-enable-clipboard t)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key [(meta g)] 'goto-line)

;; Tabs replacement
(setq-default indent-tabs-mode nil)

;; Show the trailing whitespace
(setq-default show-trailing-whitespace t)
;; taken from http://schlotter.org/pub/dotemacs

(defun turn-off-show-trailing-whitespace ()
  "Turn on the highlighting of trailing whitespace in this buffer."
  (interactive)
  (setq show-trailing-whitespace nil))


(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f3] 'align-regexp)
(global-set-key [f4] 'sort-lines)
(global-set-key [f6] 'delete-trailing-whitespace)

(column-number-mode)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))


(add-to-list 'load-path "~/.emacs.d")

(let* ((files (directory-files "~/.emacs.d/vendor" t "[^\.+]")))
  (mapcar (lambda (d) (add-to-list 'load-path d)) files))

;; load everything else
(load "requires")
(load "bindings")
(load "personal")
(load "modes")
(load "hooks")
(load "rails")
(load "auto-insert")

(load-file "~/.emacs.d/vendor/twilight/twilight.el")
(color-theme-initialize)
(color-theme-twilight)

(setq toggle-mappings (toggle-style "rails"))


(add-hook 'term-mode-hook 'turn-off-show-trailing-whitespace)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(menu-bar-mode t)
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#00F94F"))
       ;; foreground color (yellow)


(global-set-key (kbd "C-c o") 'term-char-mode)
(global-set-key (kbd "C-c l") 'term-line-mode)


(defun my-shell (arg)
  (interactive "p")
  (let ((arg (or arg 1)))
    (shell (format "*sh%d*" arg))))


(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z 1") '(lambda () (interactive) (my-shell 1)))
(global-set-key (kbd "C-z 2") '(lambda () (interactive) (my-shell 2)))
(global-set-key (kbd "C-z 3") '(lambda () (interactive) (my-shell 3)))
(global-set-key (kbd "C-z 4") '(lambda () (interactive) (my-shell 4)))
(global-set-key (kbd "C-z 5") '(lambda () (interactive) (my-shell 5)))
(global-set-key (kbd "C-z 8") 'multi-term-next)

;; Colors
(load "color-theme")
(load "color-theme-autoloads")
(load "color-theme-library")

(load "color-theme-twilight")

;;Font
;; (set-default-font  "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")
;; (set-face-attribute 'default nil :height 140)

(set-default-font "-apple-inconsolata-medium-r-normal--0-0-0-0-m-0-iso10646-1")
(set-face-attribute 'default nil :height 220)


;;Yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))



(add-to-list 'completion-ignored-extensions ".rbc")

;; Textmate mode
(load "textmate")
(load "peepopen")
(textmate-mode)

(global-set-key (kbd "M-t") 'peepopen-goto-file-gui)
(global-set-key (kbd "C-t") 'textmate-goto-symbol)

;;js2-mode
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)

;; ;;coffee-script
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
(define-key coffee-mode-map [(meta R)] 'coffee-compile-region)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(require 'git)
(require 'git-blame)
;; thanks to https://twitter.com/#!/bbatsov/status/161812683837030400
(defun bbatsov-kill-buffers ()
  "Kill all buffers but the current one"
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (eql buffer (current-buffer))
      (kill-buffer buffer))))

(global-set-key (kbd "C-c k o") 'bbatsov-kill-buffers)


(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))



(require 'ruby-block)
(ruby-block-mode t)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

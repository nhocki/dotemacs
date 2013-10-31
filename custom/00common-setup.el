;; Disable backups
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq ns-command-modifier 'meta)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)

(setq ns-pop-up-frames nil)

;; delete trailing whitespace before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Command + Enter == full screen
(global-set-key (kbd "M-RET") 'fullscreen-mode-fullscreen-toggle)
(setq ns-alternate-modifier nil)

;; hide all the chrome.
(setq inhibit-startup-message t)
(setq user-mail-address "nhocki@gmail.com")
(setq user-full-name "Nicolas Hock Isaza")

;; Show the trailing whitespace
(setq-default show-trailing-whitespace t)
(column-number-mode)
(global-linum-mode t)

;; Load zenburn theme
(load-theme 'zenburn)

;; Load diff mode for git commit messages
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

;; Dash at point (https://github.com/stanaka/dash-at-point)
(global-set-key "\C-c\C-d" 'dash-at-point)

;; Highlight identation ( https://github.com/antonj/Highlight-Indentation-for-Emacs )
(highlight-indentation-mode)

;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1) 	 (rename-buffer new-name) 	 (set-visited-file-name new-name) 	 (set-buffer-modified-p nil)))))) ;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	 (if (string-match dir "\\(?:/\\|\\\\)$")
	 (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (progn 	(copy-file filename newname 1) 	(delete-file filename) 	(set-visited-file-name newname) 	(set-buffer-modified-p nil) 	t))))



;;
;; http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/

;; Set the starting position and width and height of Emacs Window
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 500))
(add-to-list 'default-frame-alist '(width . 500))

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;; Use windmove bindings
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

(set-frame-font "-apple-Fira_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(menu-bar-mode t)
;;(enable-theme 'solarized-dark)

;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(set-cursor-color "red")

(setq default-frame-alist
      '((cursor-color . "red")))

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

(global-visual-line-mode 1)

(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;(scroll-bar-mode nil)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f5] 'indent-region)
;; (global-set-key "\C-w" 'backward-kill-word)

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xt" 'select-frame-by-name)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-xy" 'revert-buffer)

;;some custom functions, stolen for internet
(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1))))
(defun geosoft-backward-word ()
 ;; Move one word backward. Leave the pointer at start of word
 ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word))
        (t (forward-char 1))))

(global-set-key [C-right] 'geosoft-forward-word)
(global-set-key [C-left] 'geosoft-backward-word)


(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq path-to-ctags "/usr/local/bin/ctags") ;; <- you're ctags path here

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
  )

(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory dotfiles-dir 0))


(define-key isearch-mode-map (kbd "C-o") ; occur easily inside isearch
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun colorize-compilation-buffer ()
  (interactive)
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

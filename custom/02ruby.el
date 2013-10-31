;; https://github.com/leemachin/dotfiles/blob/master/emacs.d/ruby.el
;; Somebody set us up the rbenv
(setq rbenv-installation-dir "~/.rbenv")
(require 'rbenv)
(global-rbenv-mode)

;; Gemfiles, Rakefiles, etc. are all Ruby
(add-to-list 'auto-mode-alist '("\\(Rake\\|Gem\\|Cap\\|Guard\\|Thor\\|Vagrant\\)file$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.\\(rb\\|gemspec\\|rake\\|ru\\|builder\\|thor\\)$" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)
;; for 1.8.7 stuff (for the time being)
;;(setq enh-ruby-program (concat (getenv "RBENV_ROOT") "/versions/1.9.3-p362/bin/ruby"))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))


;; https://gist.github.com/gnufied/7160799
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(require 'cl) ; If you don't have it already

(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(require 'compile)

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s -l %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c k") 'rspec-compile-file)
            ))

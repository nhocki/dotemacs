(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(require 'multiple-cursors)

(add-to-list 'load-path "~/.emacs.d/custom")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "d63e19a84fef5fa0341fa68814200749408ad4a321b6d9f30efc117aeaf68a2e" default)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(load "00common-setup")
(load "01autocomplete")
(load "02ruby")
(load "03smartparens")
(load "04projectile")
(load "05multiple-cursors")
(load "06javascript")
(load "07simp")

(require 'textmate)
(textmate-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

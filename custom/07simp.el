;; http://ck.kennt-wayne.de/2012/aug/find-project-file-with-fuzzy-matching-in-emacs
(require 'simp)

(simp-project-define
 '(:has (.git)
   :ignore (tmp coverage log vendor .git public/system public/assets)))

(global-set-key [(control p)] 'simp-project-find-file)

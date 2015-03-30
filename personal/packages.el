(prelude-require-package 'keymap-utils)

;; Rails Packages
(prelude-require-packages '(projectile-rails ruby-refactor))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'packages)

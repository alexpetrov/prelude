(prelude-require-package 'keymap-utils)

;; Rails Packages
(prelude-require-packages '(projectile-rails ruby-refactor robe))

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(add-hook 'ruby-mode-hook 'robe-mode)

(provide 'packages)

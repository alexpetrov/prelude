(prelude-require-packages '(chruby projectile-rails ruby-refactor robe))
;;(require 'chruby)
;;(chruby "2.1.3")

(require 'rbenv)
(global-rbenv-mode)
(rbenv-use-corresponding)

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(provide 'ruby-config)

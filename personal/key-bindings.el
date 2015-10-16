;;; key-bindings.el --- Personal key-bindings configuration file
;; Copyright (c) 2013 Alexander Petrov

;;; Commentary:

;; This file configures key-bindings

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(setq projectile-require-project-root nil)

(prelude-require-package 'magit-gitflow)

;; Globally change default font
(add-to-list 'default-frame-alist '(font . "PT Mono-11" ))
(set-frame-font "PT Mono-11" nil t)
;; (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)


;; Got this recipe from here
;;http://www.linux.org.ru/forum/general/9959057?lastmod=1387945045503#comment-9959379

(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
	(modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
	(let* ((to (car map))
	       (from (quail-get-translation
		      (cadr map) (char-to-string to) 1)))
	  (when (and (characterp from) (characterp to))
	    (dolist (mod modifiers)
	      (define-key local-function-key-map
		(vector (append mod (list from)))
		(vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(reverse-input-method 'russian-computer)

;; switch-buffer
(global-set-key (kbd "C-ч и") 'ido-switch-buffer)

;; switch-buffer
(global-set-key (kbd "C-ч C-и") 'ibuffer)

;; execute form-at-point
(global-set-key (kbd "C-ч C-у") 'eval-last-sexp)

;; undo
(global-set-key (kbd "C-ч г") 'undo-tree-visualize)

;; create bookmark
(global-set-key (kbd "C-ч к ь") 'bookmark-set)

;; list bookmarks
(global-set-key (kbd "C-ч к д") 'bookmark-bmenu-list)

;; ido-kill-buffer
(global-set-key (kbd "C-ч л") 'ido-kill-buffer)

;; other-window
(global-set-key (kbd "C-ч щ") 'other-window)


;; other-window
(global-set-key (kbd "C-ч щ") 'other-window)
;; other-window previous
(global-set-key (kbd "C-ч Щ") (lambda ()
                                (interactive)
                                (other-window -1)))

;; Set basic editing commands to russian letters
;; Go to the end of buffer
(global-set-key (kbd "M-ю") 'end-of-buffer)

;; Save-buffer
(global-set-key (kbd "C-ч C-ы") 'save-buffer)

;; Find file
(global-set-key (kbd "C-ч C-а") 'ido-find-file)

;; Forward-char
(global-set-key (kbd "C-а") 'forward-char)

;; Backward-char
(global-set-key (kbd "C-и") 'backward-char)

;; Next-line
(global-set-key (kbd "C-т") 'next-line)

;; Previous-line
(global-set-key (kbd "C-з") 'previous-line)

;; Forward-word
(global-set-key (kbd "M-а") 'forward-word)

;; Backward-word
(global-set-key (kbd "M-и") 'backward-word)

;; Goto begining
(global-set-key (kbd "C-ф") 'prelude-move-beginning-of-line)

;; Move to the end of line
(global-set-key (kbd "C-у") 'move-end-of-line)

;; Kill line
(global-set-key (kbd "C-л") 'kill-line)

;; Yank
(global-set-key (kbd "C-н") 'yank)

;; Kill-region
(global-set-key (kbd "C-ц") 'kill-region)

;; Kill-ring-save
(global-set-key (kbd "M-ц") 'kill-ring-save)

(defun gk-markdown-preview-buffer ()
  (interactive)
  (let* ((buf-this (buffer-name (current-buffer)))
         (buf-html (get-buffer-create
                    (format "*gk-md-html (%s)*" buf-this))))
    (markdown-other-window (buffer-name buf-html))
    (shr-render-buffer buf-html)
    (eww-mode)
    (kill-buffer buf-html)))

(global-set-key (kbd "C-c C-c p") 'gk-markdown-preview-buffer)
(global-set-key (kbd "C-с C-с з") 'gk-markdown-preview-buffer)

(provide 'key-bindings)

;;; key-bindings.el ends here

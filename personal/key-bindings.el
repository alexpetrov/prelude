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

(provide 'key-bindings)

;;; key-bindings.el ends here

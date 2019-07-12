;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-*/
;;; ;; Potato

;; Set gs SPC to target all visible windows with avy
(setq avy-all-windows t)

;; Set todo keywords
(add-hook! org-load
  (setq org-todo-keywords
        '((sequence "TODO(t)" "POTATO(n)" "WAIT(w@/!)" "|" "DONE(d)" "CANC(c)"))))

;; Define twine-mode syntax highlighting
(defvar twine-mode-hook nil)
(add-to-list 'auto-mode-alist '("\\.tw\\'" . twine-mode))

(defconst twine-font-lock-keywords
  (list
   '("^\\(::.+\\)" . font-lock-function-name-face) ; ::Passage
   '("\\(\\[\\(.+\\)\\]\\)" . font-lock-keyword-face) ; [[foo]]
   '("\\(<<.+>>\\)" . font-lock-builtin-face) ; <<bar>>
   '("/\\*\\(?:.\\|\n\\)*?\\*/\\|//\\(?:.\\|\n\\)*?$" . font-lock-comment-face)))

(defvar twine-dev-env "twee -t sugarcane")

(defun twine-mode ()
  (interactive)
  (kill-all-local-variables)
  (visual-line-mode)
  (set (make-local-variable 'font-lock-defaults) '(twine-font-lock-keywords))
  (setq major-mode 'twine-mode)
  (setq mode-name "twine")
  (setq comment-start "/*")
  (setq comment-end "*/")
  (run-hooks 'twine-mode-hook))

(provide 'twine-mode)

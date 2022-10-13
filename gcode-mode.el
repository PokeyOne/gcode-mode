(defvar gcode-mode-hook nil)

(defvar gcode-mode-map
  (let ((map (make-keymap)))
    ;; (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for gcode major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gcode\\'" . gcode-mode))

(defconst gcode-font-lock-keywords
  (list
   '("^\\w*\\([A-Z][0-9]+\\)\\>" . font-lock-builtin-face))
  "Minimal highlighting expressiong for GCODE mode")

(defvar gcode-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\; ". 124b" st)
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for gcode-mode")

(defun gcode-mode ()
  "Major mode for editing and viewing gcode files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table gcode-mode-syntax-table)
  (use-local-map gcode-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(gcode-font-lock-keywords))
  (setq major-mode 'gcode-mode)
  (setq mode-name "GCODE")
  (run-hooks 'gcode-mode-hook))

(provide 'gcode-mode)

(defvar gcode-mode-hook nil)

(defvar gcode-mode-map
  (let ((map (make-keymap)))
    ;; (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for gcode major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gcode\\'" . gcode-mode))

(defface gcode-g-command-face
  `((t (:foreground "#4f97d7")))
  "Face for Gnnn commands.")
(defvar gcode-g-command-face 'gcode-g-command-face
  "Variable for G command face")

(defface gcode-m-command-face
  `((t (:foreground "#67b11d")))
  "Face for Mnnn commands.")
(defvar gcode-m-command-face 'gcode-m-command-face
  "Variable for M command face")

(defface gcode-arg-command-face
  `((t (:inherit font-lock-constant-face
                 :weight bold
                 :slant italic
                 :height 0.9
                 :foreground "#b1951d")))
  "Face for arguments to a command, such as X2 in G1 X2")
(defvar gcode-arg-command-face 'gcode-arg-command-face
  "Variable for command arg face")

(defface gcode-xyz-arg-command-face
  `((t (:inherit font-lock-constant-face
                 :weight bold
                 :slant italic
                 :height 0.9)))
  "Face for arguments to a command, such as X2 in G1 X2")
(defvar gcode-xyz-arg-command-face 'gcode-xyz-arg-command-face
  "Variable for command XYZ arg face")

(defconst gcode-font-lock-keywords
  (list
   '("\s+\\([A-W]\\)" . gcode-arg-command-face)
   '("\s+\\([X-Z]\\)" . gcode-xyz-arg-command-face)
   '("^\\(M[0-9]+\\)\\>" . gcode-m-command-face)
   '("^\\(G[0-9]+\\)\\>" . gcode-g-command-face)
   '("^\\([A-FH-LN-Z][0-9]+\\)\\>" . font-lock-keyword-face)
   )
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

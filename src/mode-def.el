;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emmet minor mode

(defgroup emmet nil
  "Customization group for emmet-mode."
  :group 'convenience)

(defun emmet-expr-on-line ()
  "Extract a emmet expression and the corresponding bounds
   for the current line."
  (let* ((end (point))
         (start (emmet-find-left-bound))
         (line (buffer-substring-no-properties start end))
         (expr (emmet-regex "\\([ \t]*\\)\\([^\n]+\\)" line 2)))
    (if (first expr)
        (list (first expr) start end))))

(defun emmet-find-left-bound ()
  "Find the left bound of an emmet expr"
  (save-excursion (save-match-data
    (let ((char (char-before))
          (in-style-attr (looking-back "style=[\"'][^\"']*" nil))
          (syn-tab (make-syntax-table)))
      (modify-syntax-entry ?\\ "\\")
      (while char
        (cond ((and in-style-attr (member char '(?\" ?\')))
               (setq char nil))
              ((member char '(?\} ?\] ?\)))
               (with-syntax-table syn-tab
                 (backward-sexp) (setq char (char-before))))
              ((eq char ?\>)
               (if (looking-back "<[^>]+>" (line-beginning-position))
                   (setq char nil)
                 (progn (backward-char) (setq char (char-before)))))
              ((not (string-match-p "[[:space:]\n;]" (string char)))
               (backward-char) (setq char (char-before)))
              (t
               (setq char nil))))
      (point)))))

(defcustom emmet-indentation 4
  "Number of spaces used for indentation."
  :type '(number :tag "Spaces")
  :group 'emmet)

(defcustom emmet-indent-after-insert t
  "Indent region after insert?"
  :type 'boolean
  :group 'emmet)

(defcustom emmet-use-style-tag-and-attr-detection t
  "When true, enables detection of style tags and attributes in HTML
to provide proper CSS abbreviations completion."
  :type 'boolean
  :group 'emmet)

(defcustom emmet-self-closing-tag-style "/"
  "Self-closing tags style.

This determines how Emmet expands self-closing tags.

E.g., FOO is a self-closing tag.  When expanding \"FOO\":

When \" /\", the expansion is \"<FOO />\".
When \"/\", the expansion is \"<FOO/>\".
When \"\", the expansion is \"<FOO>\".

Default value is \"/\".

NOTE: only \" /\", \"/\" and \"\" are valid."
  :type '(choice (const :tag " />" " /")
                 (const :tag "/>" "/")
                 (const :tag ">" ""))
  :group 'emmet)

(defvar emmet-use-css-transform nil
  "When true, transform Emmet snippets into CSS, instead of the usual HTML.")
(make-variable-buffer-local 'emmet-use-css-transform)

(defvar emmet-use-sass-syntax nil
  "When true, uses Sass syntax for CSS abbreviations expanding,
e. g. without semicolons")
(make-variable-buffer-local 'emmet-use-sass-syntax)


(defvar emmet-css-major-modes
  '(css-mode
    scss-mode
    sass-mode
    less-mode
    less-css-mode)
  "Major modes that use emmet for CSS, rather than HTML.")

(defvar emmet-fallback-filter '("html")
  "Fallback filter for `emmet-default-filter', if none is found.")

(defvar emmet-file-filter nil
  "File local filter used by `emmet-default-filter'.")
(make-variable-buffer-local 'emmet-file-filter)

(defvar emmet-jsx-major-modes
  '(rjsx-mode
    typescript-tsx-mode))

(defun emmet-transform (input)
  (if (or (emmet-detect-style-tag-and-attr) emmet-use-css-transform)
      (emmet-css-transform input)
    (emmet-html-transform input)))

(defun emmet-detect-style-tag-and-attr ()
  (let* ((style-attr-end "[^=][\"']")
         (style-attr-begin "style=[\"']")
         (style-tag-end "</style>")
         (style-tag-begin "<style>"))
    (and emmet-use-style-tag-and-attr-detection
         (or
          (emmet-check-if-between style-attr-begin style-attr-end) ; style attr
          (emmet-check-if-between style-tag-begin style-tag-end))))) ; style tag

(defun emmet-check-if-between (begin end)
  (let ((begin-back (emmet-find "backward" begin))
        (end-back (emmet-find "backward" end))
        (begin-front (emmet-find "forward" begin))
        (end-front (emmet-find "forward" end)))
    (and begin-back end-front
         (or (not end-back) (> begin-back end-back))
         (or (not begin-front) (< end-front begin-front)))))

(defcustom emmet-preview-default nil
  "If non-nil then preview is the default action.
This determines how `emmet-expand-line' works by default."
  :type 'boolean
  :group 'emmet)

;;;###autoload
(defun emmet-expand-line (arg)
  "Replace the current line's emmet expression with the corresponding expansion.
If prefix ARG is given or region is visible call `emmet-preview' to start an
interactive preview.

Otherwise expand line directly.

For more information see `emmet-mode'."
  (interactive "P")
  (let* ((here (point))
         (preview (if emmet-preview-default (not arg) arg))
         (beg (if preview
                  (emmet-find-left-bound)
                (when (use-region-p) (region-beginning))))
         (end (if preview
                  here
                (when (use-region-p) (region-end)))))
    (if (and preview beg)
        (progn
          (goto-char here)
          (emmet-preview beg end))
      (let ((expr (emmet-expr-on-line)))
        (if expr
            (let ((markup (emmet-transform (first expr))))
              (when markup
                (delete-region (second expr) (third expr))
                (emmet-insert-and-flash markup)
                (emmet-reposition-cursor expr))))))))

(defvar emmet-mode-keymap
  (let
      ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'emmet-expand-line)
    (define-key map (kbd "<C-return>") 'emmet-expand-line)
    (define-key map (kbd "<C-M-right>") 'emmet-next-edit-point)
    (define-key map (kbd "<C-M-left>") 'emmet-prev-edit-point)
    (define-key map (kbd "C-c C-c w") 'emmet-wrap-with-markup)
    map)
  "Keymap for emmet minor mode.")

(defun emmet-after-hook ()
  "Initialize Emmet's buffer-local variables."
  (if (memq major-mode emmet-css-major-modes)
      (setq emmet-use-css-transform t))
  (if (eq major-mode 'sass-mode)
      (setq emmet-use-sass-syntax t)))

;;;###autoload
(define-minor-mode emmet-mode
  "Minor mode for writing HTML and CSS markup.
With emmet for HTML and CSS you can write a line like

  ul#name>li.item*2

and have it expanded to

  <ul id=\"name\">
    <li class=\"item\"></li>
    <li class=\"item\"></li>
  </ul>

This minor mode defines keys for quick access:

\\{emmet-mode-keymap}

Home page URL `http://www.emacswiki.org/emacs/Emmet'.

See also `emmet-expand-line'."
  :lighter (" Emmet" (:eval (if emmet-preview-mode "[P]" "")))
  :keymap emmet-mode-keymap
  :after-hook (emmet-after-hook))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emmet yasnippet integration

(defun emmet-transform-yas (input)
  (let* ((leaf-count 0)
         (emmet-leaf-function
          (lambda ()
            (format "$%d" (incf leaf-count)))))
    (emmet-transform input)))

;;;###autoload
(defun emmet-expand-yas ()
  (interactive)
  (let ((expr (emmet-expr-on-line)))
    (if expr
        (let* ((markup (emmet-transform-yas (first expr)))
               (filled (replace-regexp-in-string "><" ">\n<" markup)))
          (delete-region (second expr) (third expr))
          (insert filled)
          (indent-region (second expr) (point))
          (if (fboundp 'yas/expand-snippet)
              (yas/expand-snippet
               (buffer-substring (second expr) (point))
               (second expr) (point)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Real-time preview
;;

;;;;;;;;;;
;; Lennart's version

(defvar emmet-preview-input nil)
(make-local-variable 'emmet-preview-input)
(defvar emmet-preview-output nil)
(make-local-variable 'emmet-preview-output)
(defvar emmet-old-show-paren nil)
(make-local-variable 'emmet-old-show-paren)

(defface emmet-preview-input
  '((default :box t :inherit secondary-selection))
  "Face for preview input field."
  :group 'emmet)

(defface emmet-preview-output
  '((default :inherit highlight))
  "Face for preview output field."
  :group 'emmet)

(defvar emmet-preview-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "RET") 'emmet-preview-accept)
    (define-key map (kbd "<return>") 'emmet-preview-accept)
    (define-key map [(control ?g)] 'emmet-preview-abort)
    map))

(defun emmet-html-text-p (markup)
  (string-match "^[\s|\t|\n|\r]*<.*$" markup))

(defun emmet-preview-accept ()
  (interactive)
  (let ((ovli emmet-preview-input)
        (expr (emmet-expr-on-line)))
    (if (not (and (overlayp ovli)
                  (bufferp (overlay-buffer ovli))))
        (message "Preview is not active")
      (let* ((indent (current-indentation))
             (markup (emmet-preview-transformed indent)))
        (when markup
          (delete-region (overlay-start ovli) (overlay-end ovli))
          (emmet-insert-and-flash markup)
          (emmet-reposition-cursor expr)))))
  (emmet-preview-abort))

(defun emmet-html-next-insert-point (str)
  (with-temp-buffer
    (insert str)
    (goto-char (point-min))
    (or
     (emmet-aif (emmet-go-to-edit-point 1 t) (- it 1)) ; try to find an edit point
     (emmet-aif (re-search-forward ".+</" nil t) (- it 3))   ; try to place cursor after tag contents
     (length str))))                             ; ok, just go to the end

(defun emmet-css-next-insert-point (str)
  (let ((regexp (if emmet-use-sass-syntax ": *\\($\\)" ": *\\(;\\)$")))
    (save-match-data
      (set-match-data nil t)
      (string-match regexp str)
      (or (match-beginning 1) (length str)))))

(defvar emmet-flash-ovl nil)
(make-variable-buffer-local 'emmet-flash-ovl)

(defun emmet-remove-flash-ovl (buf)
  (with-current-buffer buf
    (when (overlayp emmet-flash-ovl)
      (delete-overlay emmet-flash-ovl))
    (setq emmet-flash-ovl nil)))

(defcustom emmet-insert-flash-time 0.5
  "Time to flash insertion.
Set this to a negative number if you do not want flashing the
expansion after insertion."
  :type '(number :tag "Seconds")
  :group 'emmet)

(defcustom emmet-move-cursor-after-expanding t
  "If non-nil the the cursor position is
moved to before the first closing tag when the exp was expanded."
  :type 'boolean
  :group 'emmet)

(defcustom emmet-move-cursor-between-quotes nil
  "If emmet-move-cursor-after-expands is non-nil and this is non-nil then
cursor position will be moved to after the first quote."
  :type 'boolean
  :group 'emmet)

(defun emmet-reposition-cursor (expr)
  (let ((output-markup (buffer-substring-no-properties (second expr) (point))))
    (when emmet-move-cursor-after-expanding
      (let ((p (point))
            (new-pos (if (emmet-html-text-p output-markup)
                         (emmet-html-next-insert-point output-markup)
                       (emmet-css-next-insert-point output-markup))))
        (goto-char
         (+ (- p (length output-markup))
            new-pos))))))

(defun emmet-insert-and-flash (markup)
  (emmet-remove-flash-ovl (current-buffer))
  (let ((here (point)))
    (insert markup)
    (when emmet-indent-after-insert
      (indent-region here (point))
      (setq here
            (save-excursion
              (goto-char here)
              (skip-chars-forward "[:space:]")
              (point))))
    (setq emmet-flash-ovl (make-overlay here (point)))
    (overlay-put emmet-flash-ovl 'face 'emmet-preview-output)
    (when (< 0 emmet-insert-flash-time)
      (run-with-idle-timer emmet-insert-flash-time
                           nil 'emmet-remove-flash-ovl (current-buffer)))))

;;;###autoload
(defun emmet-preview (beg end)
  "Expand emmet between BEG and END interactively.
This will show a preview of the expanded emmet code and you can
accept it or skip it."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (emmet-preview-abort)
  (if (not beg)
      (message "Region not active")
    (setq emmet-old-show-paren show-paren-mode)
    (show-paren-mode -1)
    (let ((here (point)))
      (goto-char beg)
      (forward-line 1)
      (unless (= 0 (current-column))
        (insert "\n"))
      (let* ((opos (point))
             (ovli (make-overlay beg end nil nil t))
             (ovlo (make-overlay opos opos))
             (info (propertize " Emmet preview. Choose with RET. Cancel by stepping out. \n"
                               'face 'tooltip)))
        (overlay-put ovli 'face 'emmet-preview-input)
        (overlay-put ovli 'keymap emmet-preview-keymap)
        (overlay-put ovlo 'face 'emmet-preview-output)
        (overlay-put ovlo 'before-string info)
        (setq emmet-preview-input  ovli)
        (setq emmet-preview-output ovlo)
        (add-hook 'before-change-functions 'emmet-preview-before-change t t)
        (goto-char here)
        (add-hook 'post-command-hook 'emmet-preview-post-command t t)))))

(defun emmet-preview-online ()
  "Display `emmet-preview' on the fly as the user types.

To use this, add the function as a local hook:

  (add-hook 'post-self-insert-hook 'emmet-preview-online t t)

or enable `emmet-preview-mode'."
  (ignore-errors
    (let* ((expr (emmet-expr-on-line))
           (text (nth 0 expr))
           (beg (nth 1 expr))
           (end (nth 2 expr)))
      (let ((wap (word-at-point)))
        (when (and (not (equal wap text))
                   (emmet-transform text))
          (emmet-preview beg end))))))

(define-minor-mode emmet-preview-mode
  "When enabled, automatically show `emmet-preview' as the user types.

See `emmet-preview-online'."
  :init-value nil
  :group 'emmet
  (if emmet-preview-mode
      (add-hook 'post-self-insert-hook 'emmet-preview-online :append :local)
    (remove-hook 'post-self-insert-hook 'emmet-preview-online :local)))

(defvar emmet-preview-pending-abort nil)
(make-variable-buffer-local 'emmet-preview-pending-abort)

(defun emmet-preview-before-change (beg end)
  (when
      (or (> beg (overlay-end emmet-preview-input))
          (< beg (overlay-start emmet-preview-input))
          (> end (overlay-end emmet-preview-input))
          (< end (overlay-start emmet-preview-input)))
    (setq emmet-preview-pending-abort t)))

(defun emmet-preview-abort ()
  "Abort emmet code preview."
  (interactive)
  (setq emmet-preview-pending-abort nil)
  (remove-hook 'before-change-functions 'emmet-preview-before-change t)
  (when (overlayp emmet-preview-input)
    (delete-overlay emmet-preview-input))
  (setq emmet-preview-input nil)
  (when (overlayp emmet-preview-output)
    (delete-overlay emmet-preview-output))
  (setq emmet-preview-output nil)
  (remove-hook 'post-command-hook 'emmet-preview-post-command t)
  (when emmet-old-show-paren (show-paren-mode 1)))

(defun emmet-preview-post-command ()
  (condition-case err
      (emmet-preview-post-command-1)
    (error (message "emmet-preview-post: %s" err))))

(defun emmet-preview-post-command-1 ()
  (if (and (not emmet-preview-pending-abort)
           (<= (point) (overlay-end emmet-preview-input))
           (>= (point) (overlay-start emmet-preview-input)))
      (emmet-update-preview (current-indentation))
    (emmet-preview-abort)))

(defun emmet-preview-transformed (indent)
  (let* ((string (buffer-substring-no-properties
		  (overlay-start emmet-preview-input)
		  (overlay-end emmet-preview-input))))
    (let ((output (emmet-transform string)))
      (when output
        output))))

(defun emmet-update-preview (indent)
  (let* ((pretty (emmet-preview-transformed indent))
         (show (when pretty
                 (propertize pretty 'face 'highlight))))
    (when show
      (overlay-put emmet-preview-output 'after-string
                   (concat show "\n")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Implementation of "Go to Edit Point" functionality ;;
;; http://docs.emmet.io/actions/go-to-edit-point/     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun emmet-go-to-edit-point (count &optional only-before-closed-tag)
  (let*
      ((between-tags
        (if only-before-closed-tag "\\(><\\)/" "\\(><\\)"))
       (indented-line "\\(^[[:blank:]]+$\\)")
       (between-quotes
        (if emmet-move-cursor-between-quotes "\\(=\\(\"\\|'\\)\\{2\\}\\)" nil))
       (whole-regex
        (mapconcat 'identity
                   (delq nil
                         (list between-tags indented-line between-quotes))
                   "\\|"))
       (edit-point (format "\\(%s\\)" whole-regex)))
    (if (> count 0)
	(progn
	  (forward-char)
	  (let
	      ((search-result (re-search-forward edit-point nil t count)))
	    (if search-result
		(progn
		  (cond
		   ((match-string 2) (goto-char (- (match-end 2) 1)))
		   ((match-string 3) (end-of-line))
                   ((match-string 4) (backward-char)))
		  (point))
		(backward-char))))
      (progn
	(backward-char)
	(let
	    ((search-result (re-search-backward edit-point nil t (- count))))
	  (if search-result
	      (progn
		(cond
		 ((match-string 2) (goto-char (- (match-end 2) 1)))
		 ((match-string 3) (end-of-line))
		 ((match-string 4) (forward-char 2)))
		(point))
	      (forward-char)))))))

(defcustom emmet-postwrap-goto-edit-point nil
  "Goto first edit point after wrapping markup?"
  :type 'boolean
  :group 'emmet)

;;;###autoload
(defun emmet-wrap-with-markup (wrap-with)
  "Wrap region with markup."
  (interactive "sExpression to wrap with: ")
  (let* ((multi (string-match "\\*$" wrap-with))
         (txt (buffer-substring-no-properties (region-beginning) (region-end)))
         (to-wrap (if multi
                      (split-string txt "\n")
                    (list txt)))
         (initial-elements (replace-regexp-in-string
                            "\\(.*\\(\\+\\|>\\)\\)?[^>*]+\\*?[[:digit:]]*$"
                            "\\1" wrap-with t))
         (terminal-element (replace-regexp-in-string
                            "\\(.*>\\)?\\([^>*]+\\)\\(\\*[[:digit:]]+$\\)?\\*?$"
                            "\\2" wrap-with t))
         (multiplier-expr (replace-regexp-in-string
                           "\\(.*>\\)?\\([^>*]+\\)\\(\\*[[:digit:]]+$\\)?\\*?$"
                           "\\3" wrap-with t))
         (expr (concat
                initial-elements
                (mapconcat (lambda (el)
                             (concat terminal-element
                                     "{!!!"
                                     (secure-hash 'sha1 el)
                                     "!!!}"
                                     multiplier-expr))
                           to-wrap
                           "+")))
         (markup
          (reduce
           (lambda (result text)
             (replace-regexp-in-string
              (concat "!!!" (secure-hash 'sha1 text) "!!!")
              text
              result t t))
           to-wrap
           :initial-value (emmet-transform expr))))
    (when markup
      (delete-region (region-beginning) (region-end))
      (insert markup)
      (indent-region (region-beginning) (region-end))
      (if emmet-postwrap-goto-edit-point
          (let ((end (region-end)))
            (goto-char (region-beginning))
            (unless (ignore-errors (progn (emmet-next-edit-point 1) t))
              (goto-char end)))
        ))))

;;;###autoload
(defun emmet-next-edit-point (count)
  (interactive "^p")
  (unless (or emmet-use-css-transform (emmet-go-to-edit-point count))
    (error "Last edit point reached.")))

;;;###autoload
(defun emmet-prev-edit-point (count)
  (interactive "^p")
  (unless (or emmet-use-css-transform (emmet-go-to-edit-point (- count)))
    (error "First edit point reached.")))

(provide 'emmet-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defconst emmet-mode:version "1.0.10")

(with-no-warnings
  (require 'cl))

;; for portability with < 24.3 EMACS
(unless (fboundp 'cl-labels) (fset 'cl-labels 'labels))
(unless (fboundp 'cl-flet)   (fset 'cl-flet   'flet))
;; < 22.1
(unless (fboundp 'string-to-number) (fset 'string-to-number 'string-to-int))

(defmacro emmet-defparameter (symbol &optional initvalue docstring)
  `(progn
     (defvar ,symbol nil ,docstring)
     (setq   ,symbol ,initvalue)))

(defun emmet-join-string (lis joiner)
  (mapconcat 'identity lis joiner))

(defun emmet-get-keys-of-hash (hash)
  (let ((ks nil))
    (maphash #'(lambda (k v) (setq ks (cons k ks))) hash)
    ks))

(defun emmet-get-vals-of-hash (hash)
  (let ((vs nil))
    (maphash #'(lambda (k v) (setq vs (cons v vs))) hash)
    vs))

(defun emmet-jsx-prop-value-var? (prop-value)
  (string-match "{.+}" prop-value))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generic parsing macros and utilities

(defmacro emmet-aif (test-form then-form &rest else-forms)
  "Anaphoric if. Temporary variable `it' is the result of test-form."
  `(let ((it ,test-form))
     (if it ,then-form ,@(or else-forms '(it)))))

(defmacro emmet-pif (test-form then-form &rest else-forms)
  "Parser anaphoric if. Temporary variable `it' is the result of test-form."
  `(let ((it ,test-form))
     (if (not (eq 'error (car it))) ,then-form ,@(or else-forms '(it)))))

(defmacro emmet-parse (regex nums label &rest body)
  "Parse according to a regex and update the `input' variable."
  `(emmet-aif (emmet-regex ,regex input ',(number-sequence 0 nums))
                  (let ((input (elt it ,nums)))
                    ,@body)
                  `,`(error ,(concat "expected " ,label))))

(defmacro emmet-run (parser then-form &rest else-forms)
  "Run a parser and update the input properly, extract the parsed
   expression."
  `(emmet-pif (,parser input)
                  (let ((input (cdr it))
                        (expr (car it)))
                    ,then-form)
                  ,@(or else-forms '(it))))

(defmacro emmet-por (parser1 parser2 then-form &rest else-forms)
  "OR two parsers. Try one parser, if it fails try the next."
  `(emmet-pif (,parser1 input)
                  (let ((input (cdr it))
                        (expr (car it)))
                    ,then-form)
                  (emmet-pif (,parser2 input)
                                 (let ((input (cdr it))
                                       (expr (car it)))
                                   ,then-form)
                                 ,@else-forms)))

(defmacro emmet-find (direction regexp &optional limit-of-search repeat-count)
  "Regexp-search in given direction, returning the position (or nil)
and leaving the point in place."
  `(save-excursion
     (if (,(intern (concat "re-search-" direction))
          ,regexp ,limit-of-search t ,repeat-count)
         (match-beginning 0))))

(defun emmet-regex (regexp string refs)
  "Return a list of (`ref') matches for a `regex' on a `string' or nil."
  (if (string-match (concat "^" regexp "\\([^\n]*\\)$") string)
      (mapcar (lambda (ref) (match-string ref string))
              (if (sequencep refs) refs (list refs)))
    nil))

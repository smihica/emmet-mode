;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; CSS abbrev:

(emmet-defparameter
 emmet-css-unit-aliases
 (gethash "unitAliases" (gethash "css" emmet-preferences)))
(defun emmet-css-arg-number (input)
  (emmet-parse
   " *\\(\\(?:-\\|\\)[0-9.]+\\)\\(-\\|[A-Za-z]*\\)" 3 "css number arguments"
   (cons (list (elt it 1)
               (let ((unit (elt it 2)))
                 (if (= (length unit) 0)
                     (if (find ?. (elt it 1)) "em" "px")
                   (gethash unit emmet-css-unit-aliases unit))))
         input)))

(emmet-defparameter
 emmet-css-color-shorten-if-possible
 (gethash "shortenIfPossible" (gethash "color" (gethash "css" emmet-preferences))))
(emmet-defparameter
 emmet-css-color-case
 (gethash "case" (gethash "color" (gethash "css" emmet-preferences))))
(emmet-defparameter
 emmet-css-color-trailing-aliases
 (gethash "trailingAliases" (gethash "color" (gethash "css" emmet-preferences))))
(defun emmet-css-arg-color (input)
  (emmet-parse
   (concat " *#\\([0-9a-fA-F]\\{1,6\\}\\)\\(rgb\\|\\)\\(["
           (emmet-join-string
            (emmet-get-keys-of-hash emmet-css-color-trailing-aliases) "")
           "]\\|\\)")
   4 "css color argument"
   (let ((color
          (let* ((n (elt it 1))
                (l (length n)))
            (substring
             (cond ((= l 1) (concat (make-list 6 (string-to-char n))))
                   ((= l 2) (concat n n n))
                   ((= l 3) (concat
                             (loop for c in (string-to-list n)
                                   append (list c c))))
                   (t (concat n n)))
             0 6))))
     (cons
      (let ((rgb-mode (string= (elt it 2) "rgb")))
        (if rgb-mode
            (format "rgb(%d,%d,%d)"
                    (string-to-number (substring color 0 2) 16)
                    (string-to-number (substring color 2 4) 16)
                    (string-to-number (substring color 4 6) 16))
          (concat
           "#"
           (let ((filter (cond ((string= emmet-css-color-case "auto") #'identity)
                               ((string= emmet-css-color-case "up")   #'upcase)
                               (t                                         #'downcase))))
             (funcall
              filter
              (if (and emmet-css-color-shorten-if-possible
                       (eql (aref color 0) (aref color 1))
                       (eql (aref color 2) (aref color 3))
                       (eql (aref color 4) (aref color 5)))
                  (concat (mapcar #'(lambda (i) (aref color i)) '(0 2 4)))
                color))))))
      (if (< 0 (length (elt it 3)))
          (cons (gethash (elt it 3) emmet-css-color-trailing-aliases) input)
        input)))))

(defun emmet-css-arg-something (input)
  (emmet-parse
   " *\\([^ ]+\\)" 2 "css argument"
   (cons (elt it 1) input)))

(defun emmet-css-parse-arg (input)
  (emmet-run emmet-css-arg-number it
                 (emmet-run emmet-css-arg-color it
                                (emmet-run emmet-css-arg-something it
                                               (if (equal input "")
                                                   it
                                                 (cons input ""))))))

(defun emmet-css-important-p (input)
  (let ((len (length input)))
    (and (< 0 len)
         (char-equal (aref input (1- len)) ?!))))

(defun emmet-css-parse-args (args)
  (when args
    (let ((rt nil))
      (loop
       (emmet-pif
        (emmet-css-parse-arg args)
        (loop for i on it do (push (car i) rt)
              while (consp (cdr i))
              finally (setq args (cdr i)))
        (return (nreverse rt)))))))

(defun emmet-css-split-args (exp)
  (emmet-aif
   (string-match "\\(?:[ #0-9$]\\|-[0-9]\\)" exp)
   (list (substring exp 0 it) (substring exp it))
   (list exp nil)))

(defun emmet-css-split-vendor-prefixes (input)
  (emmet-parse
   "\\(-[wmso]+-\\|-\\|\\)\\(.*\\)" 3 "css vendor prefixes"
   (list (elt it 2)
         (let ((vp (elt it 1)))
           (if (not (string= vp ""))
               (if (string= vp "-") 'auto
                 (string-to-list (subseq vp 1 -1))))))))

(defun emmet-css-subexpr (exp)
  (let* ((importantp (emmet-css-important-p exp)))
    (destructuring-bind (exp vp)
        (emmet-css-split-vendor-prefixes exp)
      (destructuring-bind (key args)
          (emmet-css-split-args (if importantp (subseq exp 0 -1) exp))
        `(,key ,vp
               ,importantp
               ,@(emmet-css-parse-args args))))))

(defun emmet-css-toknize (str)
  (let* ((i (split-string str "+"))
         (rt nil))
    (loop
     (let ((f (first i))
           (s (second i)))
       (if f
           (if (and s (or (string= s "")
                          (string-match "^\\(?:[ #0-9$]\\|-[0-9]\\)" s)))
               (progn
                 (setf rt (cons (concat f "+" s) rt))
                 (setf i (cddr i)))
             (progn
               (setf rt (cons f rt))
               (setf i (cdr i))))
         (return (nreverse rt)))))))

(defun emmet-css-expr (input)
  (mapcar #'emmet-css-subexpr
          (emmet-css-toknize input)))

(emmet-defparameter
 emmet-css-snippets
 (gethash "snippets" (gethash "css" emmet-snippets)))

(emmet-defparameter
 emmet-sass-snippets
 (gethash "snippets" (gethash "sass" emmet-snippets)))

(emmet-defparameter
 emmet-css-unitless-properties
 (gethash "unitlessProperties" (gethash "css" emmet-preferences)))

(emmet-defparameter
 emmet-css-unitless-properties-regex
 (concat "^\\(:?" (emmet-join-string
                   emmet-css-unitless-properties "\\|")
         "\\):.*$"))

(defun emmet-css-instantiate-lambda (str)
  (cl-flet ((insert-space-between-name-and-body
          (str)
          (if (string-match "^\\([a-z-]+:\\)\\(.+\\)$" str)
              (emmet-join-string
               (mapcar (lambda (ref) (match-string ref str)) '(1 2)) " ")
            str))
         (split-string-to-body
          (str args-sym)
          (let ((rt '(concat)) (idx-max 0))
            (loop for i from 0 to 255 do
                  (emmet-aif
                   (string-match "\\(?:|\\|${\\(?:\\([0-9]\\)\\|\\)\\(?::\\(.+?\\)\\|\\)}\\)" str)
                   (destructuring-bind (mat idx def)
                       (mapcar (lambda (ref) (match-string ref str)) '(0 1 2))
                     (setf rt
                           `((or
                              (nth ,(let ((cur-idx (if idx (1- (string-to-number idx)) i)))
                                      (setf idx-max (max cur-idx idx-max)))
                                   ,args-sym)
                              ,(or def ""))
                             ,(substring str 0 it) ;; ordered to reverse
                             ,@rt))
                     (setf str (substring str (+ it (length mat)))))
                   ;; don't use nreverse. cause bug in emacs-lisp.
                   (return (cons idx-max (reverse (cons str rt)))))))))
    (let ((args (gensym))
          (str  (insert-space-between-name-and-body str)))
      (destructuring-bind (idx-max . body) (split-string-to-body str args)
        (eval
         `(lambda (&rest ,args)
            (progn
              (when (nthcdr ,idx-max ,args)
                (setf (nthcdr ,idx-max ,args)
                      (list (emmet-join-string
                             (nthcdr ,idx-max ,args) " "))))
              ,body)))))))

(emmet-defparameter
 emmet-vendor-prefixes-properties
 (gethash "vendorPrefixesProperties" (gethash "css" emmet-preferences)))
(emmet-defparameter
 emmet-vendor-prefixes-default
 (list "webkit" "moz" "ms" "o"))
(defun emmet-css-transform-vendor-prefixes (line vp)
  (let ((key (subseq line 0 (or (position ?: line) (length line)))))
    (let ((vps (if (eql vp 'auto)
                   (gethash key
                            emmet-vendor-prefixes-properties
                            emmet-vendor-prefixes-default)
                 (mapcar (lambda (v)
                           (cond ((= v ?w) "webkit")
                                 ((= v ?m) "moz")
                                 ((= v ?s) "ms")
                                 ((= v ?o) "o")))
                         vp))))
      (emmet-join-string
       (append (mapcar (lambda (v) (concat "-" v "-" line)) vps)
               (list line))
       "\n"))))

(defun emmet-css-transform-exprs (exprs)
  (emmet-join-string
   (mapcar
    #'(lambda (expr)
        (let*
	    ((hash-map (if emmet-use-sass-syntax emmet-sass-snippets emmet-css-snippets))
	     (basement
	      (emmet-aif
	       (or (gethash (car expr) hash-map) (gethash (car expr) emmet-css-snippets))
	       (let ((set it) (fn nil) (unitlessp nil))
		 (if (stringp set)
		     (progn
		       ;; new pattern
		       ;; creating print function
		       (setf fn (emmet-css-instantiate-lambda set))
		       ;; get unitless or no
		       (setf unitlessp
			     (not (null (string-match
					 emmet-css-unitless-properties-regex set))))
		       ;; caching
		       (puthash (car expr) (cons fn unitlessp) hash-map))
		   (progn
		     ;; cache hit.
		     (setf fn (car set))
		     (setf unitlessp (cdr set))))
		 (apply fn
			(mapcar
			 #'(lambda (arg)
			     (if (listp arg)
				 (if unitlessp (car arg)
				   (apply #'concat arg))
			       arg))
			 (cdddr expr))))
	       (concat (car expr) ": "
		       (emmet-join-string
			(mapcar #'(lambda (arg)
				    (if (listp arg) (apply #'concat arg) arg))
				(cdddr expr)) " ")
		       ";"))))
          (let ((line
                 (if (caddr expr)
                     (concat (subseq basement 0 -1) " !important;")
                   basement)))
	    ;; remove trailing semicolon while editing Sass files
	    (if (and emmet-use-sass-syntax (equal ";" (subseq line -1)))
		(setq line (subseq line 0 -1)))
            (emmet-aif
             (cadr expr)
             (emmet-css-transform-vendor-prefixes line it)
             line))))
    exprs)
   "\n"))

(defun emmet-css-transform (input)
  (emmet-css-transform-exprs (emmet-css-expr input)))

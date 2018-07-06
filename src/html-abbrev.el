;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; XML abbrev

(emmet-defparameter
 emmet-tag-aliases-table
 (gethash "aliases" (gethash "html" emmet-snippets)))

(defun emmet-expr (input)
  "Parse a zen coding expression with optional filters."
  (emmet-pif (emmet-parse "\\(.*?\\)|" 2 "expr|filter" it)
                 (let ((input (elt it 1))
                       (filters (elt it 2)))
                   (emmet-pif (emmet-extract-filters filters)
                                  (emmet-filter input it)
                                  it))
                 (emmet-filter input (emmet-default-filter))))

(defun emmet-subexpr (input)
  "Parse a zen coding expression with no filter. This pretty much defines precedence."
  (emmet-run emmet-siblings
                 it
                 (emmet-run emmet-parent-child
                                it
                                (emmet-run emmet-multiplier
                                               it
                                               (emmet-run emmet-pexpr
                                                              it
                                                              (emmet-run emmet-text
                                                                             it
                                                                             (emmet-run emmet-tag
                                                                                            it
                                                                                            '(error "no match, expecting ( or a-zA-Z0-9"))))))))

(defun emmet-extract-filters (input)
  "Extract filters from expression."
  (emmet-pif (emmet-parse "\\([^\\|]+?\\)|" 2 "" it)
                 (let ((filter-name (elt it 1))
                       (more-filters (elt it 2)))
                   (emmet-pif (emmet-extract-filters more-filters)
                                  (cons filter-name it)
                                  it))
                 (emmet-parse "\\([^\\|]+\\)" 1 "filter name" `(,(elt it 1)))))

(defun emmet-filter (input filters)
  "Construct AST with specified filters."
  (emmet-pif (emmet-subexpr input)
                 (let ((result (car it))
                       (rest (cdr it)))
                   `((filter ,filters ,result) . ,rest))
                 it))

(defun emmet-default-filter ()
  "Default filter(s) to be used if none is specified."
  (or emmet-file-filter
      (let* ((file-ext (car (emmet-regex ".*\\(\\..*\\)" (or (buffer-file-name) "") 1)))
             (defaults '(".html" ("html")
                         ".htm"  ("html")
                         ".haml" ("haml")
                         ".clj"  ("hic")
                         ".cljs" ("hic")))
             (default-else emmet-fallback-filter)
             (selected-default (member file-ext defaults)))
        (if selected-default
            (cadr selected-default)
          default-else))))

(defun emmet-numbering (input)
  (emmet-parse
   "\\(\\$+\\)" 2 "numbering, $"
   (let ((doller (elt it 1)))
     (emmet-pif (emmet-parse
                     "@\\([0-9-][0-9]*\\)" 2 "numbering args"
                     (let* ((args (read (elt it 1)))
                            (direction  (not (or (eq '- args) (minusp args))))
                            (base       (if (eq '- args) 1 (abs args))))
                       `((n ,(length doller) ,direction ,base) . ,input)))
                    it
                    `((n ,(length doller) t 1) . ,input)))))

(defun emmet-split-numbering-expressions (input)
  (cl-labels
      ((iter (input)
             (emmet-aif (emmet-regex "\\([^$]*\\)\\(\\$.*\\)" input '(1 2))
                (let ((prefix (car it))
                      (input (cadr it)))
                  (if (and (< 0 (length prefix)) ; check if ..\\$... or ...$...
                           (string-equal (substring prefix -1) "\\"))
                      `(,(store-substring prefix (- (length prefix) 1) ?$)
                        ,@(iter (substring input 1)))
                    (let ((res (emmet-numbering input)))
                      `(,prefix ,(car res) ,@(iter (cdr res))))))
                (list input))))
    (let ((res (iter input)))
      (if (every #'stringp res)
          (apply #'concat res)
        `(numberings ,@res)))))

(defun emmet-instantiate-numbering-expression (i lim exp)
  (cl-labels ((instantiate
            (i lim exps)
            (apply #'concat
                   (mapcar
                    (lambda (exp)
                      (if (listp exp)
                          (let ((digits (second exp))
                                (direction (third exp))
                                (base (fourth exp)))
                            (let ((num (if direction (+ base i)
                                         (- (+ lim (- base 1)) i))))
                              (format (concat "%0" (format "%d" digits) "d") num)))
                        exp)) exps)))
           (search
            (i lim exp)
            (if (listp exp)
                (if (eql (car exp) 'numberings)
                    (instantiate i lim (cdr exp))
                  ;; Should do like this for real searching.
                  ;; But stack overflow occurs.
                  ;; (cons (search-numberings i lim (car exp))
                  ;;       (search-numberings i lim (cdr exp)))
                  (mapcar (lambda (exp) (search i lim exp)) exp))
              exp)))
    (search i lim exp)))

(defun emmet-multiply-expression (multiplicand exp)
  (loop for i to (- multiplicand 1) collect
        (emmet-instantiate-numbering-expression i multiplicand exp)))

(defun emmet-multiplier (input)
  (emmet-pif (emmet-run emmet-pexpr
                                it
                                (emmet-run emmet-tag
                                               it
                                               (emmet-run emmet-text
                                                              it
                                                              '(error "expected *n multiplier"))))
                 (let* ((expr (car it)) (input (cdr it))
                        (multiplier expr))
                   (emmet-parse "\\*\\([0-9]+\\)" 2 "*n where n is a number"
                                    (let ((multiplicand (read (elt it 1))))
                                      `((list ,(emmet-multiply-expression
                                                multiplicand
                                                multiplier)) . ,input))))))

(defun emmet-tag (input)
  "Parse a tag."
  (emmet-run
   emmet-tagname
   (let ((tagname (cadr expr))
         (has-body? (cddr expr)))
     (emmet-pif
      (emmet-run emmet-identifier
                     (emmet-tag-classes
                      `(tag (,tagname ,has-body? ,(cddr expr))) input)
                     (emmet-tag-classes
                      `(tag (,tagname ,has-body? nil)) input))
      (let ((tag-data (cadar it)) (input (cdr it)))
        (emmet-pif (emmet-run
                        emmet-properties
                        (let ((props (cdr expr)))
                          `((tag ,(append tag-data (list props))) . ,input))
                        `((tag ,(append tag-data '(nil))) . ,input))
                       (let ((expr (car it)) (input (cdr it)))
                         (destructuring-bind (expr . input)
                             (emmet-tag-text expr input)
                           (or
                            (emmet-expand-lorem expr input)
                            (emmet-expand-tag-alias expr input))))))))
   (emmet-default-tag input)))

(defun emmet-get-first-tag (expr)
  (if (listp expr)
      (if (listp (car expr))
          (emmet-get-first-tag (car expr))
        (if (eql (car expr) 'tag)
            expr
          (emmet-get-first-tag (cdr expr))))
    nil))

(defun emmet-lorem (input)
  (emmet-aif
   (and (stringp input) (emmet-regex "\\(?:lorem\\|ipsum\\)\\([0-9]*\\)" input '(0 1)))
   (let ((w (elt it 1)))
     (let ((word-num (if (string-equal w "") 30 (read w))))
       word-num))))

(defun emmet-expand-lorem (tag input)
  (let ((tag-data (cadr tag)))
    (let ((tag-name (car tag-data)))
      (emmet-aif (emmet-lorem tag-name)
                 (if (equalp (cdr tag-data) '(t nil nil nil nil))
                     `((text (lorem ,it)) . ,input)
                   `((tag ("div" ,@(subseq tag-data 1 -1) (lorem ,it))) . ,input))))))

(defun emmet-expand-tag-alias (tag input)
  (let ((tag-data (cadr tag)))
    (let ((tag-name (car tag-data)))
      (emmet-aif
       (gethash tag-name emmet-tag-aliases-table)
       (let ((expr (if (stringp it)
                       (emmet-subexpr it)
                     it)))
         (prog1
             (let ((rt (copy-tree expr)))
               (let ((first-tag-data (cadr (emmet-get-first-tag rt))))
                 (setf (second first-tag-data) (second tag-data))
                 (setf (third first-tag-data)  (third tag-data))
                 (setf (fourth first-tag-data)
                       (remove-duplicates
                        (append (fourth first-tag-data)
                                (fourth tag-data)) :test #'string=))
                 (setf (fifth first-tag-data)
                       (remove-duplicates
                        (append (fifth first-tag-data)
                                (fifth tag-data))
                        :test #'(lambda (p1 p2)
                                  (eql (car p1) (car p2)))))
                 (setf (sixth first-tag-data) (sixth tag-data))
                 (setf (cdr rt) (concat (cdr rt) input))
                 rt))
           (puthash tag-name expr emmet-tag-aliases-table)))
       `(,tag . ,input)))))

(defun emmet-default-tag (input)
  "Parse a #id or .class"
  (emmet-parse "\\([#|\\.]\\)" 1 "tagname"
                   (emmet-tag (concat "div" (elt it 0)))))

(defun emmet-tag-text (tag input)
  (let ((tag-data (cadr tag)))
    (emmet-run emmet-text
                   (let ((txt (cadr expr)))
                     `((tag ,(append tag-data (list txt))) . ,input))
                   `((tag ,(append tag-data '(nil))) . ,input))))

(defun emmet-tag-props (tag input)
  (let ((tag-data (cadr tag)))
    (emmet-run emmet-properties
                   (let ((props (cdr expr)))
                     `((tag ,(append tag-data (list props))) . ,input))
                   `((tag ,(append tag-data '(nil))) . ,input))))

(defun emmet-props (input)
  "Parse many props."
    (emmet-run emmet-prop
                   (emmet-pif (emmet-props input)
                                  `((props . ,(cons expr (cdar it))) . ,(cdr it))
                                  `((props . ,(list expr)) . ,input))))

(defun emmet-prop (input)
  (emmet-parse
   " *" 1 "space"
   (emmet-run
    emmet-name
    (let ((name (cdr expr)))
      (emmet-pif (emmet-parse "\\.\\(.*?\\)" 2 "."
                              `((,(read name)) . ,input))
                 it
                 (emmet-pif (emmet-prop-value name input)
                            it
                            `((,(read name) "") . ,input)))))))

(defun emmet-prop-value (name input)
  (emmet-pif (emmet-parse "=\"\\(.*?\\)\"" 2
                          "=\"property value\""
                          (let ((value (elt it 1))
                                (input (elt it 2)))
                            `((,(read name) ,(emmet-split-numbering-expressions value)) . ,input)))
             it
             (emmet-parse "=\\([^\\,\\+\\>\\{\\}\\ )]*\\)" 2
                          "=property value"
                          (let ((value (elt it 1))
                                (input (elt it 2)))
                            `((,(read name) ,(emmet-split-numbering-expressions value)) . ,input)))))

(defun emmet-tag-classes (tag input)
  (let ((tag-data (cadr tag)))
    (emmet-run emmet-classes
                   (let ((classes (mapcar (lambda (cls) (cdadr cls))
                                          (cdr expr))))
                     `((tag ,(append tag-data (list classes))) . ,input))
                   `((tag ,(append tag-data '(nil))) . ,input))))

(defun emmet-tagname (input)
  "Parse a tagname a-zA-Z0-9 tagname (e.g. html/head/xsl:if/br)."
  (emmet-parse "\\([a-zA-Z!][a-zA-Z0-9:!$@-]*\/?\\)" 2 "tagname, a-zA-Z0-9"
                   (let* ((tag-spec (elt it 1))
                          (empty-tag (emmet-regex "\\([^\/]*\\)\/" tag-spec 1))
                          (tag (emmet-split-numbering-expressions
                                (if empty-tag (car empty-tag) tag-spec))))
                     `((tagname . (,tag . ,(not empty-tag))) . ,input))))

(defun emmet-text (input)
  "A zen coding expression innertext."
  (emmet-parse "{\\(\\(?:\\\\.\\|[^\\\\}]\\)*?\\)}" 2 "inner text"
               (let ((txt (emmet-split-numbering-expressions (elt it 1))))
                 (if (listp txt)
                     (setq txt (cons (car txt) (cons (replace-regexp-in-string "\\\\\\(.\\)" "\\1" (cadr txt)) (cddr txt))))
                   (setq txt (replace-regexp-in-string "\\\\\\(.\\)" "\\1" txt)))
                 `((text ,txt) . ,input))))

(defun emmet-properties (input)
  "A bracketed emmet property expression."
  (emmet-parse "\\[\\(.*?\\)\\]" 2 "properties"
                `(,(car (emmet-props (elt it 1))) . ,input)))


(defun emmet-pexpr (input)
  "A zen coding expression with parentheses around it."
  (emmet-parse "(" 1 "("
                   (emmet-run emmet-subexpr
                                  (emmet-aif (emmet-regex ")" input '(0 1))
                                                 `(,expr . ,(elt it 1))
                                                 '(error "expecting `)'")))))

(defun emmet-parent-child (input)
  "Parse an tag>e expression, where `n' is an tag and `e' is any
   expression."
  (cl-labels
    ((listing (parents child input)
        (let ((len (length parents)))
          `((list ,(map 'list
                        (lambda (parent i)
                          `(parent-child ,parent
                                         ,(emmet-instantiate-numbering-expression i len child)))
                        parents
                        (loop for i to (- len 1) collect i))) . ,input))))
    (emmet-run
     emmet-multiplier
     (let* ((items (cadr expr))
            (rest (emmet-child-sans expr input)))
       (if (not (eq (car rest) 'error))
           (let ((child (car rest))
                 (input (cdr rest)))

             (emmet-aif (emmet-regex "^" input '(0 1))
                        (let ((input (elt it 1)))
                          (emmet-run
                           emmet-subexpr
                           `((sibling ,(car (listing items child "")) ,expr) . ,input)
                           (listing items child input)))
                        (listing items child input)))
         '(error "expected child")))
     (emmet-run emmet-tag
                (emmet-child expr input)
                '(error "expected parent")))))

(defun emmet-child-sans (parent input)
  (emmet-parse ">" 1 ">"
                   (emmet-run emmet-subexpr
                                  it
                                  '(error "expected child"))))

(defun emmet-child (parent input)
  (emmet-parse ">" 1 ">"
                   (emmet-run emmet-subexpr
                                  (let ((child expr))
                                    (emmet-aif (emmet-regex "^" input '(0 1))
                                                   (let ((input (elt it 1)))
                                                     (emmet-run emmet-subexpr
                                                                    `((sibling (parent-child ,parent ,child) ,expr) . ,input)
                                                                    `((parent-child ,parent ,child) . ,input)))
                                                   `((parent-child ,parent ,child) . ,input)))
                                  '(error "expected child"))))

(defun emmet-sibling (input)
  (emmet-por emmet-pexpr emmet-multiplier
                 it
                 (emmet-run emmet-tag
                                it
                                (emmet-run emmet-text
                                               it
                                               '(error "expected sibling")))))

(defun emmet-siblings (input)
  "Parse an e+e expression, where e is an tag or a pexpr."
  (emmet-run emmet-sibling
                 (let ((parent expr))
                   (emmet-parse
                    "\\+" 1 "+"
                    (emmet-run
                     emmet-subexpr
                     (let ((child expr))
                       `((sibling ,parent ,child) . ,input))
                     (emmet-expand parent input))))
                 '(error "expected first sibling")))

(defun emmet-expand (parent input)
  "Parse an e+ expression, where e is an expandable tag"
  (let* ((parent-tag (car (cadr parent))))
    (setf (caadr parent) (concat parent-tag "+"))
    (destructuring-bind (parent . input)
        (emmet-expand-tag-alias parent input)
      (emmet-pif (emmet-parse "+\\(.*\\)" 1 "+expr"
                                      (emmet-subexpr (elt it 1)))
                     `((sibling ,parent ,@it))
                     `(,parent . ,input)))))

(defun emmet-name (input)
  "Parse a class or identifier name, e.g. news, footer, mainimage"
  (emmet-parse "\\([a-zA-Z$@][a-zA-Z0-9$@_:-]*\\)" 2 "class or identifer name"
                   `((name . ,(emmet-split-numbering-expressions
                               (elt it 1))) . ,input)))

(defun emmet-class (input)
  "Parse a classname expression, e.g. .foo"
  (emmet-parse "\\." 1 "."
                   (emmet-run emmet-name
                                  `((class ,expr) . ,input)
                                  '(error "expected class name"))))
(defun emmet-identifier (input)
  "Parse an identifier expression, e.g. #foo"
  (emmet-parse "#" 1 "#"
                   (emmet-run emmet-name
                                  `((identifier . ,expr) . ,input))))

(defun emmet-classes (input)
  "Parse many classes."
  (emmet-run emmet-class
                 (emmet-pif (emmet-classes input)
                                `((classes . ,(cons expr (cdar it))) . ,(cdr it))
                                `((classes . ,(list expr)) . ,input))
                 '(error "expected class")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Zen coding transformer from AST to string

(defvar emmet-leaf-function nil
  "Function to execute when expanding a leaf node in the
  Emmet AST.")

(defvar emmet-expand-jsx-className? nil
  "Wether to use `className' when expanding `.classes'")

(emmet-defparameter
 emmet-tag-settings-table
 (gethash "tags" (gethash "html" emmet-preferences)))

(emmet-defparameter
 emmet-tag-snippets-table
 (gethash "snippets" (gethash "html" emmet-snippets)))

(defvar emmet-filters
  '("html" (emmet-primary-filter emmet-make-html-tag)
    "c"    (emmet-primary-filter emmet-make-commented-html-tag)
    "haml" (emmet-primary-filter emmet-make-haml-tag)
    "hic"  (emmet-primary-filter emmet-make-hiccup-tag)
    "e"    (emmet-escape-xml)))

(defun emmet-instantiate-lorem-expression (input)
  (if input
      (if (consp input)
          (if (and (eql (car input) 'lorem) (numberp (cadr input)))
              (emmet-lorem-generate (cadr input))
            (cons (emmet-instantiate-lorem-expression (car input))
                  (emmet-instantiate-lorem-expression (cdr input))))
        input)))

(defun emmet-primary-filter (input proc)
  "Process filter that needs to be executed first, ie. not given output from other filter."
  (if (listp input)
      (let ((tag-maker (cadr proc)))
        (emmet-transform-ast
         (emmet-instantiate-lorem-expression input)
         tag-maker))
    nil))

(defun emmet-process-filter (filters input)
  "Process filters, chain one filter output as the input of the next filter."
  (let ((filter-data (member (car filters) emmet-filters))
        (more-filters (cdr filters)))
    (if filter-data
        (let* ((proc   (cadr filter-data))
               (fun    (car proc))
               (filter-output (funcall fun input proc)))
          (if more-filters
              (emmet-process-filter more-filters filter-output)
            filter-output))
      nil)))

(defun emmet-make-tag (tag-maker tag-info &optional content)
  "Extract tag info and pass them to tag-maker."
  (let* ((name      (pop tag-info))
         (has-body? (pop tag-info))
         (id        (pop tag-info))
         (classes   (pop tag-info))
         (props     (pop tag-info))
         (txt       (pop tag-info))
         (settings  (gethash name emmet-tag-settings-table))
         (self-closing?
          (and (not (or txt content))
               (or  (not has-body?)
                    (and settings (gethash "selfClosing" settings))))))
    (funcall tag-maker name has-body? id classes props txt settings
             (if content content
               (if (and emmet-leaf-function (not self-closing?))
                   (funcall emmet-leaf-function))))))

(defun emmet-hash-to-list (hash &optional proc)
  (unless proc (setq proc #'cons))
  (loop for key being the hash-keys of hash using (hash-values val)
        collect (funcall proc key val)))

(defun emmet-merge-tag-props (default-table tag-props)
  (if default-table
      (let ((tbl (copy-hash-table default-table)))
        (loop for prop in tag-props do
              (puthash (symbol-name (car prop)) (cadr prop) tbl))
        (emmet-hash-to-list tbl 'list))
    tag-props))

(defun emmet-html-snippets-instantiate-lambda (src)
  (let ((lines (mapcar
                #'(lambda (src)
                    (if (string-match "^\\(.*\\)${child}\\(.*\\)$" src)
                        (mapcar (lambda (i)
                                  (match-string i src))
                                '(1 2))
                      (list src)))
                (split-string src "\n"))))
    (cl-labels
        ((iter
          (l m a b)
          (if l
              (if (< 1 (length (car l)))
                  (iter (cdr l)
                        'b
                        (cons (caar l)  a)
                        (cons (cadar l) b))
                (if (eql m 'a)
                    (iter (cdr l) m (cons (caar l) a) b)
                  (iter (cdr l) m a (cons (caar l) b))))
            (if b
                `(lambda (contents)
                   (concat
                    ,(emmet-join-string (reverse a) "\n")
                    contents
                    ,(emmet-join-string (reverse b) "\n")))
              `(lambda (contents)
                 (concat
                  ,(emmet-join-string (reverse a) "\n")
                  contents))))))
      (eval (iter lines 'a nil nil)))))

(defun emmet-make-html-tag (tag-name tag-has-body? tag-id tag-classes tag-props tag-txt settings content)
  "Create HTML markup string"
  (emmet-aif
   (gethash tag-name emmet-tag-snippets-table)

   (let ((fn (if (stringp it)
                 (emmet-html-snippets-instantiate-lambda it)
               it)))
     (prog1
         (funcall fn content)
       (puthash tag-name fn emmet-tag-snippets-table)))

   (let* ((id           (emmet-concat-or-empty " id=\"" tag-id "\""))
          (class-attr  (if emmet-expand-jsx-className? " className=\"" " class=\""))
          (classes      (emmet-mapconcat-or-empty class-attr tag-classes " " "\""))
          (props        (let* ((tag-props-default
                                (and settings (gethash "defaultAttr" settings)))
                               (merged-tag-props
                                (emmet-merge-tag-props
                                 tag-props-default
                                 tag-props)))
                          (emmet-mapconcat-or-empty
                           " " merged-tag-props " " nil
                           (lambda (prop)
                             (let* ((key (car prop))
                                    (key (if (symbolp key) (symbol-name key) key))
                                    (value (cadr prop)))
                               (if value
                                   (concat key "=\"" value "\"")
                                 key))))))
          (content-multiline? (and content (string-match "\n" content)))
          (block-tag?         (and settings (gethash "block" settings)))
          (self-closing?      (and (not (or tag-txt content))
                                   (or (not tag-has-body?)
                                       (and settings (gethash "selfClosing" settings)))))
          (block-indentation? (or content-multiline? (and block-tag? content)))
          (lf                 (if block-indentation? "\n")))
     (concat "<" tag-name id classes props
             (if self-closing?
                 (concat emmet-self-closing-tag-style ">")
               (concat ">"
                       (if tag-txt
                           (if block-indentation?
                               (emmet-indent tag-txt)
                             tag-txt))
                       (if content
                           (if block-indentation?
                               (emmet-indent content)
                             content))
                       lf
                       "</" tag-name ">"))))))

(defun emmet-make-commented-html-tag (tag-name tag-has-body? tag-id tag-classes tag-props tag-txt settings content)
  "Create HTML markup string with extra comments for elements with #id or .classes"
  (let ((body (emmet-make-html-tag tag-name tag-has-body? tag-id tag-classes tag-props tag-txt settings content)))
    (if (or tag-id tag-classes)
        (let ((id      (emmet-concat-or-empty "#" tag-id))
              (classes (emmet-mapconcat-or-empty "." tag-classes ".")))
          (concat "<!-- " id classes " -->\n"
                  body
                  "\n<!-- /" id classes " -->"))
      body)))

(defun emmet-make-haml-tag (tag-name tag-has-body? tag-id tag-classes tag-props tag-txt settings content)
  "Create HAML string"
  (let ((name    (if (and (equal tag-name "div")
                          (or tag-id tag-classes))
                     ""
                   (concat "%" tag-name)))
        (id      (emmet-concat-or-empty "#" tag-id))
        (classes (emmet-mapconcat-or-empty "." tag-classes "."))
        (props   (emmet-mapconcat-or-empty
                  "{" tag-props ", " "}"
                  (lambda (prop)
                    (concat ":" (symbol-name (car prop)) " => \"" (cadr prop) "\"")))))
    (concat name id classes props
            (if tag-txt
                (emmet-indent tag-txt))
            (if content
                (emmet-indent content)))))

(defun emmet-make-hiccup-tag (tag-name tag-has-body? tag-id tag-classes tag-props tag-txt settings content)
  "Create Hiccup string"
  (let* ((id      (emmet-concat-or-empty "#" tag-id))
         (classes (emmet-mapconcat-or-empty "." tag-classes "."))
         (props   (emmet-mapconcat-or-empty
                   " {" tag-props ", " "}"
                   (lambda (prop)
                     (concat ":" (symbol-name (car prop)) " \"" (cadr prop) "\""))))
         (content-multiline? (and content (string-match "\n" content)))
         (block-tag? (and settings (gethash "block" settings)))
         (block-indentation? (or content-multiline? (and block-tag? content))))
    (concat "[:" tag-name id classes props
            (if tag-txt
                (let ((tag-txt-quoted (concat "\"" tag-txt "\"")))
                  (if block-indentation?
                      (emmet-indent tag-txt-quoted)
                    (concat " " tag-txt-quoted))))
            (if content
                (if block-indentation?
                    (emmet-indent content)
                  (concat " " content)))
            "]")))

(defun emmet-make-text (tag-maker text)
  (cond
   ((eq tag-maker 'emmet-make-hiccup-tag)
    (concat "\"" text "\""))
   (t text)))

(defun emmet-concat-or-empty (prefix body &optional suffix)
  "Return prefixed suffixed text or empty string."
  (if body
      (concat prefix body suffix)
    ""))

(defun emmet-mapconcat-or-empty (prefix list-body delimiter &optional suffix map-fun)
  "Return prefixed suffixed mapconcated text or empty string."
  (if list-body
      (let* ((mapper (if map-fun map-fun 'identity))
             (body (mapconcat mapper list-body delimiter)))
        (concat prefix body suffix))
    ""))

(defun emmet-escape-xml (input proc)
  "Escapes XML-unsafe characters: <, > and &."
  (replace-regexp-in-string
   "<" "&lt;"
   (replace-regexp-in-string
    ">" "&gt;"
    (replace-regexp-in-string
     "&" "&amp;"
     (if (stringp input)
         input
       (emmet-process-filter (emmet-default-filter) input))))))

(defun emmet-html-transform (input)
  (let ((ast (car (emmet-expr input))))
    (when (not (eq ast 'error))
      (emmet-transform-ast-with-filters ast))))

(defun emmet-transform-ast-with-filters (ast-with-filters)
  "Transform AST (containing filter data) into string."
  (let ((filters (cadr ast-with-filters))
        (ast (caddr ast-with-filters)))
    (emmet-process-filter filters ast)))

(defun emmet-transform-ast (ast tag-maker)
  "Transform AST (without filter data) into string."
  (let ((type (car ast)))
    (cond
     ((eq type 'list)
      (mapconcat (lexical-let ((make-tag-fun tag-maker))
                   #'(lambda (sub-ast)
                       (emmet-transform-ast sub-ast make-tag-fun)))
                 (cadr ast)
                 "\n"))
     ((eq type 'tag)
      (emmet-make-tag tag-maker (cadr ast)))
     ((eq type 'text)
      (emmet-make-text tag-maker (cadr ast)))
     ((eq type 'parent-child)
      (let ((parent (cadadr ast))
            (children (emmet-transform-ast (caddr ast) tag-maker)))
        (emmet-make-tag tag-maker parent children)))
     ((eq type 'sibling)
      (let ((sib1 (emmet-transform-ast (cadr ast) tag-maker))
            (sib2 (emmet-transform-ast (caddr ast) tag-maker)))
        (concat sib1 "\n" sib2))))))

;; Indents text rigidly by inserting spaces
;; Only matters if emmet-indent-after-insert is set to nil
(defun emmet-indent (text)
  "Indent the text"
  (if text
      (replace-regexp-in-string "\n" (concat "\n" (make-string emmet-indentation ?\ )) (concat "\n" text))
    nil))

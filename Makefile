DST=emmet-mode.el

all: emmet-mode.el emmet-mode.elc

emmet-mode.el: src/snippets.el src/preferences.el src/*
	rm -f $(DST)
	touch $(DST)
	cat src/comments.el >> $(DST)
	cat src/init.el >> $(DST)
	cat src/mode-def.el >> $(DST)
	cat src/snippets.el >> $(DST)
	cat src/preferences.el >> $(DST)
	cat src/html-abbrev.el >> $(DST)
	cat src/lorem.el >> $(DST)
	cat src/css-abbrev.el >> $(DST)
	echo "" >> $(DST)
	echo ";;; emmet-mode.el ends here" >> $(DST)

emmet-mode.elc: emmet-mode.el
	/usr/bin/env emacs --batch --eval '(byte-compile-file "emmet-mode.el")'

src/snippets.el: conf/snippets.json
	tools/json2hash conf/snippets.json -o src/snippets.el --defvar 'emmet-snippets'

src/preferences.el: conf/preferences.json
	tools/json2hash conf/preferences.json -o src/preferences.el --defvar 'emmet-preferences'

clean:
	rm -f emmet-mode.elc emmet-mode.el src/snippets.el src/preferences.el

test: emmet-mode.el
	/usr/bin/env emacs --quick --script src/test.el

docs:
	echo docs

.PHONY: all test docs clean

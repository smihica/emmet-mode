;; src/preferences.el
;; This file is generated from conf/preferences.json
;; Don't edit.
(emmet-defparameter emmet-preferences
(let ((tbl (make-hash-table :test 'equal)))
(puthash "css" (let ((tbl (make-hash-table :test 'equal)))
(puthash "color" (let ((tbl (make-hash-table :test 'equal)))
(puthash "case" "auto" tbl)
(puthash "shortenIfPossible" t tbl)
(puthash "trailingAliases" (let ((tbl (make-hash-table :test 'equal)))
(puthash "h" "hidden" tbl)
(puthash "n" "none" tbl)
(puthash "s" "solid" tbl)
(puthash "t" "dotted" tbl)
tbl) tbl)
tbl) tbl)
(puthash "floatUnit" "em" tbl)
(puthash "intUnit" "px" tbl)
(puthash "keywordAliases" (let ((tbl (make-hash-table :test 'equal)))
(puthash "a" "auto" tbl)
(puthash "da" "dashed" tbl)
(puthash "do" "dotted" tbl)
(puthash "i" "inherit" tbl)
(puthash "s" "solid" tbl)
(puthash "t" "transparent" tbl)
tbl) tbl)
(puthash "keywords" (vector
"auto"
"inherit"
)
 tbl)
(puthash "unitAliases" (let ((tbl (make-hash-table :test 'equal)))
(puthash "-" "px" tbl)
(puthash "e" "em" tbl)
(puthash "p" "%" tbl)
(puthash "r" "rem" tbl)
(puthash "x" "ex" tbl)
tbl) tbl)
(puthash "unitlessProperties" (vector
"z-index"
"line-height"
"opacity"
"font-weight"
"zoom"
)
 tbl)
(puthash "vendorPrefixesProperties" (let ((tbl (make-hash-table :test 'equal)))
(puthash "accelerator" (vector
"ms"
)
 tbl)
(puthash "accesskey" (vector
"o"
)
 tbl)
(puthash "animation" (vector
"webkit"
"o"
)
 tbl)
(puthash "animation-delay" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-direction" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-duration" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-fill-mode" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-iteration-count" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-name" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-play-state" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "animation-timing-function" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "appearance" (vector
"webkit"
"moz"
)
 tbl)
(puthash "backface-visibility" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "background-clip" (vector
"webkit"
"moz"
)
 tbl)
(puthash "background-composite" (vector
"webkit"
)
 tbl)
(puthash "background-inline-policy" (vector
"moz"
)
 tbl)
(puthash "background-origin" (vector
"webkit"
)
 tbl)
(puthash "background-position-x" (vector
"ms"
)
 tbl)
(puthash "background-position-y" (vector
"ms"
)
 tbl)
(puthash "background-size" (vector
"webkit"
)
 tbl)
(puthash "behavior" (vector
"ms"
)
 tbl)
(puthash "binding" (vector
"moz"
)
 tbl)
(puthash "block-progression" (vector
"ms"
)
 tbl)
(puthash "border-bottom-colors" (vector
"moz"
)
 tbl)
(puthash "border-fit" (vector
"webkit"
)
 tbl)
(puthash "border-horizontal-spacing" (vector
"webkit"
)
 tbl)
(puthash "border-image" (vector
"webkit"
"moz"
"o"
)
 tbl)
(puthash "border-left-colors" (vector
"moz"
)
 tbl)
(puthash "border-radius" (vector
"webkit"
"moz"
)
 tbl)
(puthash "border-right-colors" (vector
"moz"
)
 tbl)
(puthash "border-top-colors" (vector
"moz"
)
 tbl)
(puthash "border-vertical-spacing" (vector
"webkit"
)
 tbl)
(puthash "box-align" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-direction" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-flex" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-flex-group" (vector
"webkit"
)
 tbl)
(puthash "box-line-progression" (vector
"ms"
)
 tbl)
(puthash "box-lines" (vector
"webkit"
"ms"
)
 tbl)
(puthash "box-ordinal-group" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-orient" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-pack" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "box-reflect" (vector
"webkit"
)
 tbl)
(puthash "box-shadow" (vector
"webkit"
"moz"
)
 tbl)
(puthash "box-sizing" (vector
"webkit"
"moz"
)
 tbl)
(puthash "color-correction" (vector
"webkit"
)
 tbl)
(puthash "column-break-after" (vector
"webkit"
)
 tbl)
(puthash "column-break-before" (vector
"webkit"
)
 tbl)
(puthash "column-break-inside" (vector
"webkit"
)
 tbl)
(puthash "column-count" (vector
"webkit"
"moz"
)
 tbl)
(puthash "column-gap" (vector
"webkit"
"moz"
)
 tbl)
(puthash "column-rule-color" (vector
"webkit"
"moz"
)
 tbl)
(puthash "column-rule-style" (vector
"webkit"
"moz"
)
 tbl)
(puthash "column-rule-width" (vector
"webkit"
"moz"
)
 tbl)
(puthash "column-span" (vector
"webkit"
)
 tbl)
(puthash "column-width" (vector
"webkit"
"moz"
)
 tbl)
(puthash "content-zoom-boundary" (vector
"ms"
)
 tbl)
(puthash "content-zoom-boundary-max" (vector
"ms"
)
 tbl)
(puthash "content-zoom-boundary-min" (vector
"ms"
)
 tbl)
(puthash "content-zoom-chaining" (vector
"ms"
)
 tbl)
(puthash "content-zoom-snap" (vector
"ms"
)
 tbl)
(puthash "content-zoom-snap-points" (vector
"ms"
)
 tbl)
(puthash "content-zoom-snap-type" (vector
"ms"
)
 tbl)
(puthash "content-zooming" (vector
"ms"
)
 tbl)
(puthash "dashboard-region" (vector
"webkit"
"o"
)
 tbl)
(puthash "filter" (vector
"ms"
)
 tbl)
(puthash "float-edge" (vector
"moz"
)
 tbl)
(puthash "flow-from" (vector
"ms"
)
 tbl)
(puthash "flow-into" (vector
"ms"
)
 tbl)
(puthash "font-feature-settings" (vector
"moz"
"ms"
)
 tbl)
(puthash "font-language-override" (vector
"moz"
)
 tbl)
(puthash "font-smoothing" (vector
"webkit"
)
 tbl)
(puthash "force-broken-image-icon" (vector
"moz"
)
 tbl)
(puthash "grid-column" (vector
"ms"
)
 tbl)
(puthash "grid-column-align" (vector
"ms"
)
 tbl)
(puthash "grid-column-span" (vector
"ms"
)
 tbl)
(puthash "grid-columns" (vector
"ms"
)
 tbl)
(puthash "grid-layer" (vector
"ms"
)
 tbl)
(puthash "grid-row" (vector
"ms"
)
 tbl)
(puthash "grid-row-align" (vector
"ms"
)
 tbl)
(puthash "grid-row-span" (vector
"ms"
)
 tbl)
(puthash "grid-rows" (vector
"ms"
)
 tbl)
(puthash "high-contrast-adjust" (vector
"ms"
)
 tbl)
(puthash "highlight" (vector
"webkit"
)
 tbl)
(puthash "hyphenate-character" (vector
"webkit"
)
 tbl)
(puthash "hyphenate-limit-after" (vector
"webkit"
)
 tbl)
(puthash "hyphenate-limit-before" (vector
"webkit"
)
 tbl)
(puthash "hyphenate-limit-chars" (vector
"ms"
)
 tbl)
(puthash "hyphenate-limit-lines" (vector
"ms"
)
 tbl)
(puthash "hyphenate-limit-zone" (vector
"ms"
)
 tbl)
(puthash "hyphens" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "image-region" (vector
"moz"
)
 tbl)
(puthash "ime-mode" (vector
"ms"
)
 tbl)
(puthash "input-format" (vector
"o"
)
 tbl)
(puthash "input-required" (vector
"o"
)
 tbl)
(puthash "interpolation-mode" (vector
"ms"
)
 tbl)
(puthash "layout-flow" (vector
"ms"
)
 tbl)
(puthash "layout-grid" (vector
"ms"
)
 tbl)
(puthash "layout-grid-char" (vector
"ms"
)
 tbl)
(puthash "layout-grid-line" (vector
"ms"
)
 tbl)
(puthash "layout-grid-mode" (vector
"ms"
)
 tbl)
(puthash "layout-grid-type" (vector
"ms"
)
 tbl)
(puthash "line-box-contain" (vector
"webkit"
)
 tbl)
(puthash "line-break" (vector
"webkit"
"ms"
)
 tbl)
(puthash "line-clamp" (vector
"webkit"
)
 tbl)
(puthash "link" (vector
"o"
)
 tbl)
(puthash "link-source" (vector
"o"
)
 tbl)
(puthash "locale" (vector
"webkit"
)
 tbl)
(puthash "margin-after-collapse" (vector
"webkit"
)
 tbl)
(puthash "margin-before-collapse" (vector
"webkit"
)
 tbl)
(puthash "marquee-dir" (vector
"o"
)
 tbl)
(puthash "marquee-direction" (vector
"webkit"
)
 tbl)
(puthash "marquee-increment" (vector
"webkit"
)
 tbl)
(puthash "marquee-loop" (vector
"o"
)
 tbl)
(puthash "marquee-repetition" (vector
"webkit"
)
 tbl)
(puthash "marquee-speed" (vector
"o"
)
 tbl)
(puthash "marquee-style" (vector
"webkit"
"o"
)
 tbl)
(puthash "mask-attachment" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image-outset" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image-repeat" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image-slice" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image-source" (vector
"webkit"
)
 tbl)
(puthash "mask-box-image-width" (vector
"webkit"
)
 tbl)
(puthash "mask-clip" (vector
"webkit"
)
 tbl)
(puthash "mask-composite" (vector
"webkit"
)
 tbl)
(puthash "mask-image" (vector
"webkit"
)
 tbl)
(puthash "mask-origin" (vector
"webkit"
)
 tbl)
(puthash "mask-position" (vector
"webkit"
)
 tbl)
(puthash "mask-repeat" (vector
"webkit"
)
 tbl)
(puthash "mask-size" (vector
"webkit"
)
 tbl)
(puthash "nbsp-mode" (vector
"webkit"
)
 tbl)
(puthash "object-fit" (vector
"o"
)
 tbl)
(puthash "object-position" (vector
"o"
)
 tbl)
(puthash "orient" (vector
"moz"
)
 tbl)
(puthash "outline-radius-bottomleft" (vector
"moz"
)
 tbl)
(puthash "outline-radius-bottomright" (vector
"moz"
)
 tbl)
(puthash "outline-radius-topleft" (vector
"moz"
)
 tbl)
(puthash "outline-radius-topright" (vector
"moz"
)
 tbl)
(puthash "overflow-style" (vector
"ms"
)
 tbl)
(puthash "perspective" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "perspective-origin" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "perspective-origin-x" (vector
"ms"
)
 tbl)
(puthash "perspective-origin-y" (vector
"ms"
)
 tbl)
(puthash "rtl-ordering" (vector
"webkit"
)
 tbl)
(puthash "scroll-boundary" (vector
"ms"
)
 tbl)
(puthash "scroll-boundary-bottom" (vector
"ms"
)
 tbl)
(puthash "scroll-boundary-left" (vector
"ms"
)
 tbl)
(puthash "scroll-boundary-right" (vector
"ms"
)
 tbl)
(puthash "scroll-boundary-top" (vector
"ms"
)
 tbl)
(puthash "scroll-chaining" (vector
"ms"
)
 tbl)
(puthash "scroll-rails" (vector
"ms"
)
 tbl)
(puthash "scroll-snap-points-x" (vector
"ms"
)
 tbl)
(puthash "scroll-snap-points-y" (vector
"ms"
)
 tbl)
(puthash "scroll-snap-type" (vector
"ms"
)
 tbl)
(puthash "scroll-snap-x" (vector
"ms"
)
 tbl)
(puthash "scroll-snap-y" (vector
"ms"
)
 tbl)
(puthash "scrollbar-arrow-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-base-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-darkshadow-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-face-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-highlight-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-shadow-color" (vector
"ms"
)
 tbl)
(puthash "scrollbar-track-color" (vector
"ms"
)
 tbl)
(puthash "stack-sizing" (vector
"moz"
)
 tbl)
(puthash "svg-shadow" (vector
"webkit"
)
 tbl)
(puthash "tab-size" (vector
"moz"
"o"
)
 tbl)
(puthash "table-baseline" (vector
"o"
)
 tbl)
(puthash "text-align-last" (vector
"ms"
)
 tbl)
(puthash "text-autospace" (vector
"ms"
)
 tbl)
(puthash "text-blink" (vector
"moz"
)
 tbl)
(puthash "text-combine" (vector
"webkit"
)
 tbl)
(puthash "text-decoration-color" (vector
"moz"
)
 tbl)
(puthash "text-decoration-line" (vector
"moz"
)
 tbl)
(puthash "text-decoration-style" (vector
"moz"
)
 tbl)
(puthash "text-decorations-in-effect" (vector
"webkit"
)
 tbl)
(puthash "text-emphasis-color" (vector
"webkit"
)
 tbl)
(puthash "text-emphasis-position" (vector
"webkit"
)
 tbl)
(puthash "text-emphasis-style" (vector
"webkit"
)
 tbl)
(puthash "text-fill-color" (vector
"webkit"
)
 tbl)
(puthash "text-justify" (vector
"ms"
)
 tbl)
(puthash "text-kashida-space" (vector
"ms"
)
 tbl)
(puthash "text-orientation" (vector
"webkit"
)
 tbl)
(puthash "text-overflow" (vector
"ms"
)
 tbl)
(puthash "text-security" (vector
"webkit"
)
 tbl)
(puthash "text-size-adjust" (vector
"moz"
"ms"
)
 tbl)
(puthash "text-stroke-color" (vector
"webkit"
)
 tbl)
(puthash "text-stroke-width" (vector
"webkit"
)
 tbl)
(puthash "text-underline-position" (vector
"ms"
)
 tbl)
(puthash "touch-action" (vector
"ms"
)
 tbl)
(puthash "transform" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transform-origin" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transform-origin-x" (vector
"ms"
)
 tbl)
(puthash "transform-origin-y" (vector
"ms"
)
 tbl)
(puthash "transform-origin-z" (vector
"ms"
)
 tbl)
(puthash "transform-style" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "transition" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transition-delay" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transition-duration" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transition-property" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "transition-timing-function" (vector
"webkit"
"moz"
"ms"
"o"
)
 tbl)
(puthash "user-drag" (vector
"webkit"
)
 tbl)
(puthash "user-focus" (vector
"moz"
)
 tbl)
(puthash "user-input" (vector
"moz"
)
 tbl)
(puthash "user-modify" (vector
"webkit"
"moz"
)
 tbl)
(puthash "user-select" (vector
"webkit"
"moz"
"ms"
)
 tbl)
(puthash "window-shadow" (vector
"moz"
)
 tbl)
(puthash "word-break" (vector
"ms"
)
 tbl)
(puthash "word-wrap" (vector
"ms"
)
 tbl)
(puthash "wrap-flow" (vector
"ms"
)
 tbl)
(puthash "wrap-margin" (vector
"ms"
)
 tbl)
(puthash "wrap-through" (vector
"ms"
)
 tbl)
(puthash "writing-mode" (vector
"webkit"
"ms"
)
 tbl)
tbl) tbl)
tbl) tbl)
(puthash "html" (let ((tbl (make-hash-table :test 'equal)))
(puthash "tags" (let ((tbl (make-hash-table :test 'equal)))
(puthash "a" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "href" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "abbr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "title" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "acronym" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "title" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "address" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "applet" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "area" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "alt" "" tbl)
(puthash "coords" "" tbl)
(puthash "href" "" tbl)
(puthash "shape" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "article" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "aside" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "audio" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "src" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "b" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "base" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "href" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "basefont" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "bdi" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "bdo" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "dir" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "big" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "blockquote" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "body" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "br" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "button" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "canvas" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "caption" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "center" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "cite" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "code" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "col" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "colgroup" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "command" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "datalist" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dd" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "del" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "details" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dfn" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dialog" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dir" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "div" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dl" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "dt" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "em" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "embed" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "src" "" tbl)
(puthash "type" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "fieldset" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "figcaption" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "figure" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "font" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "footer" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "form" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "frame" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "frameset" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h1" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h2" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h3" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h4" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h5" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "h6" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "head" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "header" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "hgroup" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "hr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "html" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "i" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "iframe" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "frameborder" "0" tbl)
(puthash "src" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "img" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "alt" "" tbl)
(puthash "src" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "input" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "name" "" tbl)
(puthash "type" "text" tbl)
(puthash "value" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "ins" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "kbd" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "keygen" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "label" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "for" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "legend" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "li" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "link" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "href" "" tbl)
(puthash "rel" "stylesheet" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "map" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "name" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "mark" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "menu" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "meta" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "meter" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "nav" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "noframes" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "noscript" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "object" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "data" "" tbl)
(puthash "type" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "ol" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "optgroup" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "option" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "value" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "output" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "p" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "param" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "name" "" tbl)
(puthash "value" "" tbl)
tbl) tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "pre" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "progress" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "q" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "rp" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "rt" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "ruby" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "s" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "samp" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "script" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "section" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "select" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "id" "" tbl)
(puthash "name" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "small" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "source" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "span" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "strike" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "strong" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "style" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "sub" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "summary" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "sup" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "table" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "tbody" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "td" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "textarea" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "cols" "30" tbl)
(puthash "id" "" tbl)
(puthash "name" "" tbl)
(puthash "rows" "10" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "tfoot" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "th" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "thead" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "time" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "title" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "tr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "track" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" t tbl)
tbl) tbl)
(puthash "tt" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "u" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "ul" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "var" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "video" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" t tbl)
(puthash "defaultAttr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "src" "" tbl)
tbl) tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
(puthash "wbr" (let ((tbl (make-hash-table :test 'equal)))
(puthash "block" nil tbl)
(puthash "selfClosing" nil tbl)
tbl) tbl)
tbl) tbl)
tbl) tbl)
tbl))

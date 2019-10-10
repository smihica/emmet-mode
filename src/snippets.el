;; src/snippets.el
;; This file is generated from conf/snippets.json
;; Don't edit.
(emmet-defparameter emmet-snippets
(let ((tbl (make-hash-table :test 'equal)))
(puthash "css" (let ((tbl (make-hash-table :test 'equal)))
(puthash "snippets" (let ((tbl (make-hash-table :test 'equal)))
(puthash "!" "!important" tbl)
(puthash "@f" "@font-face {\n\tfont-family:|;\n\tsrc:url(|);\n}" tbl)
(puthash "@f+" "@font-face {\n\tfont-family: '${1:FontName}';\n\tsrc: url('${2:FileName}.eot');\n\tsrc: url('${2:FileName}.eot?#iefix') format('embedded-opentype'),\n\t\t url('${2:FileName}.woff') format('woff'),\n\t\t url('${2:FileName}.ttf') format('truetype'),\n\t\t url('${2:FileName}.svg#${1:FontName}') format('svg');\n\tfont-style: ${3:normal};\n\tfont-weight: ${4:normal};\n}" tbl)
(puthash "@i" "@import url(|);" tbl)
(puthash "@import" "@import url(|);" tbl)
(puthash "@kf" "@-webkit-keyframes ${1:identifier} {\n\t${2:from} { ${3} }${6}\n\t${4:to} { ${5} }\n}\n@-o-keyframes ${1:identifier} {\n\t${2:from} { ${3} }${6}\n\t${4:to} { ${5} }\n}\n@-moz-keyframes ${1:identifier} {\n\t${2:from} { ${3} }${6}\n\t${4:to} { ${5} }\n}\n@keyframes ${1:identifier} {\n\t${2:from} { ${3} }${6}\n\t${4:to} { ${5} }\n}" tbl)
(puthash "@m" "@media ${1:screen} {\n\t|\n}" tbl)
(puthash "@media" "@media ${1:screen} {\n\t|\n}" tbl)
(puthash "ac" "align-content:|;" tbl)
(puthash "ac:c" "align-content:center;" tbl)
(puthash "ac:fe" "align-content:flex-end;" tbl)
(puthash "ac:fs" "align-content:flex-start;" tbl)
(puthash "ac:s" "align-content:stretch;" tbl)
(puthash "ac:sa" "align-content:space-around;" tbl)
(puthash "ac:sb" "align-content:space-between;" tbl)
(puthash "ai" "align-items:|;" tbl)
(puthash "ai:b" "align-items:baseline;" tbl)
(puthash "ai:c" "align-items:center;" tbl)
(puthash "ai:fe" "align-items:flex-end;" tbl)
(puthash "ai:fs" "align-items:flex-start;" tbl)
(puthash "ai:s" "align-items:stretch;" tbl)
(puthash "anim" "animation:|;" tbl)
(puthash "anim-" "animation:${1:name} ${2:duration} ${3:timing-function} ${4:delay} ${5:iteration-count} ${6:direction} ${7:fill-mode};" tbl)
(puthash "animdel" "animation-delay:${1:time};" tbl)
(puthash "animdir" "animation-direction:${1:normal};" tbl)
(puthash "animdir:a" "animation-direction:alternate;" tbl)
(puthash "animdir:ar" "animation-direction:alternate-reverse;" tbl)
(puthash "animdir:n" "animation-direction:normal;" tbl)
(puthash "animdir:r" "animation-direction:reverse;" tbl)
(puthash "animdur" "animation-duration:${1:0}s;" tbl)
(puthash "animfm" "animation-fill-mode:${1:both};" tbl)
(puthash "animfm:b" "animation-fill-mode:backwards;" tbl)
(puthash "animfm:bh" "animation-fill-mode:both;" tbl)
(puthash "animfm:bt" "animation-fill-mode:both;" tbl)
(puthash "animfm:f" "animation-fill-mode:forwards;" tbl)
(puthash "animic" "animation-iteration-count:${1:1};" tbl)
(puthash "animic:i" "animation-iteration-count:infinite;" tbl)
(puthash "animn" "animation-name:${1:none};" tbl)
(puthash "animps" "animation-play-state:${1:running};" tbl)
(puthash "animps:p" "animation-play-state:paused;" tbl)
(puthash "animps:r" "animation-play-state:running;" tbl)
(puthash "animtf" "animation-timing-function:${1:linear};" tbl)
(puthash "animtf:cb" "animation-timing-function:cubic-bezier(${1:0.1}, ${2:0.7}, ${3:1.0}, ${3:0.1});" tbl)
(puthash "animtf:e" "animation-timing-function:ease;" tbl)
(puthash "animtf:ei" "animation-timing-function:ease-in;" tbl)
(puthash "animtf:eio" "animation-timing-function:ease-in-out;" tbl)
(puthash "animtf:eo" "animation-timing-function:ease-out;" tbl)
(puthash "animtf:l" "animation-timing-function:linear;" tbl)
(puthash "ap" "appearance:${none};" tbl)
(puthash "as" "align-self:|;" tbl)
(puthash "as:a" "align-self:auto;" tbl)
(puthash "as:b" "align-self:baseline;" tbl)
(puthash "as:c" "align-self:center;" tbl)
(puthash "as:fe" "align-self:flex-end;" tbl)
(puthash "as:fs" "align-self:flex-start;" tbl)
(puthash "as:s" "align-self:stretch;" tbl)
(puthash "b" "bottom:|;" tbl)
(puthash "b:a" "bottom:auto;" tbl)
(puthash "bb" "border-bottom:|;" tbl)
(puthash "bd" "border:|;" tbl)
(puthash "bd+" "border:${1:1px} ${2:solid} ${3:#000};" tbl)
(puthash "bd:n" "border:none;" tbl)
(puthash "bdb" "border-bottom:|;" tbl)
(puthash "bdb+" "border-bottom:${1:1px} ${2:solid} ${3:#000};" tbl)
(puthash "bdb:n" "border-bottom:none;" tbl)
(puthash "bdbc" "border-bottom-color:${1:#000};" tbl)
(puthash "bdbc:t" "border-bottom-color:transparent;" tbl)
(puthash "bdbi" "border-bottom-image:url(|);" tbl)
(puthash "bdbi:n" "border-bottom-image:none;" tbl)
(puthash "bdbk" "border-break:${1:close};" tbl)
(puthash "bdbk:c" "border-break:close;" tbl)
(puthash "bdbli" "border-bottom-left-image:url(|);" tbl)
(puthash "bdbli:c" "border-bottom-left-image:continue;" tbl)
(puthash "bdbli:n" "border-bottom-left-image:none;" tbl)
(puthash "bdblrs" "border-bottom-left-radius:|;" tbl)
(puthash "bdbri" "border-bottom-right-image:url(|);" tbl)
(puthash "bdbri:c" "border-bottom-right-image:continue;" tbl)
(puthash "bdbri:n" "border-bottom-right-image:none;" tbl)
(puthash "bdbrrs" "border-bottom-right-radius:|;" tbl)
(puthash "bdbs" "border-bottom-style:|;" tbl)
(puthash "bdbs:n" "border-bottom-style:none;" tbl)
(puthash "bdbw" "border-bottom-width:|;" tbl)
(puthash "bdc" "border-color:${1:#000};" tbl)
(puthash "bdc:t" "border-color:transparent;" tbl)
(puthash "bdci" "border-corner-image:url(|);" tbl)
(puthash "bdci:c" "border-corner-image:continue;" tbl)
(puthash "bdci:n" "border-corner-image:none;" tbl)
(puthash "bdcl" "border-collapse:|;" tbl)
(puthash "bdcl:c" "border-collapse:collapse;" tbl)
(puthash "bdcl:s" "border-collapse:separate;" tbl)
(puthash "bdf" "border-fit:${1:repeat};" tbl)
(puthash "bdf:c" "border-fit:clip;" tbl)
(puthash "bdf:of" "border-fit:overflow;" tbl)
(puthash "bdf:ow" "border-fit:overwrite;" tbl)
(puthash "bdf:r" "border-fit:repeat;" tbl)
(puthash "bdf:sc" "border-fit:scale;" tbl)
(puthash "bdf:sp" "border-fit:space;" tbl)
(puthash "bdf:st" "border-fit:stretch;" tbl)
(puthash "bdi" "border-image:url(|);" tbl)
(puthash "bdi:n" "border-image:none;" tbl)
(puthash "bdl" "border-left:|;" tbl)
(puthash "bdl+" "border-left:${1:1px} ${2:solid} ${3:#000};" tbl)
(puthash "bdl:n" "border-left:none;" tbl)
(puthash "bdlc" "border-left-color:${1:#000};" tbl)
(puthash "bdlc:t" "border-left-color:transparent;" tbl)
(puthash "bdlen" "border-length:|;" tbl)
(puthash "bdlen:a" "border-length:auto;" tbl)
(puthash "bdli" "border-left-image:url(|);" tbl)
(puthash "bdli:n" "border-left-image:none;" tbl)
(puthash "bdls" "border-left-style:|;" tbl)
(puthash "bdls:n" "border-left-style:none;" tbl)
(puthash "bdlw" "border-left-width:|;" tbl)
(puthash "bdr" "border-right:|;" tbl)
(puthash "bdr+" "border-right:${1:1px} ${2:solid} ${3:#000};" tbl)
(puthash "bdr:n" "border-right:none;" tbl)
(puthash "bdrc" "border-right-color:${1:#000};" tbl)
(puthash "bdrc:t" "border-right-color:transparent;" tbl)
(puthash "bdri" "border-right-image:url(|);" tbl)
(puthash "bdri:n" "border-right-image:none;" tbl)
(puthash "bdrs" "border-radius:|;" tbl)
(puthash "bdrst" "border-right-style:|;" tbl)
(puthash "bdrst:n" "border-right-style:none;" tbl)
(puthash "bdrw" "border-right-width:|;" tbl)
(puthash "bds" "border-style:|;" tbl)
(puthash "bds:db" "border-style:double;" tbl)
(puthash "bds:ds" "border-style:dashed;" tbl)
(puthash "bds:dt" "border-style:dotted;" tbl)
(puthash "bds:dtds" "border-style:dot-dash;" tbl)
(puthash "bds:dtdtds" "border-style:dot-dot-dash;" tbl)
(puthash "bds:g" "border-style:groove;" tbl)
(puthash "bds:h" "border-style:hidden;" tbl)
(puthash "bds:i" "border-style:inset;" tbl)
(puthash "bds:n" "border-style:none;" tbl)
(puthash "bds:o" "border-style:outset;" tbl)
(puthash "bds:r" "border-style:ridge;" tbl)
(puthash "bds:s" "border-style:solid;" tbl)
(puthash "bds:w" "border-style:wave;" tbl)
(puthash "bdsp" "border-spacing:|;" tbl)
(puthash "bdt" "border-top:|;" tbl)
(puthash "bdt+" "border-top:${1:1px} ${2:solid} ${3:#000};" tbl)
(puthash "bdt:n" "border-top:none;" tbl)
(puthash "bdtc" "border-top-color:${1:#000};" tbl)
(puthash "bdtc:t" "border-top-color:transparent;" tbl)
(puthash "bdti" "border-top-image:url(|);" tbl)
(puthash "bdti:n" "border-top-image:none;" tbl)
(puthash "bdtli" "border-top-left-image:url(|);" tbl)
(puthash "bdtli:c" "border-top-left-image:continue;" tbl)
(puthash "bdtli:n" "border-top-left-image:none;" tbl)
(puthash "bdtlrs" "border-top-left-radius:|;" tbl)
(puthash "bdtri" "border-top-right-image:url(|);" tbl)
(puthash "bdtri:c" "border-top-right-image:continue;" tbl)
(puthash "bdtri:n" "border-top-right-image:none;" tbl)
(puthash "bdtrrs" "border-top-right-radius:|;" tbl)
(puthash "bdts" "border-top-style:|;" tbl)
(puthash "bdts:n" "border-top-style:none;" tbl)
(puthash "bdtw" "border-top-width:|;" tbl)
(puthash "bdw" "border-width:|;" tbl)
(puthash "bfv" "backface-visibility:|;" tbl)
(puthash "bfv:h" "backface-visibility:hidden;" tbl)
(puthash "bfv:v" "backface-visibility:visible;" tbl)
(puthash "bg" "background:#${1:000};" tbl)
(puthash "bg+" "background:${1:#fff} url(${2}) ${3:0} ${4:0} ${5:no-repeat};" tbl)
(puthash "bg:ie" "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${1:x}.png',sizingMethod='${2:crop}');" tbl)
(puthash "bg:n" "background:none;" tbl)
(puthash "bga" "background-attachment:|;" tbl)
(puthash "bga:f" "background-attachment:fixed;" tbl)
(puthash "bga:s" "background-attachment:scroll;" tbl)
(puthash "bgbk" "background-break:|;" tbl)
(puthash "bgbk:bb" "background-break:bounding-box;" tbl)
(puthash "bgbk:c" "background-break:continuous;" tbl)
(puthash "bgbk:eb" "background-break:each-box;" tbl)
(puthash "bgc" "background-color:${1:fff};" tbl)
(puthash "bgc:t" "background-color:transparent;" tbl)
(puthash "bgcp" "background-clip:${1:padding-box};" tbl)
(puthash "bgcp:bb" "background-clip:border-box;" tbl)
(puthash "bgcp:cb" "background-clip:content-box;" tbl)
(puthash "bgcp:nc" "background-clip:no-clip;" tbl)
(puthash "bgcp:pb" "background-clip:padding-box;" tbl)
(puthash "bgi" "background-image:url(|);" tbl)
(puthash "bgi:n" "background-image:none;" tbl)
(puthash "bgo" "background-origin:|;" tbl)
(puthash "bgo:bb" "background-origin:border-box;" tbl)
(puthash "bgo:cb" "background-origin:content-box;" tbl)
(puthash "bgo:pb" "background-origin:padding-box;" tbl)
(puthash "bgp" "background-position:${1:0} ${2:0};" tbl)
(puthash "bgpx" "background-position-x:|;" tbl)
(puthash "bgpy" "background-position-y:|;" tbl)
(puthash "bgr" "background-repeat:|;" tbl)
(puthash "bgr:n" "background-repeat:no-repeat;" tbl)
(puthash "bgr:rd" "background-repeat:round;" tbl)
(puthash "bgr:sp" "background-repeat:space;" tbl)
(puthash "bgr:x" "background-repeat:repeat-x;" tbl)
(puthash "bgr:y" "background-repeat:repeat-y;" tbl)
(puthash "bgsz" "background-size:|;" tbl)
(puthash "bgsz:a" "background-size:auto;" tbl)
(puthash "bgsz:ct" "background-size:contain;" tbl)
(puthash "bgsz:cv" "background-size:cover;" tbl)
(puthash "bl" "border-left:|;" tbl)
(puthash "br" "border-right:|;" tbl)
(puthash "bt" "border-top:|;" tbl)
(puthash "bxsh" "box-shadow:${1:inset }${2:hoff} ${3:voff} ${4:blur} ${5:color};" tbl)
(puthash "bxsh:n" "box-shadow:none;" tbl)
(puthash "bxsh:r" "box-shadow:${1:inset }${2:hoff} ${3:voff} ${4:blur} ${5:spread }rgb(${6:0}, ${7:0}, ${8:0});" tbl)
(puthash "bxsh:ra" "box-shadow:${1:inset }${2:h} ${3:v} ${4:blur} ${5:spread }rgba(${6:0}, ${7:0}, ${8:0}, .${9:5});" tbl)
(puthash "bxz" "box-sizing:${1:border-box};" tbl)
(puthash "bxz:bb" "box-sizing:border-box;" tbl)
(puthash "bxz:cb" "box-sizing:content-box;" tbl)
(puthash "c" "color:${1:#000};" tbl)
(puthash "c:r" "color:rgb(${1:0}, ${2:0}, ${3:0});" tbl)
(puthash "c:ra" "color:rgba(${1:0}, ${2:0}, ${3:0}, .${4:5});" tbl)
(puthash "cl" "clear:${1:both};" tbl)
(puthash "cl:b" "clear:both;" tbl)
(puthash "cl:l" "clear:left;" tbl)
(puthash "cl:n" "clear:none;" tbl)
(puthash "cl:r" "clear:right;" tbl)
(puthash "cm" "/* |${child} */" tbl)
(puthash "cnt" "content:'|';" tbl)
(puthash "cnt:a" "content:attr(|);" tbl)
(puthash "cnt:c" "content:counter(|);" tbl)
(puthash "cnt:cq" "content:close-quote;" tbl)
(puthash "cnt:cs" "content:counters(|);" tbl)
(puthash "cnt:n" "content:normal;" tbl)
(puthash "cnt:ncq" "content:no-close-quote;" tbl)
(puthash "cnt:noq" "content:no-open-quote;" tbl)
(puthash "cnt:oq" "content:open-quote;" tbl)
(puthash "coi" "counter-increment:|;" tbl)
(puthash "colm" "columns:|;" tbl)
(puthash "colmc" "column-count:|;" tbl)
(puthash "colmf" "column-fill:|;" tbl)
(puthash "colmg" "column-gap:|;" tbl)
(puthash "colmr" "column-rule:|;" tbl)
(puthash "colmrc" "column-rule-color:|;" tbl)
(puthash "colmrs" "column-rule-style:|;" tbl)
(puthash "colmrw" "column-rule-width:|;" tbl)
(puthash "colms" "column-span:|;" tbl)
(puthash "colmw" "column-width:|;" tbl)
(puthash "cor" "counter-reset:|;" tbl)
(puthash "cp" "clip:|;" tbl)
(puthash "cp:a" "clip:auto;" tbl)
(puthash "cp:r" "clip:rect(${1:top} ${2:right} ${3:bottom} ${4:left});" tbl)
(puthash "cps" "caption-side:|;" tbl)
(puthash "cps:b" "caption-side:bottom;" tbl)
(puthash "cps:t" "caption-side:top;" tbl)
(puthash "ct" "content:|;" tbl)
(puthash "ct:a" "content:attr(|);" tbl)
(puthash "ct:c" "content:counter(|);" tbl)
(puthash "ct:cq" "content:close-quote;" tbl)
(puthash "ct:cs" "content:counters(|);" tbl)
(puthash "ct:n" "content:normal;" tbl)
(puthash "ct:ncq" "content:no-close-quote;" tbl)
(puthash "ct:noq" "content:no-open-quote;" tbl)
(puthash "ct:oq" "content:open-quote;" tbl)
(puthash "cur" "cursor:${pointer};" tbl)
(puthash "cur:a" "cursor:auto;" tbl)
(puthash "cur:c" "cursor:crosshair;" tbl)
(puthash "cur:d" "cursor:default;" tbl)
(puthash "cur:ha" "cursor:hand;" tbl)
(puthash "cur:he" "cursor:help;" tbl)
(puthash "cur:m" "cursor:move;" tbl)
(puthash "cur:p" "cursor:pointer;" tbl)
(puthash "cur:t" "cursor:text;" tbl)
(puthash "d" "display:${1:block};" tbl)
(puthash "d:b" "display:block;" tbl)
(puthash "d:cp" "display:compact;" tbl)
(puthash "d:f" "display:flex;" tbl)
(puthash "d:i" "display:inline;" tbl)
(puthash "d:ib" "display:inline-block;" tbl)
(puthash "d:ib+" "display: inline-block;\n*display: inline;\n*zoom: 1;" tbl)
(puthash "d:if" "display:inline-flex;" tbl)
(puthash "d:itb" "display:inline-table;" tbl)
(puthash "d:li" "display:list-item;" tbl)
(puthash "d:n" "display:none;" tbl)
(puthash "d:rb" "display:ruby;" tbl)
(puthash "d:rbb" "display:ruby-base;" tbl)
(puthash "d:rbbg" "display:ruby-base-group;" tbl)
(puthash "d:rbt" "display:ruby-text;" tbl)
(puthash "d:rbtg" "display:ruby-text-group;" tbl)
(puthash "d:ri" "display:run-in;" tbl)
(puthash "d:tb" "display:table;" tbl)
(puthash "d:tbc" "display:table-cell;" tbl)
(puthash "d:tbcl" "display:table-column;" tbl)
(puthash "d:tbclg" "display:table-column-group;" tbl)
(puthash "d:tbcp" "display:table-caption;" tbl)
(puthash "d:tbfg" "display:table-footer-group;" tbl)
(puthash "d:tbhg" "display:table-header-group;" tbl)
(puthash "d:tbr" "display:table-row;" tbl)
(puthash "d:tbrg" "display:table-row-group;" tbl)
(puthash "ec" "empty-cells:|;" tbl)
(puthash "ec:h" "empty-cells:hide;" tbl)
(puthash "ec:s" "empty-cells:show;" tbl)
(puthash "f" "font:|;" tbl)
(puthash "f+" "font:${1:1em} ${2:Arial,sans-serif};" tbl)
(puthash "fef" "font-effect:|;" tbl)
(puthash "fef:eb" "font-effect:emboss;" tbl)
(puthash "fef:eg" "font-effect:engrave;" tbl)
(puthash "fef:n" "font-effect:none;" tbl)
(puthash "fef:o" "font-effect:outline;" tbl)
(puthash "fem" "font-emphasize:|;" tbl)
(puthash "femp" "font-emphasize-position:|;" tbl)
(puthash "femp:a" "font-emphasize-position:after;" tbl)
(puthash "femp:b" "font-emphasize-position:before;" tbl)
(puthash "fems" "font-emphasize-style:|;" tbl)
(puthash "fems:ac" "font-emphasize-style:accent;" tbl)
(puthash "fems:c" "font-emphasize-style:circle;" tbl)
(puthash "fems:ds" "font-emphasize-style:disc;" tbl)
(puthash "fems:dt" "font-emphasize-style:dot;" tbl)
(puthash "fems:n" "font-emphasize-style:none;" tbl)
(puthash "ff" "font-family:|;" tbl)
(puthash "ff:a" "font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif;" tbl)
(puthash "ff:c" "font-family:cursive;" tbl)
(puthash "ff:f" "font-family:fantasy;" tbl)
(puthash "ff:m" "font-family:monospace;" tbl)
(puthash "ff:s" "font-family:serif;" tbl)
(puthash "ff:ss" "font-family:sans-serif;" tbl)
(puthash "ff:t" "font-family: \"Times New Roman\", Times, Baskerville, Georgia, serif;" tbl)
(puthash "ff:v" "font-family: Verdana, Geneva, sans-serif;" tbl)
(puthash "fl" "float:${1:left};" tbl)
(puthash "fl:l" "float:left;" tbl)
(puthash "fl:n" "float:none;" tbl)
(puthash "fl:r" "float:right;" tbl)
(puthash "fs" "font-style:italic;" tbl)
(puthash "fs:i" "font-style:italic;" tbl)
(puthash "fs:n" "font-style:normal;" tbl)
(puthash "fs:o" "font-style:oblique;" tbl)
(puthash "fsm" "font-smooth:|;" tbl)
(puthash "fsm:a" "font-smooth:auto;" tbl)
(puthash "fsm:aw" "font-smooth:always;" tbl)
(puthash "fsm:n" "font-smooth:never;" tbl)
(puthash "fst" "font-stretch:|;" tbl)
(puthash "fst:c" "font-stretch:condensed;" tbl)
(puthash "fst:e" "font-stretch:expanded;" tbl)
(puthash "fst:ec" "font-stretch:extra-condensed;" tbl)
(puthash "fst:ee" "font-stretch:extra-expanded;" tbl)
(puthash "fst:n" "font-stretch:normal;" tbl)
(puthash "fst:sc" "font-stretch:semi-condensed;" tbl)
(puthash "fst:se" "font-stretch:semi-expanded;" tbl)
(puthash "fst:uc" "font-stretch:ultra-condensed;" tbl)
(puthash "fst:ue" "font-stretch:ultra-expanded;" tbl)
(puthash "fv" "font-variant:|;" tbl)
(puthash "fv:n" "font-variant:normal;" tbl)
(puthash "fv:sc" "font-variant:small-caps;" tbl)
(puthash "fw" "font-weight:|;" tbl)
(puthash "fw:b" "font-weight:bold;" tbl)
(puthash "fw:br" "font-weight:bolder;" tbl)
(puthash "fw:lr" "font-weight:lighter;" tbl)
(puthash "fw:n" "font-weight:normal;" tbl)
(puthash "fx" "flex:|;" tbl)
(puthash "fxb" "flex-basis:|;" tbl)
(puthash "fxd" "flex-direction:|;" tbl)
(puthash "fxd:c" "flex-direction:column;" tbl)
(puthash "fxd:cr" "flex-direction:column-reverse;" tbl)
(puthash "fxd:r" "flex-direction:row;" tbl)
(puthash "fxd:rr" "flex-direction:row-reverse;" tbl)
(puthash "fxf" "flex-flow:|;" tbl)
(puthash "fxg" "flex-grow:|;" tbl)
(puthash "fxsh" "flex-shrink:|;" tbl)
(puthash "fxw" "flex-wrap: |;" tbl)
(puthash "fxw:n" "flex-wrap:nowrap;" tbl)
(puthash "fxw:w" "flex-wrap:wrap;" tbl)
(puthash "fxw:wr" "flex-wrap:wrap-reverse;" tbl)
(puthash "fz" "font-size:|;" tbl)
(puthash "fza" "font-size-adjust:|;" tbl)
(puthash "fza:n" "font-size-adjust:none;" tbl)
(puthash "h" "height:|;" tbl)
(puthash "h:a" "height:auto;" tbl)
(puthash "jc" "justify-content:|;" tbl)
(puthash "jc:c" "justify-content:center;" tbl)
(puthash "jc:fe" "justify-content:flex-end;" tbl)
(puthash "jc:fs" "justify-content:flex-start;" tbl)
(puthash "jc:sa" "justify-content:space-around;" tbl)
(puthash "jc:sb" "justify-content:space-between;" tbl)
(puthash "l" "left:|;" tbl)
(puthash "l:a" "left:auto;" tbl)
(puthash "lh" "line-height:|;" tbl)
(puthash "lis" "list-style:|;" tbl)
(puthash "lis:n" "list-style:none;" tbl)
(puthash "lisi" "list-style-image:|;" tbl)
(puthash "lisi:n" "list-style-image:none;" tbl)
(puthash "lisp" "list-style-position:|;" tbl)
(puthash "lisp:i" "list-style-position:inside;" tbl)
(puthash "lisp:o" "list-style-position:outside;" tbl)
(puthash "list" "list-style-type:|;" tbl)
(puthash "list:c" "list-style-type:circle;" tbl)
(puthash "list:d" "list-style-type:disc;" tbl)
(puthash "list:dc" "list-style-type:decimal;" tbl)
(puthash "list:dclz" "list-style-type:decimal-leading-zero;" tbl)
(puthash "list:lr" "list-style-type:lower-roman;" tbl)
(puthash "list:n" "list-style-type:none;" tbl)
(puthash "list:s" "list-style-type:square;" tbl)
(puthash "list:ur" "list-style-type:upper-roman;" tbl)
(puthash "lts" "letter-spacing:|;" tbl)
(puthash "lts-n" "letter-spacing:normal;" tbl)
(puthash "m" "margin:|;" tbl)
(puthash "m:a" "margin:auto;" tbl)
(puthash "mah" "max-height:|;" tbl)
(puthash "mah:n" "max-height:none;" tbl)
(puthash "mar" "max-resolution:${1:res};" tbl)
(puthash "maw" "max-width:|;" tbl)
(puthash "maw:n" "max-width:none;" tbl)
(puthash "mb" "margin-bottom:|;" tbl)
(puthash "mb:a" "margin-bottom:auto;" tbl)
(puthash "mih" "min-height:|;" tbl)
(puthash "mir" "min-resolution:${1:res};" tbl)
(puthash "miw" "min-width:|;" tbl)
(puthash "ml" "margin-left:|;" tbl)
(puthash "ml:a" "margin-left:auto;" tbl)
(puthash "mr" "margin-right:|;" tbl)
(puthash "mr:a" "margin-right:auto;" tbl)
(puthash "mt" "margin-top:|;" tbl)
(puthash "mt:a" "margin-top:auto;" tbl)
(puthash "ol" "outline:|;" tbl)
(puthash "ol:n" "outline:none;" tbl)
(puthash "olc" "outline-color:${1:#000};" tbl)
(puthash "olc:i" "outline-color:invert;" tbl)
(puthash "olo" "outline-offset:|;" tbl)
(puthash "ols" "outline-style:|;" tbl)
(puthash "ols:db" "outline-style:double;" tbl)
(puthash "ols:ds" "outline-style:dashed;" tbl)
(puthash "ols:dt" "outline-style:dotted;" tbl)
(puthash "ols:g" "outline-style:groove;" tbl)
(puthash "ols:i" "outline-style:inset;" tbl)
(puthash "ols:n" "outline-style:none;" tbl)
(puthash "ols:o" "outline-style:outset;" tbl)
(puthash "ols:r" "outline-style:ridge;" tbl)
(puthash "ols:s" "outline-style:solid;" tbl)
(puthash "olw" "outline-width:|;" tbl)
(puthash "olw:m" "outline-width:medium;" tbl)
(puthash "olw:tc" "outline-width:thick;" tbl)
(puthash "olw:tn" "outline-width:thin;" tbl)
(puthash "op" "opacity:|;" tbl)
(puthash "op+" "opacity: $1;\nfilter: alpha(opacity=$2);" tbl)
(puthash "op:ie" "filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=100);" tbl)
(puthash "op:ms" "-ms-filter:'progid:DXImageTransform.Microsoft.Alpha(Opacity=100)';" tbl)
(puthash "ord" "order:|;" tbl)
(puthash "ori" "orientation:|;" tbl)
(puthash "ori:l" "orientation:landscape;" tbl)
(puthash "ori:p" "orientation:portrait;" tbl)
(puthash "orp" "orphans:|;" tbl)
(puthash "ov" "overflow:${1:hidden};" tbl)
(puthash "ov:a" "overflow:auto;" tbl)
(puthash "ov:h" "overflow:hidden;" tbl)
(puthash "ov:s" "overflow:scroll;" tbl)
(puthash "ov:v" "overflow:visible;" tbl)
(puthash "ovs" "overflow-style:${1:scrollbar};" tbl)
(puthash "ovs:a" "overflow-style:auto;" tbl)
(puthash "ovs:m" "overflow-style:move;" tbl)
(puthash "ovs:mq" "overflow-style:marquee;" tbl)
(puthash "ovs:p" "overflow-style:panner;" tbl)
(puthash "ovs:s" "overflow-style:scrollbar;" tbl)
(puthash "ovx" "overflow-x:${1:hidden};" tbl)
(puthash "ovx:a" "overflow-x:auto;" tbl)
(puthash "ovx:h" "overflow-x:hidden;" tbl)
(puthash "ovx:s" "overflow-x:scroll;" tbl)
(puthash "ovx:v" "overflow-x:visible;" tbl)
(puthash "ovy" "overflow-y:${1:hidden};" tbl)
(puthash "ovy:a" "overflow-y:auto;" tbl)
(puthash "ovy:h" "overflow-y:hidden;" tbl)
(puthash "ovy:s" "overflow-y:scroll;" tbl)
(puthash "ovy:v" "overflow-y:visible;" tbl)
(puthash "p" "padding:|;" tbl)
(puthash "pb" "padding-bottom:|;" tbl)
(puthash "pgba" "page-break-after:|;" tbl)
(puthash "pgba:al" "page-break-after:always;" tbl)
(puthash "pgba:au" "page-break-after:auto;" tbl)
(puthash "pgba:l" "page-break-after:left;" tbl)
(puthash "pgba:r" "page-break-after:right;" tbl)
(puthash "pgbb" "page-break-before:|;" tbl)
(puthash "pgbb:al" "page-break-before:always;" tbl)
(puthash "pgbb:au" "page-break-before:auto;" tbl)
(puthash "pgbb:l" "page-break-before:left;" tbl)
(puthash "pgbb:r" "page-break-before:right;" tbl)
(puthash "pgbi" "page-break-inside:|;" tbl)
(puthash "pgbi:au" "page-break-inside:auto;" tbl)
(puthash "pgbi:av" "page-break-inside:avoid;" tbl)
(puthash "pl" "padding-left:|;" tbl)
(puthash "pos" "position:${1:relative};" tbl)
(puthash "pos:a" "position:absolute;" tbl)
(puthash "pos:f" "position:fixed;" tbl)
(puthash "pos:r" "position:relative;" tbl)
(puthash "pos:s" "position:static;" tbl)
(puthash "pr" "padding-right:|;" tbl)
(puthash "pt" "padding-top:|;" tbl)
(puthash "q" "quotes:|;" tbl)
(puthash "q:en" "quotes:'\\201C' '\\201D' '\\2018' '\\2019';" tbl)
(puthash "q:n" "quotes:none;" tbl)
(puthash "q:ru" "quotes:'\\00AB' '\\00BB' '\\201E' '\\201C';" tbl)
(puthash "r" "right:|;" tbl)
(puthash "r:a" "right:auto;" tbl)
(puthash "rsz" "resize:|;" tbl)
(puthash "rsz:b" "resize:both;" tbl)
(puthash "rsz:h" "resize:horizontal;" tbl)
(puthash "rsz:n" "resize:none;" tbl)
(puthash "rsz:v" "resize:vertical;" tbl)
(puthash "t" "top:|;" tbl)
(puthash "t:a" "top:auto;" tbl)
(puthash "ta" "text-align:${1:left};" tbl)
(puthash "ta-lst" "text-align-last:|;" tbl)
(puthash "ta:c" "text-align:center;" tbl)
(puthash "ta:j" "text-align:justify;" tbl)
(puthash "ta:l" "text-align:left;" tbl)
(puthash "ta:r" "text-align:right;" tbl)
(puthash "tal:a" "text-align-last:auto;" tbl)
(puthash "tal:c" "text-align-last:center;" tbl)
(puthash "tal:l" "text-align-last:left;" tbl)
(puthash "tal:r" "text-align-last:right;" tbl)
(puthash "tbl" "table-layout:|;" tbl)
(puthash "tbl:a" "table-layout:auto;" tbl)
(puthash "tbl:f" "table-layout:fixed;" tbl)
(puthash "td" "text-decoration:${1:none};" tbl)
(puthash "td:l" "text-decoration:line-through;" tbl)
(puthash "td:n" "text-decoration:none;" tbl)
(puthash "td:o" "text-decoration:overline;" tbl)
(puthash "td:u" "text-decoration:underline;" tbl)
(puthash "te" "text-emphasis:|;" tbl)
(puthash "te:a" "text-emphasis:after;" tbl)
(puthash "te:ac" "text-emphasis:accent;" tbl)
(puthash "te:b" "text-emphasis:before;" tbl)
(puthash "te:c" "text-emphasis:circle;" tbl)
(puthash "te:ds" "text-emphasis:disc;" tbl)
(puthash "te:dt" "text-emphasis:dot;" tbl)
(puthash "te:n" "text-emphasis:none;" tbl)
(puthash "th" "text-height:|;" tbl)
(puthash "th:a" "text-height:auto;" tbl)
(puthash "th:f" "text-height:font-size;" tbl)
(puthash "th:m" "text-height:max-size;" tbl)
(puthash "th:t" "text-height:text-size;" tbl)
(puthash "ti" "text-indent:|;" tbl)
(puthash "ti:-" "text-indent:-9999px;" tbl)
(puthash "tj" "text-justify:|;" tbl)
(puthash "tj:a" "text-justify:auto;" tbl)
(puthash "tj:d" "text-justify:distribute;" tbl)
(puthash "tj:ic" "text-justify:inter-cluster;" tbl)
(puthash "tj:ii" "text-justify:inter-ideograph;" tbl)
(puthash "tj:iw" "text-justify:inter-word;" tbl)
(puthash "tj:k" "text-justify:kashida;" tbl)
(puthash "tj:t" "text-justify:tibetan;" tbl)
(puthash "to" "text-outline:|;" tbl)
(puthash "to+" "text-outline:${1:0} ${2:0} ${3:#000};" tbl)
(puthash "to:n" "text-outline:none;" tbl)
(puthash "tov" "text-overflow:${ellipsis};" tbl)
(puthash "tov:c" "text-overflow:clip;" tbl)
(puthash "tov:e" "text-overflow:ellipsis;" tbl)
(puthash "tr" "text-replace:|;" tbl)
(puthash "tr:n" "text-replace:none;" tbl)
(puthash "trf" "transform:|;" tbl)
(puthash "trf:r" "transform: rotate(${1:angle});" tbl)
(puthash "trf:rx" "transform: rotateX(${1:angle});" tbl)
(puthash "trf:ry" "transform: rotateY(${1:angle});" tbl)
(puthash "trf:rz" "transform: rotateZ(${1:angle});" tbl)
(puthash "trf:sc" "transform: scale(${1:x}, ${2:y});" tbl)
(puthash "trf:sc3" "transform: scale3d(${1:x}, ${2:y}, ${3:z});" tbl)
(puthash "trf:scx" "transform: scaleX(${1:x});" tbl)
(puthash "trf:scy" "transform: scaleY(${1:y});" tbl)
(puthash "trf:scz" "transform: scaleZ(${1:z});" tbl)
(puthash "trf:skx" "transform: skewX(${1:angle});" tbl)
(puthash "trf:sky" "transform: skewY(${1:angle});" tbl)
(puthash "trf:t" "transform: translate(${1:x}, ${2:y});" tbl)
(puthash "trf:t3" "transform: translate3d(${1:tx}, ${2:ty}, ${3:tz});" tbl)
(puthash "trf:tx" "transform: translateX(${1:x});" tbl)
(puthash "trf:ty" "transform: translateY(${1:y});" tbl)
(puthash "trf:tz" "transform: translateZ(${1:z});" tbl)
(puthash "trfo" "transform-origin:|;" tbl)
(puthash "trfs" "transform-style:${1:preserve-3d};" tbl)
(puthash "trs" "transition:${1:prop} ${2:time};" tbl)
(puthash "trsde" "transition-delay:${1:time};" tbl)
(puthash "trsdu" "transition-duration:${1:time};" tbl)
(puthash "trsp" "transition-property:${1:prop};" tbl)
(puthash "trstf" "transition-timing-function:${1:tfunc};" tbl)
(puthash "tsh" "text-shadow:${1:hoff} ${2:voff} ${3:blur} ${4:#000};" tbl)
(puthash "tsh+" "text-shadow:${1:0} ${2:0} ${3:0} ${4:#000};" tbl)
(puthash "tsh:n" "text-shadow:none;" tbl)
(puthash "tsh:r" "text-shadow:${1:h} ${2:v} ${3:blur} rgb(${4:0}, ${5:0}, ${6:0});" tbl)
(puthash "tsh:ra" "text-shadow:${1:h} ${2:v} ${3:blur} rgba(${4:0}, ${5:0}, ${6:0}, .${7:5});" tbl)
(puthash "tt" "text-transform:${1:uppercase};" tbl)
(puthash "tt:c" "text-transform:capitalize;" tbl)
(puthash "tt:l" "text-transform:lowercase;" tbl)
(puthash "tt:n" "text-transform:none;" tbl)
(puthash "tt:u" "text-transform:uppercase;" tbl)
(puthash "tw" "text-wrap:|;" tbl)
(puthash "tw:n" "text-wrap:normal;" tbl)
(puthash "tw:no" "text-wrap:none;" tbl)
(puthash "tw:s" "text-wrap:suppress;" tbl)
(puthash "tw:u" "text-wrap:unrestricted;" tbl)
(puthash "us" "user-select:${none};" tbl)
(puthash "v" "visibility:${1:hidden};" tbl)
(puthash "v:c" "visibility:collapse;" tbl)
(puthash "v:h" "visibility:hidden;" tbl)
(puthash "v:v" "visibility:visible;" tbl)
(puthash "va" "vertical-align:${1:top};" tbl)
(puthash "va:b" "vertical-align:bottom;" tbl)
(puthash "va:bl" "vertical-align:baseline;" tbl)
(puthash "va:m" "vertical-align:middle;" tbl)
(puthash "va:sub" "vertical-align:sub;" tbl)
(puthash "va:sup" "vertical-align:super;" tbl)
(puthash "va:t" "vertical-align:top;" tbl)
(puthash "va:tb" "vertical-align:text-bottom;" tbl)
(puthash "va:tt" "vertical-align:text-top;" tbl)
(puthash "w" "width:|;" tbl)
(puthash "w:a" "width:auto;" tbl)
(puthash "wfsm" "-webkit-font-smoothing:${antialiased};" tbl)
(puthash "wfsm:a" "-webkit-font-smoothing:antialiased;" tbl)
(puthash "wfsm:n" "-webkit-font-smoothing:none;" tbl)
(puthash "wfsm:s" "-webkit-font-smoothing:subpixel-antialiased;" tbl)
(puthash "wfsm:sa" "-webkit-font-smoothing:subpixel-antialiased;" tbl)
(puthash "whs" "white-space:|;" tbl)
(puthash "whs:n" "white-space:normal;" tbl)
(puthash "whs:nw" "white-space:nowrap;" tbl)
(puthash "whs:p" "white-space:pre;" tbl)
(puthash "whs:pl" "white-space:pre-line;" tbl)
(puthash "whs:pw" "white-space:pre-wrap;" tbl)
(puthash "whsc" "white-space-collapse:|;" tbl)
(puthash "whsc:ba" "white-space-collapse:break-all;" tbl)
(puthash "whsc:bs" "white-space-collapse:break-strict;" tbl)
(puthash "whsc:k" "white-space-collapse:keep-all;" tbl)
(puthash "whsc:l" "white-space-collapse:loose;" tbl)
(puthash "whsc:n" "white-space-collapse:normal;" tbl)
(puthash "wid" "widows:|;" tbl)
(puthash "wm" "writing-mode:${1:lr-tb};" tbl)
(puthash "wm:btl" "writing-mode:bt-lr;" tbl)
(puthash "wm:btr" "writing-mode:bt-rl;" tbl)
(puthash "wm:lrb" "writing-mode:lr-bt;" tbl)
(puthash "wm:lrt" "writing-mode:lr-tb;" tbl)
(puthash "wm:rlb" "writing-mode:rl-bt;" tbl)
(puthash "wm:rlt" "writing-mode:rl-tb;" tbl)
(puthash "wm:tbl" "writing-mode:tb-lr;" tbl)
(puthash "wm:tbr" "writing-mode:tb-rl;" tbl)
(puthash "wob" "word-break:|;" tbl)
(puthash "wob:ba" "word-break:break-all;" tbl)
(puthash "wob:k" "word-break:keep-all;" tbl)
(puthash "wob:n" "word-break:normal;" tbl)
(puthash "wos" "word-spacing:|;" tbl)
(puthash "wow" "word-wrap:|;" tbl)
(puthash "wow:b" "word-wrap:break-word;" tbl)
(puthash "wow:n" "word-wrap:none;" tbl)
(puthash "wow:nm" "word-wrap:normal;" tbl)
(puthash "wow:s" "word-wrap:suppress;" tbl)
(puthash "wow:u" "word-wrap:unrestricted;" tbl)
(puthash "z" "z-index:|;" tbl)
(puthash "z:a" "z-index:auto;" tbl)
(puthash "zm" "zoom:1;" tbl)
(puthash "zoo" "zoom:1;" tbl)
tbl) tbl)
tbl) tbl)
(puthash "html" (let ((tbl (make-hash-table :test 'equal)))
(puthash "aliases" (let ((tbl (make-hash-table :test 'equal)))
(puthash "!" "html:5" tbl)
(puthash "a:link" "a[href=http://]" tbl)
(puthash "a:mail" "a[href=mailto:]" tbl)
(puthash "acr" "acronym" tbl)
(puthash "adr" "address" tbl)
(puthash "area:c" "area[shape=circle coords href alt]" tbl)
(puthash "area:d" "area[shape=default href alt]" tbl)
(puthash "area:p" "area[shape=poly coords href alt]" tbl)
(puthash "area:r" "area[shape=rect coords href alt]" tbl)
(puthash "art" "article" tbl)
(puthash "bdo:l" "bdo[dir=ltr]" tbl)
(puthash "bdo:r" "bdo[dir=rtl]" tbl)
(puthash "bq" "blockquote" tbl)
(puthash "btn" "button" tbl)
(puthash "btn:b" "button[type=button]" tbl)
(puthash "btn:r" "button[type=reset]" tbl)
(puthash "btn:s" "button[type=submit]" tbl)
(puthash "cap" "caption" tbl)
(puthash "cmd" "command" tbl)
(puthash "colg" "colgroup" tbl)
(puthash "colg+" "colgroup>col" tbl)
(puthash "colgroup+" "colgroup>col" tbl)
(puthash "datag" "datagrid" tbl)
(puthash "datal" "datalist" tbl)
(puthash "det" "details" tbl)
(puthash "dl+" "dl>dt+dd" tbl)
(puthash "dlg" "dialog" tbl)
(puthash "doc" "html>(head>meta[charset=UTF-8]+title{Document})+body" tbl)
(puthash "doc4" "html>(head>meta[http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\"]+title{Document})" tbl)
(puthash "emb" "embed" tbl)
(puthash "fig" "figure" tbl)
(puthash "figc" "figcaption" tbl)
(puthash "form:get" "form[action method=get]" tbl)
(puthash "form:post" "form[action method=post]" tbl)
(puthash "fset" "fieldset" tbl)
(puthash "fst" "fieldset" tbl)
(puthash "ftr" "footer" tbl)
(puthash "hdr" "header" tbl)
(puthash "html:4s" "!!!4s+doc4[lang=en]" tbl)
(puthash "html:4t" "!!!4t+doc4[lang=en]" tbl)
(puthash "html:5" "!!!+doc[lang=en]" tbl)
(puthash "html:xml" "html[xmlns=http://www.w3.org/1999/xhtml]" tbl)
(puthash "html:xs" "!!!xs+doc4[xmlns=http://www.w3.org/1999/xhtml xml:lang=en]" tbl)
(puthash "html:xt" "!!!xt+doc4[xmlns=http://www.w3.org/1999/xhtml xml:lang=en]" tbl)
(puthash "html:xxs" "!!!xxs+doc4[xmlns=http://www.w3.org/1999/xhtml xml:lang=en]" tbl)
(puthash "ifr" "iframe" tbl)
(puthash "input:b" "input:button" tbl)
(puthash "input:button" "input[type=button]" tbl)
(puthash "input:c" "input:checkbox" tbl)
(puthash "input:checkbox" "input[type=checkbox]" tbl)
(puthash "input:color" "input[type=color]" tbl)
(puthash "input:date" "input[type=date]" tbl)
(puthash "input:datetime" "input[type=datetime]" tbl)
(puthash "input:datetime-local" "input[type=datetime-local]" tbl)
(puthash "input:email" "input[type=email]" tbl)
(puthash "input:f" "input:file" tbl)
(puthash "input:file" "input[type=file]" tbl)
(puthash "input:h" "input:hidden" tbl)
(puthash "input:hidden" "input[type=hidden]" tbl)
(puthash "input:i" "input:image" tbl)
(puthash "input:image" "input[type=image src alt]" tbl)
(puthash "input:month" "input[type=month]" tbl)
(puthash "input:number" "input[type=number]" tbl)
(puthash "input:p" "input:password" tbl)
(puthash "input:password" "input[type=password]" tbl)
(puthash "input:r" "input:radio" tbl)
(puthash "input:radio" "input[type=radio]" tbl)
(puthash "input:range" "input[type=range]" tbl)
(puthash "input:reset" "input[type=reset]" tbl)
(puthash "input:s" "input:submit" tbl)
(puthash "input:search" "input[type=search]" tbl)
(puthash "input:submit" "input[type=submit]" tbl)
(puthash "input:t" "input" tbl)
(puthash "input:text" "input" tbl)
(puthash "input:time" "input[type=time]" tbl)
(puthash "input:url" "input[type=url]" tbl)
(puthash "input:week" "input[type=week]" tbl)
(puthash "kg" "keygen" tbl)
(puthash "leg" "legend" tbl)
(puthash "link:atom" "link[rel=alternate type=\"application/atom+xml\" title=Atom href=atom.xml]" tbl)
(puthash "link:css" "link[rel=stylesheet href=style.css]" tbl)
(puthash "link:favicon" "link[icon rel=shortcut type=image/x-icon href=favicon.ico]" tbl)
(puthash "link:print" "link[rel=stylesheet href=print.css media=print]" tbl)
(puthash "link:rss" "link[rel=alternate type=application/rss+xml title=RSS href=rss.xml]" tbl)
(puthash "link:touch" "link[rel=apple-touch-icon href=favicon.png]" tbl)
(puthash "map+" "map>area" tbl)
(puthash "menu:c" "menu:context" tbl)
(puthash "menu:context" "menu[type=context]" tbl)
(puthash "menu:t" "menu:toolbar" tbl)
(puthash "menu:toolbar" "menu[type=toolbar]" tbl)
(puthash "meta:compat" "meta[http-equiv=X-UA-Compatible content=\"IE=edge,chrome=1\"]" tbl)
(puthash "meta:utf" "meta[http-equiv=Content-Type content=\"text/html;charset=UTF-8\"]" tbl)
(puthash "meta:vp" "meta[name=viewport content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\"]" tbl)
(puthash "meta:win" "meta[http-equiv=Content-Type content=\"text/html;charset=windows-1251\"]" tbl)
(puthash "obj" "object" tbl)
(puthash "ol+" "ol>li" tbl)
(puthash "opt" "option" tbl)
(puthash "optg" "optgroup" tbl)
(puthash "optg+" "optgroup>option" tbl)
(puthash "optgroup+" "optgroup>option" tbl)
(puthash "out" "output" tbl)
(puthash "prog" "progress" tbl)
(puthash "script:src" "script[src]" tbl)
(puthash "sect" "section" tbl)
(puthash "select+" "select>option" tbl)
(puthash "src" "source" tbl)
(puthash "str" "strong" tbl)
(puthash "table+" "table>tr>td" tbl)
(puthash "tarea" "textarea" tbl)
(puthash "tr+" "tr>td" tbl)
(puthash "ul+" "ul>li" tbl)
tbl) tbl)
(puthash "snippets" (let ((tbl (make-hash-table :test 'equal)))
(puthash "!!!" "<!doctype html>" tbl)
(puthash "!!!4s" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">" tbl)
(puthash "!!!4t" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">" tbl)
(puthash "!!!xs" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">" tbl)
(puthash "!!!xt" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" tbl)
(puthash "!!!xxs" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">" tbl)
(puthash "cc:ie" "<!--[if IE]>\n\t${child}\n<![endif]-->" tbl)
(puthash "cc:ie6" "<!--[if lte IE 6]>\n\t${child}\n<![endif]-->" tbl)
(puthash "cc:noie" "<!--[if !IE]><!-->\n\t${child}\n<!--<![endif]-->" tbl)
tbl) tbl)
tbl) tbl)
(puthash "sass" (let ((tbl (make-hash-table :test 'equal)))
(puthash "snippets" (let ((tbl (make-hash-table :test 'equal)))
(puthash "@f" "@font-face\n\tfont-family:|\n\tsrc:url(|)\n" tbl)
(puthash "@f+" "@font-face\n\tfont-family: '${1:FontName}'\n\tsrc: url('${2:FileName}.eot')\n\tsrc: url('${2:FileName}.eot?#iefix') format('embedded-opentype'), url('${2:FileName}.woff') format('woff'), url('${2:FileName}.ttf') format('truetype'), url('${2:FileName}.svg#${1:FontName}') format('svg')\n\tfont-style: ${3:normal}\n\tfont-weight: ${4:normal}\n" tbl)
(puthash "@kf" "@-webkit-keyframes ${1:identifier}\n\t${2:from}\n\t\t${3}${6}\n\t${4:to}\n\t\t${5}\n\n@-o-keyframes ${1:identifier}\n\t${2:from}\n\t\t${3}${6}\n\t${4:to}\n\t\t${5}\n\n@-moz-keyframes ${1:identifier}\n\t${2:from}\n\t\t${3}${6}\n\t${4:to}\n\t\t${5}\n\n@keyframes ${1:identifier}\n\t${2:from}\n\t\t${3}${6}\n\t${4:to}\n\t\t${5}\n" tbl)
(puthash "@m" "@media ${1:screen}\n\t|\n" tbl)
(puthash "@media" "@media ${1:screen}\n\t|\n" tbl)
tbl) tbl)
tbl) tbl)
tbl))

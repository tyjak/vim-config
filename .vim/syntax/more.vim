if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "more"

syn match Constant /^\w\+\s\?:[^\/]/
syn match lien /^Lien : .*/
highlight link lien StatusLine
syn match image /\[\(.mage\|[pP]hoto\)[^\]]\+\]/
highlight link image StatusLine
syn match chapitre /^\d\+\..*/
highlight link chapitre CursorLine
syn region Comment start=/[«"“]/ end=/[»"”]/
highlight Comment cterm=italic
syn match titre /^Titre : .*/
highlight link titre ModeMsg


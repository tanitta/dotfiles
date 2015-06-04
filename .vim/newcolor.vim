" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear
set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="newcolor"

hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#D7005F               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#FFD7FF               gui=bold
hi Define          guifg=#5FD7FF
hi Delimiter		guifg=#626262
hi DiffAdd							guibg=#005F87
hi DiffChange      guifg=#D7AFAF guibg=#4E4E4E
hi DiffDelete      guifg=#D70087 guibg=#5F005F
hi DiffText                    guibg=#878787 gui=italic,bold

hi Directory       guifg=#87FF00               gui=bold
hi Error           guifg=#FFAFFF guibg=#87005F
hi ErrorMsg        guifg=#FF00AF guibg=#000000    gui=bold
hi Exception       guifg=#87FF00               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#5F87AF  guibg=#000000
hi Folded          guifg=#5F87AF  guibg=#000000
hi Function        guifg=#87FF00
hi Identifier      guifg=#FF8700               gui=none
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#D7FFAF guibg=#000000

hi keyword         guifg=#D7005F               gui=bold
hi Label           guifg=#FFFFAF               gui=none
hi Macro           guifg=#D7FFAF				gui=italic
hi SpecialKey      guifg=#5FD7FF				gui=italic

hi MatchParen      guifg=#121212  guibg=#FF8700 gui=bold
hi ModeMsg         guifg=#FFFFAF
hi MoreMsg         guifg=#FFFFAF
hi Operator        guifg=#D7005F

" complete menu
hi Pmenu           guifg=#5FD7FF  guibg=#000000
hi PmenuSel        guifg=#EEEEEE guibg=#6C6C6C
hi PmenuSbar                   guibg=#080808
hi PmenuThumb      guifg=#5FD7FF

hi PreCondit       guifg=#87FF00               gui=bold
hi PreProc         guifg=#87FF00
hi Question        guifg=#5FD7FF
hi Repeat          guifg=#D7005F               gui=bold
hi Search          guifg=#000000   guibg=#FFD787
" marks column
hi SignColumn      guifg=#87FF00 guibg=#262626
hi SpecialChar     guifg=#D7005F               gui=bold
hi SpecialComment  guifg=#8A8A8A               gui=bold
hi Special         guifg=#5FD7FF	guibg=bg	gui=italic
if has("spell")
		hi SpellBad		guisp=#5F0000 gui=undercurl
		hi SpellCap 	guisp=#00005F gui=undercurl
		hi SpellLocal	guisp=#00005F gui=undercurl
		hi SpellRare  guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#D7005F               gui=bold
hi StatusLine      guifg=#444444 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FF8700				gui=italic
hi Structure       guifg=#5FD7FF
hi Tag             guifg=#D7005F				gui=italic
hi Title           guifg=#D75F00
hi Todo            guifg=#FFFFFF guibg=bg		gui=bold

hi Typedef         guifg=#5FD7FF
hi Type            guifg=#5FD7FF                gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#303030 guibg=#303030 gui=bold
hi VisualNOS                   guibg=#444444
hi Visual                      guibg=#262626
hi WarningMsg      guifg=#FFFFFF guibg=#444444   gui=bold
hi WildMenu        guifg=#5FD7FF  guibg=#000000

hi Comment         guifg=#6c6c6c
hi CursorColumn                guibg=#303030
hi ColorColumn                 guibg=#303030
hi LineNr          guifg=#BCBCBC guibg=#303030
hi NonText         guifg=#5F5F5F

hi SpecialKey      guifg=#5F5F5F

hi Normal       guifg=#D0D0D0 guibg=#000000
hi CursorLine               guibg=#1C1C1C   gui=none
hi CursorLineNr guifg=#FF8700               gui=none

highlight Pmenu ctermbg=8 guibg=#303030
highlight PmenuSel ctermbg=1 guibg=#BCBCBC guifg=#303030
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
" Must be at the end, because of guibg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

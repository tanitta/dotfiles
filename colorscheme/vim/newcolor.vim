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

hi Comment         guifg=#5F5F5F
hi CursorColumn                guibg=#303030
hi ColorColumn                 guibg=#303030
hi LineNr          guifg=#BCBCBC guibg=#303030
hi NonText         guifg=#5F5F5F

hi SpecialKey      guifg=#5F5F5F

hi Normal       guifg=#D0D0D0 guibg=#000000
hi CursorLine               guibg=#262626 gui=none
hi CursorLineNr guifg=#FF8700               gui=none

highlight Pmenu ctermbg=8 guibg=#303030
highlight PmenuSel ctermbg=1 guibg=#BCBCBC guifg=#303030
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Must be at the end, because of guibg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark


if &t_Co > 255
	hi Normal       ctermfg=252 ctermbg=233
	hi CursorLine               ctermbg=234   cterm=none
	hi CursorLineNr ctermfg=208               cterm=none
	hi Boolean         ctermfg=135
	hi Character       ctermfg=144
	hi Number          ctermfg=135
	hi String          ctermfg=144
	hi Conditional     ctermfg=161               cterm=bold
	hi Constant        ctermfg=135               cterm=bold
	hi Cursor          ctermfg=16  ctermbg=253
	hi Debug           ctermfg=225               cterm=bold
	hi Define          ctermfg=81
	hi Delimiter       ctermfg=241

	hi DiffAdd                     ctermbg=24
	hi DiffChange      ctermfg=181 ctermbg=239
	hi DiffDelete      ctermfg=162 ctermbg=53
	hi DiffText                    ctermbg=102 cterm=bold

	hi Directory       ctermfg=118               cterm=bold
	hi Error           ctermfg=219 ctermbg=89
	hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
	hi Exception       ctermfg=118               cterm=bold
	hi Float           ctermfg=135
	hi FoldColumn      ctermfg=67  ctermbg=16
	hi Folded          ctermfg=67  ctermbg=16
	hi Function        ctermfg=118
	hi Identifier      ctermfg=208               cterm=none
	hi Ignore          ctermfg=244 ctermbg=232
	hi IncSearch       ctermfg=193 ctermbg=16

	hi keyword         ctermfg=161               cterm=bold
	hi Label           ctermfg=229               cterm=none
	hi Macro           ctermfg=193
	hi SpecialKey      ctermfg=81

	hi MatchParen      ctermfg=233  ctermbg=208 cterm=bold
	hi ModeMsg         ctermfg=229
	hi MoreMsg         ctermfg=229
	hi Operator        ctermfg=161

	" complete menu
	hi Pmenu           ctermfg=81  ctermbg=16
	hi PmenuSel        ctermfg=255 ctermbg=242
	hi PmenuSbar                   ctermbg=232
	hi PmenuThumb      ctermfg=81

	hi PreCondit       ctermfg=118               cterm=bold
	hi PreProc         ctermfg=118
	hi Question        ctermfg=81
	hi Repeat          ctermfg=161               cterm=bold
	hi Search          ctermfg=0   ctermbg=222   cterm=NONE

	" marks column
	hi SignColumn      ctermfg=118 ctermbg=235
	hi SpecialChar     ctermfg=161               cterm=bold
	hi SpecialComment  ctermfg=245               cterm=bold
	hi Special         ctermfg=81
	if has("spell")
		hi SpellBad                ctermbg=52
		hi SpellCap                ctermbg=17
		hi SpellLocal              ctermbg=17
		hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse
	endif
	hi Statement       ctermfg=161               cterm=bold
	hi StatusLine      ctermfg=238 ctermbg=253
	hi StatusLineNC    ctermfg=244 ctermbg=232
	hi StorageClass    ctermfg=208
	hi Structure       ctermfg=81
	hi Tag             ctermfg=161
	hi Title           ctermfg=166
	hi Todo            ctermfg=231 ctermbg=232   cterm=bold

	hi Typedef         ctermfg=81
	hi Type            ctermfg=81                cterm=none
	hi Underlined      ctermfg=244               cterm=underline

	hi VertSplit       ctermfg=238 ctermbg=238 cterm=bold
	hi VisualNOS                   ctermbg=238
	hi Visual                      ctermbg=235
	hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
	hi WildMenu        ctermfg=81  ctermbg=16

	hi Comment         ctermfg=59
	hi CursorColumn                ctermbg=236
	hi ColorColumn                 ctermbg=236
	hi LineNr          ctermfg=250 ctermbg=236
	hi NonText         ctermfg=59

	hi SpecialKey      ctermfg=59
end

set background=dark

" =============================================================================
" Filename: autoload/lightline/colorscheme/newcolor.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 12:15:17.
" =============================================================================
let s:base03 = '#242424'
let s:base023 = '#353535'
let s:base02 = '#444444'
let s:base01 = '#585858'
let s:base00 = '#666666'
let s:base0 = '#A0A0A0'
let s:base1 = '#969696'
let s:base2 = '#a8a8a8'
let s:base3 = '#d0d0d0'
let s:yellow = '#FF8700'
let s:orange = '#e5786d'
let s:red = '#D7005F'
let s:magenta = '#AE81FF'
let s:blue = '#5FD7FF'
let s:cyan = s:blue
let s:green = '#87FF00'
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base1 ] ]
let s:p.tabline.right = [ [ s:base2, s:base01 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#newcolor#palette = lightline#colorscheme#fill(s:p)

" =============================================================================
" Filename: autoload/lightline/colorscheme/newcolor.vim
" Version: 0.0
" Author: tanitta
" License: MIT License
" Last Change: 2015/4/17 12:15:17.
" =============================================================================
let s:b232 = '#080808' 
let s:b233 = '#080808' 
let s:b234 = '#080808' 
let s:b235 = '#080808' 
let s:b236 = '#080808' 
let s:b237 = '#080808' 
let s:b238 = '#080808' 

let s:base03 = '#242424' "?(errorがなんとか
let s:base23 = '#353535' "非選択タブの背景
let s:mode_f = '#444444' "右から三段目の背景
let s:base01 = '#585858' "左から二番目，右から二番目の背景
let s:base00 = '#666666' "選択中のタブの背景
let s:base0 = '#A0A0A0' "一番右の背景
let s:base1 = '#969696' "右から二番目のフォント
let s:base2 = '#a8a8a8' "右から三番目の文字
let s:base3 = '#d0d0d0' "左から2番めの文字

let s:yellow = '#FF8700'
let s:orange = '#e5786d'
let s:red = '#D7005F'
let s:magenta = '#AE81FF'
let s:blue = '#5FD7FF'
let s:cyan = s:blue
let s:green = '#87FF00'
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:mode_f, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:mode_f, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:mode_f ] ]
let s:p.insert.left = [ [ s:mode_f, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:mode_f, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:mode_f, s:magenta ], [ s:base3, s:base01 ] ]

let s:p.inactive.right = [ [ s:base23, s:base01 ], [ s:base00, s:mode_f ] ]
let s:p.inactive.left =  [ [ s:base1, s:mode_f ], [ s:base00, s:base23 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base23 ] ] "?(非アクティブ時の背景


" let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
" let s:p.tabline.tabsel = [ [ s:base2, s:base23 ] ]
" let s:p.tabline.middle = [ [ s:mode_f, s:base1 ] ]
" let s:p.tabline.right = [ [ s:base2, s:base01 ] ]
" 
let s:p.tabline.left =  [ [ s:base2, s:mode_f ] ]
let s:p.tabline.tabsel = [ [ s:mode_f, s:base1 ] ]

let s:p.tabline.middle = [ [ s:base2, s:mode_f ] ]
let s:p.tabline.right = [ [ s:mode_f, s:base1 ] ]

let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base23, s:yellow ] ]

let g:lightline#colorscheme#newcolor#palette = lightline#colorscheme#fill(s:p)

set noswapfile
:syntax on

"Force the old regex engine to fix the problem that slow down cursor moving.
"cf. http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlightingk
set re=1

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set sidescrolloff=16           " 左右スクロール時の視界を確保
set scrolloff=8                " 上下8行の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

set title "タイトルをウィンドウ枠に表示

" オートインデントを有効にする（新しい行のインデントを現在の行と同じにする）
set autoindent
set tabstop=4 "タブ幅
set shiftwidth=4
set softtabstop=4

set list
" set listchars=eol:¬,tab:▸.
set listchars=eol:↴,tab:┆\ 

set autoread   "外部でファイルに変更がされた場合は読みなおす

set showcmd " 入力中のコマンドをステータスに表示する

" ウィンドウを折り返さない
set nowrap

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
set nowrap
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

"Clipboard
set clipboard+=unnamedplus

""paste をオンにすれば autoindent がオフの状態のトグル
set pastetoggle=<F2>

"GUI用のオプション
""a:ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーションとクリップボードを共有するオプション。
set guioptions+=a

" " マウスの入力を受け付ける
set mouse=a

" ビルド時に自動保存
set autowrite

" netrwは常にtree view
let g:netrw_liststyle = 3

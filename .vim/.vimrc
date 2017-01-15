set t_Co=256
set laststatus=2
set noswapfile
"ColorScheme
colorscheme newcolor
:syntax on
"Force the old regex engine to fix the problem that slow down cursor moving.
"cf. http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlightingk
set re=1

" let g:molokai_original = 0
"let g:rehash256 = 1
set background=dark

set guiheadroom=0

"半透明
highlight Normal ctermbg=none
set ruler
" set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える

" インサートモードに入った時にカーソル行(列)の色を変更する
augroup vimrc_change_cursorline_color
    autocmd!
    " インサートモードに入った時にカーソル行の色をブルーグリーンにする
    "autocmd InsertEnter * highlight CursorLine ctermbg=green

    autocmd InsertEnter * hi CursorLineNr ctermbg = 118
    autocmd InsertLeave * hi CursorLineNr ctermbg = 236

    "guibg=#005f87 | highlight CursorColumn ctermbg=24
    "guibg=#005f87
    "
    "     インサートモードを抜けた時にカーソル行の色を黒に近いダークグレーにする
    "autocmd InsertLeave * highlight CursorLine ctermbg=236
    "guibg=#303030 | highlight CursorColumn ctermbg=236
    "guibg=#303030
augroup END

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

" set autoindent
" set tabstop=4
" set expandtab
" set shiftwidth=4
"
"空行のインデントを削除しないようにする
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

set list
" set listchars=eol:¬,tab:▸.
set listchars=eol:↴,tab:┆\ 

set autoread   "外部でファイルに変更がされた場合は読みなおす
let &t_ti .= "\e[?1004h"
let &t_te .= "\e[?1004l"
map <special> <Esc>[I echo "hoge"
" augroup vimrc-checktime
"   autocmd!
"   autocmd WinEnter * checktime
" augroup END

set showcmd " 入力中のコマンドをステータスに表示する

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
set nowrap
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

set hlsearch

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
""paste をオンにすれば autoindent がオフの状態のトグル
set pastetoggle=<F2>
"GUI用のオプション
""a:ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーションとクリップボードを共有するオプション。
set guioptions+=a

" " マウスの入力を受け付ける
set mouse=a

" ビルド時に自動保存
set autowrite

" 保存時に行末の空白を除去
" function! s:remove_dust()
"     let cursor = getpos(".")
"     " 保存時に行末の空白を除去する
"     %s/\s\+$//ge
"     call setpos(".", cursor)
"     unlet cursor
" endfunction

" autocmd BufWritePre * call <SID>remove_dust()

au QuickfixCmdPost make,grep,grepadd,vimgrep copen
"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))


"neobundle自体をneobundleで管理
NeoBundleFetch 'shougo/neobundle.vim'

NeoBundle "Shougo/vimproc.vim"
NeoBundle "tyru/caw.vim"
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/thumbnail.vim'

NeoBundle 'yuratomo/w3m.vim'

NeoBundle 'vim-scripts/ViewOutput'

NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'cohama/lexima.vim'

" text object
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'cohama/agit.vim'

NeoBundle "ctrlpvim/ctrlp.vim"

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'osyo-manga/unite-quickfix.git'
NeoBundle 'rhysd/quickrun-unite-quickfix-outputter'
" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'

"'Yggdroot/indentLine'でconceallevel=2に書き換えられる対策用
NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

"highlight parenthesis
" let g:loaded_matchparen = 1
" NeoBundle 'itchyny/vim-parenmatch'
"highlight a word
NeoBundle "osyo-manga/vim-brightest"


NeoBundle 'Shougo/neocomplete.git'
" NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'ujihisa/neco-look'

NeoBundle 'kana/vim-arpeggio'
NeoBundle 'vim-jp/cpp-vim'

NeoBundle 'thinca/vim-quickrun'
" NeoBundle "cohama/vim-hier"

NeoBundle 'szw/vim-tags'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'derekwyatt/vim-scala'

" NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'osyo-manga/vim-snowdrop'


NeoBundle 'sbl/scvim'

"ruby
NeoBundle 'vim-ruby/vim-ruby'

" Processing
" NeoBundleLazy 'sophacles/vim-processing' , {'autoload' : {'filename_patterns' : '.*\.pde'}}
NeoBundle 'sophacles/vim-processing'
" augroup Processing
"     autocmd!
"     autocmd BufNewFile *.pde NeoBundleSource vim-processing
"     autocmd BufRead    *.pde NeoBundleSource vim-processing
" augroup END
" NeoBundleLazy 'sophacles/vim-processing' , {'autoload' : {'filename_patterns' : '.*\.pde'}}
au BufNewFile,BufRead *.pde setf processing

" Maxima
NeoBundle 'https://github.com/vim-scripts/maxima.vim'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'open-browser.vim'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/html5.vim'
" NeoBundle 'taichouchou2/vim-javascript'
" NeoBundle 'kchmck/vim-coffee-script'
" 
NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'mmisono/ref-dicts-en'
NeoBundle 'thinca/vim-ref'

"D"
NeoBundle 'JesseKPhillips/d.vim'
NeoBundle 'idanarye/vim-dutyl'

"Haskell
NeoBundle 'kana/vim-filetype-haskell' "スマートインデント
NeoBundle 'eagletmt/ghcmod-vim' "型の表示用 sudo apt-get install apt-get ghc-mod すること
let $PATH = $PATH . ':' . expand('~/.cabal/bin')
NeoBundle 'ujihisa/neco-ghc' "補完

"OCaml
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'def-lkb/ocp-indent-vim'

NeoBundle 'Lokaltog/powerline-fontpatcher'

NeoBundle 'cocopon/colorswatch.vim'

"GLSL
NeoBundle 'glsl.vim'

NeoBundle 'Lokaltog/vim-easymotion'

autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl
	\ set filetype=glsl

"syntax check
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle 'KazuakiM/vim-qfstatusline'

call neobundle#end()


" required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" end neobundle settings.
"-------------------------

"プロジェクトごとの設定を読み込む
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"ctrlp
let g:ctrlp_working_path_mode = 0

" ハイライトを有効にします（既定値）
" BrightestEnable
" ハイライトするグループ名を設定します
" アンダーラインで表示する
let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}

" vim-indent-guides
" let g:indent_guides_auto_colors=1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_guide_size=1

" indentLine
let g:indentLine_color_term = 235
let g:indentLine_color_gui = '#5F5F5F'
" "use ¦, ┆ or │
let g:indentLine_char = '│' 
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
"quickrun
"
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\   "cpp/clang++" : {
\       "cmdopt" : "-std=c++11 -w -pthread",
\       "hook/time/enable" : 1
\   },
\	"make" : {
\		"command" : "make",
\		"cmdopt" : "Debug -j6",
\		"exec" : "%c %o",
\		"runner" : "vimproc",
\	},
\	"run" : {
\		"command" : "make",
\		"cmdopt" : "RunDebug -j6",
\		"exec" : "%c %o",
\		"runner" : "vimproc",
\	},
\	"d/dmd" : {
\		"command" : "dmd",
\		"cmdopt" : "-run", 
\		'tempfile': "d.d"
\	},
\	'd/rdmd': {
\		'command': 'rdmd',
\		'tempfile': 'd.d'
\	},
\	'd/rdmd_unittest': {
\		'command': 'rdmd',
\		"cmdopt" : "-unittest", 
\		'tempfile': 'd.d'
\	},
\	"rp5" : {
\		"command" : "rp5",
\		"cmdopt" : "run"
\	},
\   "cpp/watchdogs_checker" : {
\       "type" : "watchdogs_checker/clang++",
\   },
\   "watchdogs_checker/clang++" : {
\		"command" : "make",
\		"cmdopt" : "CXXFLAGS=-fsyntax-only -j4 ",
\		"exec" : "%c %o",
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 4,
\   },
\}

let g:quickrun_config.processing = {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\     'command': 'processing-java',
\     'exec': '%c --sketch=%s:p:h/ --output=/tmp/processing --force --run ' }

" let s:hook = {
" \   "name" : "add_include_option",
" \   "kind" : "hook",
" \   "config" : {
" \       "enable" : 0,
" \   },
" \}
" function! s:hook.on_normalized(context, session)
"     let paths = filter(split(&path, ","), "len(v:val) && v:val !='.'")
"     if len(paths)
"         let a:context.config.cmdopt .= " -I".join(paths, " -I")
"     endif
" endfunction
"
"
" call quickrun#module#register(s:hook, 1)
" unlet s:hook
" 
" 
" :QuickRun -outputter my_outputter
" プロセスの実行中は、buffer に出力し、
" プロセスが終了したら、quickfix へ出力を行う


" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" 実行が成功すればバッファへ、失敗すれば quickfix へ出力する
" :QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix


" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 0

" filetype ごとに有効無効を設定することも出来る
let g:watchdogs_check_BufWritePost_enables = {
\   "cpp" : 0
\}


" こっちは一定時間キー入力がなかった場合にシンタックスチェックを行う
" バッファに書き込み後、1度だけ行われる
let g:watchdogs_check_CursorHold_enable = 0

" filetype=python は無効になる
" let g:watchdogs_check_CursorHold_enables = {
" \   "python" : 0
" \   "ruby"   : 0
" \}
 
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "outputter/quickfix/open_cmd" : "",
      \ }

" この関数で g:quickrun_config にシンタックスチェックを行うための設定を追加する
" 関数を呼び出すタイミングはユーザの g:quickrun_config 設定後
call watchdogs#setup(g:quickrun_config)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 0
" let g:neosnippet#expand_word_boundary = 1
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/dotfiles/.vim/snippets'
let g:neosnippet#snippets_directory = s:my_snippet

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:hatpos:toggle)
vmap \c <Plug>(caw:hatpos:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:hatpos:uncomment)
vmap \C <Plug>(caw:hatpos:uncomment)

"jk同時押しでEsc
call arpeggio#load()
Arpeggionmap jk <Esc>
Arpeggioimap jk <Esc>
Arpeggiocmap jk <Esc>
Arpeggiovmap jk <Esc>
"Plugin key-mappings.  " <C-k>でsnippetの展開
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)

"ESCでハイライトを消す
nnoremap <Esc><Esc> :<C-u>noh<Return>
" nnoremap <Esc><Esc> :<C-u>GhcModTypeClear<Return>


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
            \ 'rst': 1,
            \ 'markdown': 1,
            \ 'gitrebase': 1,
            \ 'gitcommit': 1,
            \ 'vcs-commit': 1,
            \ 'hybrid': 1,
            \ 'text': 1,
            \ 'help': 1,
            \ 'tex': 1,
            \ }


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" vim-multiple-cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" lexima
" ,の後にスペースを入れる
call lexima#add_rule({
\ "at" : '\%#',
\ "char" : ",",
\ "input" : ",<Space>",
\})
" ", " の後にスペースを続けれないようにする
" 誤爆防止用
call lexima#add_rule({
\   "at" : ', \%#',
\   "char" : '<Space>',
\   "input" : "",
\})
" ", "の後に改行したら末尾のスペースを消す
call lexima#add_rule({
\   "at" : ', \%#',
\   "char" : '<Enter>',
\   "input" : '<BS><Enter>',
\})


" homebrew keybind system
" 
" 選択した部分を検索
vnoremap / "zy:let @/ = @z<CR>n

nnoremap [window] <Nop>
nmap \w [window]
"ファイラの表示
nnoremap <silent> [window]e :<C-u>VimFilerExplorer<CR>
"tagbarの表示
nnoremap <silent> [window]t :<C-u>TagbarToggle<CR>
nnoremap <silent> [window]c :<C-u>cclose<CR>
nnoremap <silent> [window]o :<C-u>copen<CR>
nnoremap <silent> [window]f :<C-u>Unite -no-split -buffer-name=files -profile-name=buffer -auto-preview file_rec/async:!<cr>
nnoremap <silent> [window]b :<C-u>Thumbnail here<CR>
nnoremap <silent> [window]B :<C-u>Thumbnail<CR>

let g:EasyMotion_do_mapping = 0
nnoremap [easym] <Nop>
" nmap <Space> [easym]
" nmap <Space> <Plug>(easymotion-s2)
nmap <Space> <Plug>(easymotion-overwin-f2)

nnoremap [make] <Nop>
nmap \m [make]
nnoremap <silent> [make]t :<C-u>!ctags -R<Enter><CR>
" nnoremap <silent> [make]d :<C-u>!doxygen<Enter><CR>

nnoremap [quickrun] <Nop>
nmap \q [quickrun]

nnoremap [dictionary] <Nop>
nmap \d [dictionary]
nnoremap <silent> [dictionary]c :<C-u>Unite codic -winheight=10<CR>
"webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }

"デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction
nnoremap <silent> [dictionary]d :<C-u>Unite ref/webdict<CR>

nnoremap [git] <Nop>
nmap \g [git]
nnoremap <silent> [git]a :<C-u>Agit<CR>
nnoremap <silent> [git]s :<C-u>Gstatus<CR>
nnoremap <silent> [git]c :<C-u>Gcommit<CR>
nnoremap <silent> [git]p :<C-u>Git push<CR>
nnoremap <silent> [git]b :<C-u>Gblame<CR>
nnoremap <silent> [git]d :<C-u>Gdiff<CR>

"unite
"unite prefix key.
nnoremap [unite] <Nop>
nmap \u [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
" nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files -profile-name=buffer -auto-preview file_rec/async:!<cr>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"ファイラの表示
nnoremap <silent> [unite]k :<C-u>VimFilerExplorer<CR>
"tagbarの表示
nnoremap <silent> [unite]t :<C-u>Unite -toggle<CR>


"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+jで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> [unite]gr :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"vimfiler
let g:vimfiler_as_default_explorer = 1
"IDE like
"command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>

" autocmd VimEnter * :copen
" autocmd VimEnter * :VimFilerExplorer

"lightline
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'


" lightline.vim
let g:lightline = {
				\ 'colorscheme': 'newcolor',
				\ 'mode_map': {'c': 'NORMAL'},
				\ 'active': {
				\   'left': [
				\     ['mode', 'paste'],
				\     ['fugitive', 'gitgutter', 'filedir',  'filename'],
				\   ],
				\   'right': [
				\     ['qfstatusline', 'lineinfo', 'syntastic'],
				\     ['percent'],
				\     ['fileencoding', 'filetype'],
				\   ]
				\ },
				\ 'component_function': {
				\   'modified': 'MyModified',
				\   'readonly': 'MyReadonly',
				\   'fugitive': 'MyFugitive',
				\	'filedir':	'MyFileDir',
				\   'filename': 'MyFilename',
				\   'fileformat': 'MyFileformat',
				\   'filetype': 'MyFiletype',
				\   'fileencoding': 'MyFileencoding',
				\   'mode': 'MyMode',
				\   'syntastic': 'SyntasticStatuslineFlag',
				\   'charcode': 'MyCharCode',
				\   'gitgutter': 'MyGitGutter',
				\ },
				\    'component_expand': {
				\        'qfstatusline': 'qfstatusline#Update',},
				\    'component_type': {
				\        'qfstatusline': 'error',},
				\ 'separator': {'left': '⮀', 'right': '⮂'},
				\ 'subseparator': {'left': '⮁', 'right': '⮃'}
				\ }
function! UpdateSyntaxCheck()
	return function('lightline#update')
endfunction

" let g:Qfstatusline#UpdateCmd = function('lightline#update')
let g:Qfstatusline#UpdateCmd = UpdateSyntaxCheck()
function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFileDir()
	" return expand('%:h')
	return ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
				\ '' != expand('%:t') ? expand('%:h').'/'.expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			let _ = fugitive#head()
			return strlen(_) ? '⭠ '._ : ''
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth('.') > 80 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	" return winwidth('.') > 60 ? lightline#mode() : ''
	return lightline#mode()[0]
endfunction

function! MyGitGutter()
	if ! exists('*GitGutterGetHunkSummary')
				\ || ! get(g:, 'gitgutter_enabled', 0)
				\ || winwidth('.') <= 90
		return ''
	endif
	let symbols = [
				\ g:gitgutter_sign_added . ' ',
				\ g:gitgutter_sign_modified . ' ',
				\ g:gitgutter_sign_removed . ' '
				\ ]
	let hunks = GitGutterGetHunkSummary()
	let ret = []
	for i in [0, 1, 2]
		if hunks[i] > 0
			call add(ret, symbols[i] . hunks[i])
		endif
	endfor
	return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
	if winwidth('.') <= 90
		return ''
	endif

	" Get the output of :ascii
	redir => ascii
	silent! ascii
	redir END

	if match(ascii, 'NUL') != -1
		return 'NUL'
	endif

	" Zero pad hex values
	let nrformat = '0x%02x'

	let encoding = (&fenc == '' ? &enc : &fenc)

	if encoding == 'utf-8'
		" Zero pad with 4 zeroes in unicode files
		let nrformat = '0x%04x'
	endif

	" Get the character and the numeric value from the return value of :ascii
	" This matches the two first pieces of the return value, e.g.
	" "<F>  70" => char: 'F', nr: '70'
	let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

	" Format the numeric value
	let nr = printf(nrformat, nr)

	return "'". char ."' ". nr
endfunction


" function! s:GetScreenFullNames()
" 	let raw_str= system("screen -ls")
" 	let raw_str_list = split(raw_str,"\n")
" 	let i = 0
" 	if len(raw_str_list) !=1
" 			call remove(raw_str_list,len(raw_str_list)-1)
" 			call remove(raw_str_list,0)
" 	endif
" 	let screen_names = []
" 	for index in raw_str_list
" 		let screen_name= matchstr(index,'\t\zs.*\ze\t',0)
" 		call add(screen_names,screen_name)
" 	endfor
" 	return screen_names
" endfunction
"
" function! s:GetScreenLastNames()
" 	let full_names = s:GetScreenFullNames()
" 	let screen_names = []
" 	for index in full_names
" 		let screen_name = matchstr(index,'\.\zs.*',0)
" 		call add(screen_names,screen_name)
" 	endfor
" 	return screen_names
" endfunction
"
" function! s:ExistsLastName(name)
" 	let last_names = s:GetScreenLastNames()
" 	for index in last_names
" 		if index == a:name
" 			return 1
" 		else
" 			return 0
" 		endif
" 	endfor
" endfunction
" echo s:ExistsLastName("vim")

let g:vim_to_screen_names = []
function! s:ScreenStart(name)
	for index in g:vim_to_screen_names
		if index == a:name
			return
		endif
	endfor
	let command = "screen -S " . a:name
	let result = system("urxvt". ' -e ' . command . ' &')	
	call add( g:vim_to_screen_names, a:name)
	return result
endfunction
command! -nargs=0 ScreenStart call s:ScreenStart("vim")

function! s:ScreenQuit(screen_name)
	for index in g:vim_to_screen_names
		if index == a:screen_name
			let result = system("screen". ' -S ' . a:screen_name. ' -X quit')
		endif
	endfor
endfunction
command! -nargs=0 ScreenQuit call s:ScreenQuit("vim")

function! s:ScreenQuitAll()
	for index in g:vim_to_screen_names
		let result = system("screen". ' -S ' . index. ' -X quit')
	endfor
endfunction

augroup vim_to_screen
	autocmd!
	autocmd VimLeave * call s:ScreenQuitAll()
augroup END

function! s:ScreenSend(screen_name, command)
	for index in g:vim_to_screen_names
		if index == a:screen_name
			let result = system("screen -S ".a:screen_name. " -X ". "stuff '". a:command . '^M'. "'")
		endif
	endfor
endfunction
command! -nargs=1 ScreenSend call s:ScreenSend("vim",<f-args>)

" function! s:ScreenSendEasily(screen_name, command)
" 	for index in g:vim_to_screen_names
" 		if index == a:screen_name
" 			return
" 		endif
" 	endfor
" 	let command = "screen -S " . a:screen_name
" 	let screen_cmd = "screen -S ".a:screen_name. " -X ". "stuff '". a:command . '^M'. "'"
" 	let result = system("urxvt". ' -e ' . command . ' &&'. screen_cmd)
" 	echo result
" 	call add( g:vim_to_screen_names, a:screen_name)
" endfunction
" command! -nargs=1 ScreenSendEasily call s:ScreenSendEasily("vim",<f-args>)

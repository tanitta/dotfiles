
set t_Co=256
set laststatus=2

"ColorScheme
colorscheme molokai
:syntax on

let g:molokai_original = 0
"let g:rehash256 = 1
set background=dark

"半透明
highlight Normal ctermbg=none
set ruler
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
" インサートモードに入った時にカーソル行(列)の色を変更する
augroup vimrc_change_cursorline_color
		autocmd!
		" インサートモードに入った時にカーソル行の色をブルーグリーンにする
	"	autocmd InsertEnter * highlight CursorLine ctermbg=green

		autocmd InsertEnter * hi LineNr ctermbg = green
		autocmd InsertLeave * hi LineNr ctermbg = gray

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

set list
set listchars=eol:¬,tab:▸.

set autoread   "外部でファイルに変更がされた場合は読みなおす

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
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction

autocmd BufWritePre * call <SID>remove_dust()
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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Rip-Rip/clang_complete'
" NeoBundle "osyo-manga/vim-reunions"
" NeoBundle "osyo-manga/vim-marching"

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'kana/vim-arpeggio'
NeoBundle 'vim-jp/cpp-vim'

NeoBundle 'thinca/vim-quickrun'
call neobundle#end()


" required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" end neobundle settings.
"-------------------------


"quickrun
let g:quickrun_config = {
\   "cpp/clang++" : {
\       "cmdopt" : "-std=c++11 -w -pthread",
\       "hook/time/enable" : 1
\   },
\}
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" 実行が成功すればバッファへ、失敗すれば quickfix へ出力する
" :QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix



" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
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
nmap \c <Plug>(caw:i:toggle)
vmap \c <Plug>(caw:i:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:i:uncomment)
vmap \C <Plug>(caw:i:uncomment)

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
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


" neocompleteとclang_completeとの設定
if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
						\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
						\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#force_omni_input_patterns.objc =
						\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
						\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_periodic_quickfix = 0
let g:clang_auto_select = 1
let g:clang_use_library = 1
let g:clang_complete_copen = 0
let g:clang_hl_errors = 0
" let g:clang_use_debug = 0
let g:clang_library_path  = '/usr/lib/llvm-3.4/lib'
" set completeopt=menu,longest
let g:clang_snippets = 0
let g:clang_snippets_engine = 'clang_complete'
let g:clang_user_options = '-std=c++11 -w-'



" marching
" オプションを追加する場合
" let g:marching_clang_command_option="-std=c++11 -w"
"
" let g:marching_include_paths = filter(
" 			\ split(glob('/usr/include/c++/*'), '\n') +
" 			\ split(glob('/usr/include/*/c++/*'), '\n') +
" 			\ split(glob('/usr/include/*/'), '\n'),
" 			\ 'isdirectory(v:val)')
"
" " neocomplete.vim と併用して使用する場合
" let g:marching_enable_neocomplete = 1
"
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
"
" let g:neocomplete#force_omni_input_patterns.cpp =
" 			\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" 処理のタイミングを制御する
" 環境に合わせて間隔を短くする
" set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
" imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)


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


"unite
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

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


"vimfiler
let g:vimfiler_as_default_explorer = 1
"IDE like
"command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>

" autocmd VimEnter * :copen
autocmd VimEnter * :VimFilerExplorer

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
				\     ['fugitive', 'gitgutter', 'filename'],
				\   ],
				\   'right': [
				\     ['lineinfo', 'syntastic'],
				\     ['percent'],
				\     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
				\   ]
				\ },
				\ 'component_function': {
				\   'modified': 'MyModified',
				\   'readonly': 'MyReadonly',
				\   'fugitive': 'MyFugitive',
				\   'filename': 'MyFilename',
				\   'fileformat': 'MyFileformat',
				\   'filetype': 'MyFiletype',
				\   'fileencoding': 'MyFileencoding',
				\   'mode': 'MyMode',
				\   'syntastic': 'SyntasticStatuslineFlag',
				\   'charcode': 'MyCharCode',
				\   'gitgutter': 'MyGitGutter',
				\ },
				\ 'separator': {'left': '⮀', 'right': '⮂'},
				\ 'subseparator': {'left': '⮁', 'right': '⮃'}
				\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
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
	return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth('.') > 60 ? lightline#mode() : ''
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
	if winwidth('.') <= 70
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

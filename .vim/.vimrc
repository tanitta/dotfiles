
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

set autoread   "外部でファイルに変更がされた場合は読みなおす

set showcmd " 入力中のコマンドをステータスに表示する

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
set nowrap
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
""paste をオンにすれば autoindent がオフの状態のトグル
set pastetoggle=<F2>
"GUI用のオプション
""a:ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーションとクリップボードを共有するオプション。
set guioptions+=a

" " マウスの入力を受け付ける
set mouse=a
"インサートモードから抜けると自動的にMEをオフにする
"set iminsert=2

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

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))


"neobundle自体をneobundleで管理
NeoBundleFetch 'shougo/neobundle.vim'

"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Rip-Rip/clang_complete'

NeoBundle 'kana/vim-arpeggio'
call neobundle#end()


" required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" end neobundle settings.
"-------------------------
"jk同時押しでEsc
call arpeggio#load()
Arpeggionmap jk <Esc>
Arpeggioimap jk <Esc>
Arpeggiocmap jk <Esc>
Arpeggiovmap jk <Esc>
"Plugin key-mappings.  " <C-k>でsnippetの展開
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)



let g:neocomplcache_enable_at_startup = 1 

" <TAB> completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" snippets expand key
"imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
"smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

" neocomplcache 側の設定
let g:neocomplcache_force_overwrite_completefunc=1

if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif

" omnifunc が呼び出される場合の正規表現パターンを設定しておく
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|::'


let g:clang_complete_auto = 0 
let g:clang_auto_select=0

let g:clang_use_library   = 1 
let g:clang_debug=1
let g:clang_library_path  = '/usr/lib/llvm-3.4/lib'
"let g:clang_user_options  = '2>/dev/null || exit 0"'

"let g:neocomplcache_clang_use_library  = 1
" Clangバイナリがある場所を指定する
"let g:neocomplcache_clang_library_path='/usr/lib/llvm-3.4/lib'
"let g:neocomplcache_max_list=1000
"unite
"インサートモードで開始しない
let g:unite_enable_start_insert = 0

"vimfiler
let g:vimfiler_as_default_explorer = 1
"IDE like
"command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

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

nnoremap Y y$
vnoremap P "0p

let g:ranger_map_keys = 0"ESCでハイライトを消す
nnoremap <Esc><Esc> :<C-u>noh<Return>
" nnoremap <Esc><Esc> :<C-u>GhcModTypeClear<Return>

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
" nnoremap <silent> [window]f :<C-u>Unite -no-split -buffer-name=files -profile-name=buffer -auto-preview file_rec/async:!<cr>
nnoremap <silent> [window]b :<C-u>Thumbnail here<CR>
nnoremap <silent> [window]B :<C-u>Thumbnail<CR>

function! s:ReloadVimScript()
    source ~/.config/nvim/init.vim
endfunction
nnoremap <silent> [window]r :<C-u>call ReloadVimScript()<CR>

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

" nnoremap [dictionary] <Nop>
" nmap \d [dictionary]
" nnoremap <silent> [dictionary]c :<C-u>Unite codic -winheight=10<CR>
" "webdictサイトの設定
" let g:ref_source_webdict_sites = {
" \   'je': {
" \     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
" \   },
" \   'ej': {
" \     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
" \   },
" \   'wiki': {
" \     'url': 'http://ja.wikipedia.org/wiki/%s',
" \   },
" \ }
"
" "デフォルトサイト
" let g:ref_source_webdict_sites.default = 'ej'
"
" "出力に対するフィルタ。最初の数行を削除
" function! g:ref_source_webdict_sites.je.filter(output)
"   return join(split(a:output, "\n")[15 :], "\n")
" endfunction
" function! g:ref_source_webdict_sites.ej.filter(output)
"   return join(split(a:output, "\n")[15 :], "\n")
" endfunction
" function! g:ref_source_webdict_sites.wiki.filter(output)
"   return join(split(a:output, "\n")[17 :], "\n")
" endfunction
" nnoremap <silent> [dictionary]d :<C-u>Unite ref/webdict<CR>

nnoremap [git] <Nop>
nmap \g [git]
nnoremap <silent> [git]a :<C-u>Agit<CR>
nnoremap <silent> [git]s :<C-u>Gstatus<CR>
nnoremap <silent> [git]c :<C-u>Gcommit<CR>
nnoremap <silent> [git]p :<C-u>Git push<CR>
nnoremap <silent> [git]b :<C-u>Gblame<CR>
nnoremap <silent> [git]d :<C-u>Gdiff<CR>

" "unite
" "unite prefix key.
" nnoremap [unite] <Nop>
" nmap \u [unite]
"
" "unite general settings
" "インサートモードで開始
" let g:unite_enable_start_insert = 1
" "最近開いたファイル履歴の保存数
" let g:unite_source_file_mru_limit = 50
"
" "file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
" let g:unite_source_file_mru_filename_format = ''
"
" "現在開いているファイルのディレクトリ下のファイル一覧。
" "開いていない場合はカレントディレクトリ
" " nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files -profile-name=buffer -auto-preview file_rec/async:!<cr>
" "バッファ一覧
" nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" "レジスタ一覧
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" "最近使用したファイル一覧
" nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" "ブックマーク一覧
" nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" "ブックマークに追加
" nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" "ファイラの表示
" nnoremap <silent> [unite]k :<C-u>VimFilerExplorer<CR>
" "tagbarの表示
" nnoremap <silent> [unite]t :<C-u>Unite -toggle<CR>
"
"
" "uniteを開いている間のキーマッピング
" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()"{{{
" 	"ESCでuniteを終了
" 	nmap <buffer> <ESC> <Plug>(unite_exit)
" 	"入力モードのときjjでノーマルモードに移動
" 	imap <buffer> jj <Plug>(unite_insert_leave)
" 	"入力モードのときctrl+wでバックスラッシュも削除
" 	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
" 	"ctrl+jで縦に分割して開く
" 	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" 	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" 	"ctrl+jで横に分割して開く
" 	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" 	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" 	"ctrl+oでその場所に開く
" 	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
" 	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
" endfunction"}}}
"
" " insert modeで開始
" let g:unite_enable_start_insert = 1
"
" " 大文字小文字を区別しない
" let g:unite_enable_ignore_case = 1
" let g:unite_enable_smart_case = 1
"
" " grep検索
" nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"
" " カーソル位置の単語をgrep検索
" nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
"
" " grep検索結果の再呼出
" nnoremap <silent> [unite]gr :<C-u>UniteResume search-buffer<CR>
"
" " unite grep に ag(The Silver Searcher) を使う
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
" endif
"
"
" "vimfiler
" let g:vimfiler_as_default_explorer = 1
" "IDE like
" "command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
" nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>

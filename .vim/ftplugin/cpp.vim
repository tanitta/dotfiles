" nnoremap <silent> [make]m :<C-u>make!<Enter><CR>
nnoremap <silent> [make]m :<C-u>Unite -no-quit -no-start-insert -direction=botright -no-focus -winheight=8 -log build:!:make:-j6<CR>
" nnoremap <silent> [make]m :<C-u>QuickRun make -outputter/buffer/split ":botright 8sp"<CR>
nnoremap <silent> [make]M :<C-u>make! && make run<Enter><CR>

" nnoremap <silent> [make]r :<C-u>make run<Enter><CR>
nnoremap <silent> [make]r :<C-u>Unite -no-quit -no-start-insert -direction=botright -no-focus -winheight=8 -log build:make:run:!<CR>
" nnoremap <silent> [make]r :<C-u>QuickRun run -outputter/buffer/split ":botright 8sp"<CR>
" 
nnoremap <silent> [quickrun]q :<C-u>QuickRun cpp/clang++ -outputter/buffer/split ":botright"<CR>


" marching
" オプションを追加する場合
let g:marching_clang_command_option="-std=c++11 -w"

let g:marching_include_paths = filter(
			\ split(glob('/usr/include/c++/*'), '\n') +
			\ split(glob('/usr/include/*/c++/*'), '\n') +
			\ split(glob('/usr/include/*/'), '\n'),
			\ 'isdirectory(v:val)')



" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
			\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'


" 処理のタイミングを制御する
" 環境に合わせて間隔を短くする
set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)



autocmd BufWritePre * :QuickRun cpp/watchdogs_checker

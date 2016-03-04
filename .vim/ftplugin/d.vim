nnoremap <silent> [quickrun]q :<C-u>QuickRun d/rdmd -outputter/buffer/split ":botright"<CR>
nnoremap <silent> [quickrun]t :<C-u>QuickRun d/rdmd_unittest  -outputter/buffer/split ":botright"<CR>

nnoremap <silent> [make]m :<C-u>ScreenSend dub run<Enter><CR>
nnoremap <silent> [make]M :<C-u>ScreenSend dub run --compiler=ldc2<Enter><CR>
nnoremap <silent> [make]t :<C-u>ScreenSend dub test<Enter><CR>
" nnoremap <silent> [make]t :<C-u>ScreenSend dub test && mpg123 -q ~/Music/game01/crrect_answer3.mp3 \|\| mpg123 -q ~/Music/game01/blip01.mp3<Enter><CR>
nnoremap <silent> [make]p :<C-u>ScreenSend dub run --build=debug-profile<Enter><CR>
nnoremap <silent> [make]d :<C-u>ScreenSend dub run --build=docs<Enter><CR>

nnoremap [snowdrop] <Nop>
nmap \s [snowdrop]
nnoremap <silent> [snowdrop]s :<C-u>OverCommandLine<CR>
nnoremap <silent> [snowdrop]g :<C-u>DUjump<CR>
nnoremap <silent> [snowdrop]t :<C-u>DUvjump<CR>

DUDCDstartServer

" augroup d-auto;
"     autocmd!
"    " 末尾が " ' ) の場合に ; を追加する
"     autocmd InsertLeave *
" \   if &filetype == "d" && getline(".") =~ '["'')]$'
" \|      call setline(".", getline(".") . ";")
" \|  end
" augroup END
" 
" let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd', '~/.dub/packages/']
let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd']

" neocompleteと併用する場合の設定
if !exists("g:neocomplete#force_omni_input_patterns")
    let g:neocomplete#force_omni_input_patterns = {}
endif
autocmd FileType d setlocal omnifunc=dutyl#dComplete
let g:neocomplete#force_omni_input_patterns.d = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" '[^.[:digit:] *\t]\%(\.\|->\)\|::'

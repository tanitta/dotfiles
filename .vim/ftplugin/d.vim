nnoremap <silent> [quickrun]q :<C-u>QuickRun d/rdmd -outputter/buffer/split ":botright"<CR>
nnoremap <silent> [quickrun]t :<C-u>QuickRun d/rdmd_unittest  -outputter/buffer/split ":botright"<CR>

nnoremap <silent> [make]m :<C-u>ScreenSend dub run --compiler=ldc2<Enter><CR>
nnoremap <silent> [make]t :<C-u>ScreenSend dub test<Enter><CR>
nnoremap <silent> [make]d :<C-u>ScreenSend dub run --build=debug-profile<Enter><CR>

nnoremap [snowdrop] <Nop>
nmap \s [snowdrop]
nnoremap <silent> [snowdrop]s :<C-u>OverCommandLine<CR>
nnoremap <silent> [snowdrop]g :<C-u>DUjump<CR>
nnoremap <silent> [snowdrop]t :<C-u>DUvjump<CR>

" augroup dudcd_start_server
"   autocmd!
"   " autocmd VimEnter *.d DUDCDstartServer
"   autocmd BufAdd *.d echo "ﾋﾞﾑｩ"
" augroup END
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
let g:neocomplete#force_omni_input_patterns.d = '[^.[:digit:] *\t]\%(\.\|->\)\|::'

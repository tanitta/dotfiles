" filetype indent off
" setlocal nocindent
" setlocal autoindent
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

nnoremap <silent> [quickrun]q :<C-u>QuickRun d/rdmd -outputter/buffer/split ":botright"<CR>
nnoremap <silent> [quickrun]t :<C-u>QuickRun d/rdmd_unittest  -outputter/buffer/split ":botright"<CR>

nnoremap <silent> [make]m :<C-u>ScreenSendW dub run<Enter><CR>
nnoremap <silent> [make]M :<C-u>ScreenSendW dub run -f<Enter><CR>

nnoremap <silent> [make]t :<C-u>ScreenSendW dub test <Enter><CR>
nnoremap <silent> [make]T :<C-u>ScreenSendW dub test -f <Enter><CR>

nnoremap <silent> [make]r :<C-u>ScreenSendW dub run --compiler=ldc2 --build=optimized<Enter><CR>
nnoremap <silent> [make]R :<C-u>ScreenSendW dub run --compiler=ldc2 --build=optimized -f<Enter><CR>
nnoremap <silent> [make]s :<C-u>ScreenSendW dub run --build=spec<Enter><CR>
" nnoremap <silent> [make]t :<C-u>ScreenSend dub test && mpg123 -q ~/Music/game01/crrect_answer3.mp3 \|\| mpg123 -q ~/Music/game01/blip01.mp3<Enter><CR>
nnoremap <silent> [make]p :<C-u>ScreenSendW dub run --build=debug-profile<Enter><CR>
nnoremap <silent> [make]d :<C-u>ScreenSendW dub run --build=docs<Enter><CR>

nnoremap <silent> [make]c :<C-u>ScreenCancel<CR>

nnoremap [snowdrop] <Nop>
nmap \s [snowdrop]
nnoremap <silent> [snowdrop]s :<C-u>OverCommandLine<CR>
nnoremap <silent> [snowdrop]g :<C-u>DUjump<CR>
nnoremap <silent> [snowdrop]t :<C-u>DUvjump<CR>
nnoremap <silent> [snowdrop]d :<C-u>DUddoc<CR>

" DUDCDstartServer
let g:deoplete#sources#d#dcd_server_autostart = 1
let g:deoplete#sources#d#load_dub = 1
let g:deoplete#sources#d#std_path = '/usr/local/include/dlang/dmd'

" " augroup d-auto;
" "     autocmd!
" "    " 末尾が " ' ) の場合に ; を追加する
" "     autocmd InsertLeave *
" " \   if &filetype == "d" && getline(".") =~ '["'')]$'
" " \|      call setline(".", getline(".") . ";")
" " \|  end
" " augroup END
" " 
" " let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd', '~/.dub/packages/']
" let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd']
"
" neocompleteと併用する場合の設定
" if !exists("g:deoplete#omni#input_patterns")
"     let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns = {}
"
" autocmd FileType d setlocal omnifunc=dutyl#dComplete
" let g:deoplete#omni#input_patterns.d = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" let g:deoplete#omni#input_patterns.d = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" " '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" " '[^.[:digit:] *\t]\%(\.\|->\)\|::'
" " '\% (because it \t]\.\|^\s*@\|^\s*import \ \w*')  
" " '[^.[:digit:] *\t]\.\|^\s*@\|^\s*import \ \w*'
" 
" let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_sort = 0
" let g:tagbar_foldlevel = 0 
" let g:tagbar_type_d = {
"             \ 'ctagstype' : 'd',
"             \ 'kinds'     : [
"             \ 'c:classes:1:1',
"             \ 'f:functions:1:1',
"             \ 'T:template:1:1',
"             \ 'g:enums:1:1',
"             \ 'e:enumerators:0:0',
"             \ 'u:unions:1:1',
"             \ 's:structs:1:1',
"             \ 'v:variables:1:0',
"             \ 'i:interfaces:1:1',
"             \ 'm:members',
"             \ 'a:alias'
"             \ ],
"             \'sro': '.',
"             \ 'kind2scope' : {
"             \ 'c' : 'class',
"             \ 'g' : 'enum',
"             \ 's' : 'struct',
"             \ 'u' : 'union',
"             \ 'T' : 'template'
"             \},
"             \ 'scope2kind' : {
"             \ 'enum'      : 'g',
"             \ 'class'     : 'c',
"             \ 'struct'    : 's',
"             \ 'union'     : 'u',
"             \ 'template'  : 'T'
"             \ },
"             \ 'ctagsbin' : 'dscanner',
"             \ 'ctagsargs' : ['--ctags']
"             \ }

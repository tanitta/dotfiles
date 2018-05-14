let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
let g:OmniSharp_server_type = 'v1'
let g:omnicomplete_fetch_full_documentation=1
set completeopt=longest,menuone
" set completeopt+=preview
" set splitbelow
let g:syntastic_cs_checkers = ['syntax', 'semantic']
augroup omnisharp_commands
    autocmd!

    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

	" let g:OmniSharp_selector_ui = 'unite'
    " let g:OmniSharp_typeLookupInPreview = 1
    " set completeopt=longest,menuone,preview

    ""Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    " let g:deoplete#sources.cs = ['omni', 'file', 'buffer', 'ultisnips']
    " let g:deoplete#omni#input_patterns.cs = ['\w*']
    " let g:deoplete#enable_smart_case = 1
    

    if !exists('g:deoplete#sources')
        let g:deoplete#sources = {}
    endif
    let g:deoplete#sources.cs = ['omni', 'file', 'buffer', 'ultisnips']

    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#omni#input_patterns.cs = '[\w.]+'
    " let g:deoplete#omni#input_patterns.cs = ['\.\w*']
    " let g:deoplete#omni#input_patterns.cs = '.*[^=\);]'

" let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
augroup END

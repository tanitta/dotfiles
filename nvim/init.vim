"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tanitta/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/tanitta/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Dark powered asynchronous completion framework for neovim
call dein#add('Shougo/deoplete.nvim')

" Dlang
call dein#add('idanarye/vim-dutyl')
call dein#add('landaire/deoplete-d')

" File Open
call dein#add('ctrlpvim/ctrlp.vim')

"highlight curso word"
call dein#add('osyo-manga/vim-brightest')

"display the indention levels with thin vertical lines"
call dein#add('Yggdroot/indentLine')

"'Yggdroot/indentLine'でconceallevel=2に書き換えられる対策用
call dein#add('elzr/vim-json')

" Run commands quickly.
call dein#add('thinca/vim-quickrun')

" Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes
call dein#add('tyru/caw.vim')

" Vim plugin: Mappings for simultaneously pressed keys
call dein#add('kana/vim-arpeggio')

" True Sublime Text style multiple selections for Vim
call dein#add('terryma/vim-multiple-cursors')

" Auto close parentheses and repeat by dot dot dot..."
call dein#add('cohama/lexima.vim')

" Vim motions on speed! 
call dein#add('Lokaltog/vim-easymotion')

" git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('cohama/agit.vim')

" A light and configurable statusline/tabline for Vim
call dein#add('itchyny/lightline.vim')

" text object
call dein#add('tpope/vim-surround')
call dein#add('kana/vim-textobj-user')
call dein#add('sgur/vim-textobj-parameter')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

runtime! userautoload/*.vim

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

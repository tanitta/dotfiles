set t_Co=256
set laststatus=2
colorscheme newcolor
set background=dark

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


set hlsearch

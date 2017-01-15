nnoremap <silent> [quickrun]q :<C-u>QuickRun irb<CR>
nnoremap <silent> [make]m :<C-u>QuickRun ruby<CR>

" rspec
" nnoremap <silent> [make]t :<C-u>ScreenSend bundle exec rspec<Enter><CR>

" minitest
nnoremap <silent> [make]t :<C-u>ScreenSend bundle exec rails test<Enter><CR>

"Force the old regex engine to fix the problem that slow down cursor moving.
" set re=1

" nnoremap <silent> [ruby]p :<C-u>QuickRun rp5<CR>
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

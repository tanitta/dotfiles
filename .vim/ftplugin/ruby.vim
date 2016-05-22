nnoremap <silent> [quickrun]q :<C-u>QuickRun irb<CR>
nnoremap <silent> [make]m :<C-u>QuickRun ruby<CR>

nnoremap <silent> [make]t :<C-u>ScreenSend bundle exec rspec<Enter><CR>

"Force the old regex engine to fix the problem that slow down cursor moving.
" set re=1

" nnoremap <silent> [ruby]p :<C-u>QuickRun rp5<CR>

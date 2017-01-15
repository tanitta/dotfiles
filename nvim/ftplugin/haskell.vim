" nnoremap <silent> [haskell]t :<C-u>GhcModType<CR>
nnoremap <silent> [make]m :<C-u>QuickRun haskell<CR>
nnoremap <silent> [quickrun]q :<C-u>QuickRun haskell -outputter/buffer/split ":botright"<CR>

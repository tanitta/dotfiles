let g:rustfmt_autosave = 1
let g:rustfmt_command = $HOME . '/.cargo/bin/rustfmt'

set hidden
let g:racer_cmd = $HOME . '/.cargo/bin/racer'

nnoremap <silent> [quickrun]q :<C-u>QuickRun rust -outputter/buffer/split ":botright"<CR>

nnoremap <silent> [make]m :<C-u>ScreenSend cargo run<Enter><CR>
nnoremap <silent> [make]t :<C-u>ScreenSend cargo test<Enter><CR>
nnoremap <silent> [make]b :<C-u>ScreenSend cargo build<Enter><CR>
nnoremap <silent> [make]r :<C-u>ScreenSend cargo build --release<Enter><CR>

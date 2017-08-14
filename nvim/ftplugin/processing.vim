" nnoremap <silent> [processing]m :<C-u>QuickRun processing<CR>
" nnoremap <silent> [make]m :<C-u>QuickRun processing  -direction=botright -winheight=8 -log -outputter/buffer/split <CR>
nnoremap <silent> [make]m :<C-u>ScreenSend processing-java --sketch=`pwd` --output=/tmp/processing --force --run<Enter><CR>
nnoremap <silent> [make]t :<C-u>ScreenSend processing-java --sketch=`pwd` --output=/tmp/processing --force --build<Enter><CR>
" nnoremap <silent> [make]m :<C-u>:make<CR>

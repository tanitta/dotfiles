let g:quickrun_config.processing = {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\     'command': 'processing-java',
\     'exec': '%c --sketch=%s:p:h/ --output=/tmp/processing --run --force' }

" nnoremap <silent> [processing]m :<C-u>QuickRun processing<CR>
nnoremap <silent> [make]m :<C-u>QuickRun processing -outputter/buffer/split ":botright"<CR>

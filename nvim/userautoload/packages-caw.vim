" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:hatpos:toggle)
vmap \c <Plug>(caw:hatpos:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:hatpos:uncomment)
vmap \C <Plug>(caw:hatpos:uncomment)

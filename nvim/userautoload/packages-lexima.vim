" ,の後にスペースを入れる
call lexima#add_rule({
\ "at" : '\%#',
\ "char" : ",",
\ "input" : ",<Space>",
\})
" ", " の後にスペースを続けれないようにする
" 誤爆防止用
call lexima#add_rule({
\   "at" : ', \%#',
\   "char" : '<Space>',
\   "input" : "",
\})
" ", "の後に改行したら末尾のスペースを消す
call lexima#add_rule({
\   "at" : ', \%#',
\   "char" : '<Enter>',
\   "input" : '<BS><Enter>',
\})

let g:lexima_enable_newline_rules=1

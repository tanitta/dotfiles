let g:quickrun_config = {
\   "cpp/clang++" : {
\       "cmdopt" : "-std=c++11 -w -pthread",
\       "hook/time/enable" : 1
\   },
\	"make" : {
\		"command" : "make",
\		"cmdopt" : "Debug -j6",
\		"exec" : "%c %o",
\		"runner" : "vimproc",
\	},
\	"run" : {
\		"command" : "make",
\		"cmdopt" : "RunDebug -j6",
\		"exec" : "%c %o",
\		"runner" : "vimproc",
\	},
\	"d/dmd" : {
\		"command" : "dmd",
\		"cmdopt" : "-run", 
\		'tempfile': "d.d"
\	},
\	'd/rdmd': {
\		'command': 'rdmd',
\		'tempfile': 'd.d'
\	},
\	'd/rdmd_unittest': {
\		'command': 'rdmd',
\		"cmdopt" : "-unittest", 
\		'tempfile': 'd.d'
\	},
\	"rp5" : {
\		"command" : "rp5",
\		"cmdopt" : "run"
\	},
\   "cpp/watchdogs_checker" : {
\       "type" : "watchdogs_checker/clang++",
\   },
\   "watchdogs_checker/clang++" : {
\		"command" : "make",
\		"cmdopt" : "CXXFLAGS=-fsyntax-only -j4 ",
\		"exec" : "%c %o",
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 4,
\   },
\}

let g:quickrun_config.processing = {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\     'command': 'processing-java',
\     'exec': '%c --sketch=%s:p:h/ --output=/tmp/processing --force --run ' }

" let s:hook = {
" \   "name" : "add_include_option",
" \   "kind" : "hook",
" \   "config" : {
" \       "enable" : 0,
" \   },
" \}
" function! s:hook.on_normalized(context, session)
"     let paths = filter(split(&path, ","), "len(v:val) && v:val !='.'")
"     if len(paths)
"         let a:context.config.cmdopt .= " -I".join(paths, " -I")
"     endif
" endfunction
"
"
" call quickrun#module#register(s:hook, 1)
" unlet s:hook
" 
" 
" :QuickRun -outputter my_outputter
" プロセスの実行中は、buffer に出力し、
" プロセスが終了したら、quickfix へ出力を行う


" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" 実行が成功すればバッファへ、失敗すれば quickfix へ出力する
" :QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix

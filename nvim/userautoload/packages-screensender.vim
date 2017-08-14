let g:vim_to_screen_names = []
function! s:ScreenStart(name, type)
	for index in g:vim_to_screen_names
		if index == a:name
			return
		endif
	endfor
	let command = "screen -S " . a:name
	" let result = system("urxvt". ' -e ' . command . ' &')
	let script = "open-iterm-pane-with-".a:type
	let result = system(script." \"".command."\"")
	call add( g:vim_to_screen_names, a:name)
	return result
endfunction
command! -nargs=0 ScreenStart  call s:ScreenStart("VIM", "n")
command! -nargs=0 ScreenStartN call s:ScreenStart("VIM", "n")
command! -nargs=0 ScreenStartV call s:ScreenStart("VIM", "v")
command! -nargs=0 ScreenStartH call s:ScreenStart("VIM", "h")

function! s:ScreenQuit(screen_name)
	for index in g:vim_to_screen_names
		if index == a:screen_name
			let result = system("screen". ' -S ' . a:screen_name. ' -X quit')
		endif
	endfor
endfunction
command! -nargs=0 ScreenQuit call s:ScreenQuit("VIM")

function! s:ScreenQuitAll()
	for index in g:vim_to_screen_names
		let result = system("screen". ' -S ' . index. ' -X quit')
	endfor
endfunction

augroup vim_to_screen
	autocmd!
	autocmd VimLeave * call s:ScreenQuitAll()
augroup END

function! s:ScreenSend(screen_name, command, is_write)
	" for index in g:vim_to_screen_names
	" 	if index == a:screen_name
	if a:is_write
		w
	endif
			let result = system("screen -S ".a:screen_name. " -X ". "stuff '". a:command . ''. "'")
	" 	endif
	" endfor
endfunction
command! -nargs=1 ScreenSend call s:ScreenSend("VIM",<f-args>, 0)
command! -nargs=1 ScreenSendW call s:ScreenSend("VIM",<f-args>, 1)

function! s:ScreenCancel(screen_name)
	let result = system("screen -S ".a:screen_name. " -X ". "stuff '". ''. "'")
endfunction

command! -nargs=0 ScreenCancel call s:ScreenCancel("VIM")

" function! s:ScreenSendEasily(screen_name, command)
" 	for index in g:vim_to_screen_names
" 		if index == a:screen_name
" 			return
" 		endif
" 	endfor
" 	let command = "screen -S " . a:screen_name
" 	let screen_cmd = "screen -S ".a:screen_name. " -X ". "stuff '". a:command . '^M'. "'"
" 	let result = system("urxvt". ' -e ' . command . ' &&'. screen_cmd)
" 	echo result
" 	call add( g:vim_to_screen_names, a:screen_name)
" endfunction
" command! -nargs=1 ScreenSendEasily call s:ScreenSendEasily("vim",<f-args>)

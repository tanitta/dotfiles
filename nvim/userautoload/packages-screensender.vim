let g:vim_to_screen_names = []
function! s:ScreenStart(name)
	for index in g:vim_to_screen_names
		if index == a:name
			return
		endif
	endfor
	let command = "screen -S " . a:name
	let result = system("urxvt". ' -e ' . command . ' &')	
	call add( g:vim_to_screen_names, a:name)
	return result
endfunction
command! -nargs=0 ScreenStart call s:ScreenStart("vim")

function! s:ScreenQuit(screen_name)
	for index in g:vim_to_screen_names
		if index == a:screen_name
			let result = system("screen". ' -S ' . a:screen_name. ' -X quit')
		endif
	endfor
endfunction
command! -nargs=0 ScreenQuit call s:ScreenQuit("vim")

function! s:ScreenQuitAll()
	for index in g:vim_to_screen_names
		let result = system("screen". ' -S ' . index. ' -X quit')
	endfor
endfunction

augroup vim_to_screen
	autocmd!
	autocmd VimLeave * call s:ScreenQuitAll()
augroup END

function! s:ScreenSend(screen_name, command)
	for index in g:vim_to_screen_names
		if index == a:screen_name
			let result = system("screen -S ".a:screen_name. " -X ". "stuff '". a:command . '^M'. "'")
		endif
	endfor
endfunction
command! -nargs=1 ScreenSend call s:ScreenSend("vim",<f-args>)

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

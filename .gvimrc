if has("gui_running")
	if has("gui_gtk2")
		set guifont=DroidSansMono\ 9
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
endif

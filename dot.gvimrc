set guioptions-=m  "Disable menu
set guioptions-=T  "Disable toolbar
"set guifont=Inconsolata\ 12
"set guifont=Consolas\ 11
if has("gui_macvim")
	set guifont=Monaco:h12
else
	set guifont=Monaco\ 10
endif
"map <F3> <ESC>:set guifont=Inconsolata\ 11<CR>
"map <F4> <ESC>:set guifont=Inconsolata\ 12<CR>

" Set the color schema
"let g:solarized_contrast="high"    	"default value is normal
"let g:solarized_visibility="high"    	"default value is normal
"let g:solarized_hitrail=1    		"default value is 0
"set background=dark
"colors solarized
"colors torte
"colors desert

"set columns=140
"set lines=50
set number
set cursorline
"highlight col79 guibg=red
"match col79 /\%<80v.\%>79v/

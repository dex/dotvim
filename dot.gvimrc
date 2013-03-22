set guioptions-=m  "Disable menu
set guioptions-=T  "Disable toolbar
set guifont=Consolas\ 10
"set guifont=Monospace\ 11
map <F3> <ESC>:set guifont=Consolas\ 10<CR>
map <F4> <ESC>:set guifont=Consolas\ 12<CR>

" Set the color schema
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
"let g:solarized_hitrail=1    "default value is 0
set background=dark
colors solarized
"colors torte
"colors desert

set columns=160
set lines=66
set number
set cursorline
"highlight col79 guibg=red
"match col79 /\%<80v.\%>79v/

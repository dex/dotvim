" Genernal setting {{{1
set foldmethod=marker
set autoindent
set cindent
set cinoptions=(0
set smarttab
set enc=taiwan
set fileencoding=taiwan
set hls                
set nocompatible
set ruler
syntax on
highlight Search term=reverse ctermbg=4 ctermfg=7
filetype indent on
filetype plugin on
"set listchars=tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
"set showbreak=↪

" encodings {{{1
set fileencoding=utf-8
set fileencodings=utf-8,big5,ucs-bom,gbk,latin1
"set ffs=unix,dos
"set ff=unix
set encoding=utf-8
set termencoding=utf-8

" tab setup {{{1
au BufRead,BufNewFile *.py set ts=4 sw=4 et
au BufRead,BufNewFile *.c,*.cc,*.h set ts=4 sw=4 et

" Co-existed with tmux {{{1
if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

" jQuery syntax {{{1
"au BufRead,BufNewFile *.js set ft=javascript.jquery

" Pathogen {{{1
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
silent! execute pathogen#helptags()

" TagList {{{1
nnoremap <silent> <F11> :Tlist<CR>
nnoremap <silent> <F9> :wincmd p<CR>
let Tlist_WinWidth = 45
let Tlist_Show_One_File = 1

" Rebuild tags {{{1
nmap <F5> :!uptag<CR>

" CVS {{{1
let CVSCommandEdit='split'
"let CVSCommandDiffOpt='wbBup'
let CVSCommandDiffOpt='up'

" for PHP fold plugin {{{1
"map <F5> <Esc>:EnableFastPHPFolds<Cr>
"map <F6> <Esc>:EnablePHPFolds<Cr>
"map <F7> <Esc>:DisablePHPFolds<Cr> 
"let php_folding=0
"source ~/.vim/plugin/phpfolding.vim 
"set tags+=~/.vim/systags
set completeopt=longest,menu

" Set cscope {{{1
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		if (path[0] != '/')
			let path = getcwd() . '/' . path
		endif
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
nmap <S-F12> :copen<CR>
nmap <S-F11> :cclose<CR>
nmap <S-CR> :cc<CR>
nmap <S-Up> :cp<CR>
nmap <S-Down> :cn<CR>
nmap <S-Left> :cold<CR>
nmap <S-Right> :cnew<CR>
nmap <C-MiddleMouse> <LeftMouse>:cs find s <C-R>=expand("<cword>")<CR><CR>

" minibufexplorer {{{1
let g:miniBufExplorerMoreThanOne=10000
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" acp {{{1
"let g:acp_behaviorSnipmateLength=1
let g:acp_completeOption = '.,w,b,u,t,i,k,d'

" clang-complete {{{1
let g:clang_user_options='|| exit 0'
let g:clang_auto_select=1

" highlight column 79 {{{1
"highlight col79 ctermbg=red
"match col79 /\%<80v.\%>79v/

" ultisnips {{{1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERD Tree {{{1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 35
"let g:NERDTreeShowBookmarks = 1
map <F7> :NERDTreeToggle<CR>
map <F2> cd<F5>Pcd:cs r<CR>

" Tagbar {{{1
let g:tagbar_left = 0
let g:tagbar_expand = 1
let g:tagbar_width = 35
highlight link TagbarSignature helpNote
map <F8> :TagbarToggle<CR>

" airline {{{1
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" CtrlP {{{1
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "BookmarkDir", "Buffer", "MRU"], v:count)'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_max_files = 0

"ColorSchema {{{1
"colors vividchalk
colors molokai
set background=dark

" MyIDE {{{1
map <F12> :copen 8<CR>:NERDTreeToggle<CR>:TagbarToggle<CR><C-w>l
map <C-\> :!cl <C-R>=fnameescape(expand("<cWORD>"))<CR><CR>

" vimwiki {{{1
let g:vimwiki_list = [{
 \ 'path': '~/Documents/vimwiki/',
 \ 'path_html': '~/public_html/',
 \ 'diary_rel_path' : '',
 \ 'template_path': '~/Documents/vimwiki/templates/',
 \ 'template_default': 'default',
 \ 'template_ext': '.html',
 \ 'auto_export': 1,
 \ 'nested_syntaxes': {'python': 'python', 'bash': 'sh', 'c++': 'cpp', 'diff': 'diff'}
 \ }]
nmap <leader>t <Plug>VimwikiToggleListItem
au FileType vimwiki set sw=2 et foldmethod=manual

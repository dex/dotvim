" Genernal setting {{{1
set foldmethod=marker
set autoindent
set cindent
set smarttab
set enc=taiwan
set fileencoding=taiwan
set hls                
set nocompatible
set ruler
syntax on
highlight Search term=reverse ctermbg=4 ctermfg=7
colors torte
filetype indent on
filetype plugin on

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

" jQuery syntax {{{1
"au BufRead,BufNewFile *.js set ft=javascript.jquery

" Pathogen {{{1
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" TagList {{{1
nnoremap <silent> <F11> :Tlist<CR>
nnoremap <silent> <F9> :wincmd p<CR>
let Tlist_WinWidth = 45
let Tlist_Show_One_File = 1

" Rebuild tags {{{1
nmap <F5> <Esc>:!uptag<Cr><Esc>:cs r<CR>

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
nmap <S-F12> <Esc>:copen<CR>
nmap <S-F11> <Esc>:cclose<CR>
nmap <S-CR> <Esc>:cc<CR>
nmap <S-Up> <Esc>:cp<CR>
nmap <S-Down> <Esc>:cn<CR>
nmap <S-Left> <Esc>:cold<CR>
nmap <S-Right> <Esc>:cnew<CR>

" minibufexplorer {{{1
let g:miniBufExplorerMoreThanOne=10000
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" acp {{{1
"let g:acp_behaviorSnipmateLength=1
let g:acp_completeOption = '.,w,b,u,t,i,k'

" highlight column 79 {{{1
"highlight col79 ctermbg=red
"match col79 /\%<80v.\%>79v/

" ultisnips {{{1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERD Tree {{{1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 45
map <F8> <ESC>:NERDTreeToggle<CR>
map <F2> <ESC>cd<ESC>:cs r<CR>

" Tagbar {{{1
let g:tagbar_left = 1
let g:tagbar_expand = 1
let g:tagbar_width = 45
highlight link TagbarSignature helpNote
map <F12> <ESC>:TagbarToggle<CR>

" powerline {{{1
let g:Powerline_symbols = 'fancy'
set t_Co=256
set laststatus=2

" CtrlP {{{1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

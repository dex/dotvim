" [ Vundle ] {{{1
set nocompatible	" be iMproved, required

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif

filetype off		" required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
" {Addon}
Plugin 'vimwiki/vimwiki'
Plugin 'calendar.vim--Matsumoto'
Plugin 'scrooloose/nerdtree.git'
Plugin 'majutsushi/tagbar'
Plugin 'benmills/vimux'
Plugin 'csexton/jekyll.vim'
Plugin 'bling/vim-airline'
" {Look and Feel}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vividchalk.git'
Plugin 'drmikehenry/vim-fontsize.git'
Plugin 'tomasr/molokai'
" {Programming}
Plugin 'a.vim'
Plugin 'godlygeek/tabular.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic.git'
" {Formating}
Plugin 'DrawIt'
" {Auto-completion}
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
" {Haskell}
Plugin 'bitc/lushtags'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'kana/vim-filetype-haskell'
Plugin 'Twinside/vim-haskellFold'
Plugin 'Twinside/vim-hoogle'
Plugin 'eagletmt/neco-ghc'
" {My Plugin}
Plugin 'dex/p4.vim'

call vundle#end()		"required

" Install plugins the first time vim runs
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	PluginInstall
endif

filetype plugin indent on	"required

" [ Genernal setting ] {{{1
set foldmethod=marker
set autoindent
set cindent
set cinoptions=(0
set smarttab
set enc=taiwan
set fileencoding=taiwan
set hls
set ruler
syntax on
highlight Search term=reverse ctermbg=4 ctermfg=7
"set listchars=tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
"set showbreak=↪

" encodings
set fileencoding=utf-8
set fileencodings=utf-8,big5,ucs-bom,gbk,latin1
"set ffs=unix,dos
"set ff=unix
set encoding=utf-8
set termencoding=utf-8

" tab setup
au BufRead,BufNewFile *.py set ts=4 sw=4 et
au BufRead,BufNewFile *.c,*.cc,*.h set ts=4 sw=4 et

" Co-existed with tmux
if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

" [ Rebuild tags ] {{{1
nmap <F5> :!uptag<CR>

" [ Cscope ] {{{1
if has("cscope")
	set csprg=cscope
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
		if (!empty(path) && path[0] != '/')
			let path = getcwd() . '/' . path
		endif
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter * call LoadCscope()
nmap <Leader>\s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>\i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>\d :cs find d <C-R>=expand("<cword>")<CR><CR>
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

" [ ultisnips ] {{{1
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
	if pumvisible()
	    return "\<C-n>"
	else
	    call UltiSnips#JumpForwards()
	    if g:ulti_jump_forwards_res == 0
		return "\<TAB>"
	    endif
	endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
set completeopt=longest,menu

" [ NERD Tree ] {{{1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 35
"let g:NERDTreeShowBookmarks = 1
map <F7> :NERDTreeToggle<CR>
map <F2> cd<F5>Pcd:cs r<CR>
function! TryNTFind()
	if !exists("t:NERDTreeBufName") 
	elseif bufwinnr(t:NERDTreeBufName) == -1 
	elseif !empty(&buftype) 
	elseif empty(bufname("%"))
	else
		try | NERDTreeFind | catch | wincmd p | return | endtry
		exec bufwinnr(t:NERDTreeBufName)."wincmd w"
		exec "normal zz"
		wincmd p
	endif
endfunction
autocmd BufWinEnter,WinEnter * call TryNTFind()

" [ Tagbar ] {{{1
let g:tagbar_left = 0
let g:tagbar_expand = 1
let g:tagbar_width = 35
highlight link TagbarSignature helpNote
map <F8> :TagbarToggle<CR>

" [ airline ] {{{1
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

" [ CtrlP ] {{{1
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "BookmarkDir", "Buffer", "MRU", "BufTag"], v:count)'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]buildroot[\/](tools|toolchain|build)$'

" [ ColorSchema ] {{{1
"colors vividchalk
colors molokai
set background=dark

" [ Vimux ] {{{1
map <Leader>\a :VimuxRunLastCommand<CR>
map <Leader>\l :VimuxRunLastCommand<CR>
map <Leader>\r :VimuxPromptCommand<CR>
map <Leader>\p :VimuxPromptCommand<CR>
map <Leader>\q :VimuxCloseRunner<CR>

" [ MyIDE ] {{{1
map <F12> :copen 8<CR>:NERDTreeToggle<CR>:TagbarToggle<CR>2<C-w>w
function! OpenIDE(proj)
	if &term == "builtin_gui"
		set columns=140
		set lines=50
	endif
	execute "normal 1\<C-P>".a:proj."\<C-X>\<F12>"
endfunction
command -nargs=1 Ide call OpenIDE(<f-args>)
command -nargs=1 Proj call OpenIDE(<f-args>)

" [ vimwiki ] {{{1
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

" [ Jekyll ] {{{1
au BufRead,BufNewFile *.md set ft=markdown
let g:jekyll_path = "~/Develop/dex.github.io"
let g:jekyll_post_suffix = "md"
let g:jekyll_prompt_tags = "true"
let g:jekyll_prompt_categories = "true"

" [ p4.vim ] {{{1
let g:P4UseTab = 1

" [ Haskell mode ] {{{1
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/google-chrome"
let g:haskellmode_completion_ghc=0
let g:haskellmode_completion_haddock=0
let g:haddock_indexfiledir=$HOME."/.vim/"

" [ YCM ] {{{1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" [ neco-ghc ] {{{1
au BufRead,BufNewFile *.hs setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

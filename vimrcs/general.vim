"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Set Map Leader
	let mapleader = ","

	" Set to auto read when a file is changed from the outside
	set autoread

    "" Searching
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " Set indenting
    set autoindent
    set copyindent
    set smartindent

	" Speed up response to ESC key
	set notimeout
	set ttimeout
	set timeoutlen=100

    " Enable hidden buffers
    set hidden

	" For regular expressions
    set magic

	" Specify the behavior when switching between buffers
    try
        set switchbuf=useopen,usetab,newtab
        set stal=2
    catch
    endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Colorscheme
	set background=dark
	colorscheme molokai

	" Show line number
    set number

	" Don't redraw while executing macros (good performance config)
    set lazyredraw

    " Set font according to system
	if has("mac") || has("macunix")
		set guifont=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
	elseif has("win16") || has("win32")
		set guifont=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
	elseif has("gui_gtk2")
		set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
	elseif has("linux")
		set guifont=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
	elseif has("unix")
		set guifont=Monospace\ 11
	endif

	" Disable scrollbars
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L

	" Highlight current line in insert mode.
    if has("autocmd")
        autocmd InsertLeave * se nocul
        autocmd InsertEnter * se cul
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set ruler			" Always Show Current Position
	set so=7			" Set 7 lines to the cursor - when moving vertically using j/k
	set cmdheight=1		" Height of the Command Bar
	set showmatch		" Show matching brackets when text indicator is over them

	" No annoying sound on errors
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500

	" Properly disable sound on errors on MacVim
	if has("gui_macvim")
		autocmd GUIEnter * set vb t_vb=
	endif

    " Wild menu settings
	set wildmenu
    set wildmode=list:longest,full
	set wildignore=*.o,*~,*.pyc,*.sw?,*.orig,*.git,*.gitignore,*.hg,*.svn,*.DS_Store

	" Configure backspace so it acts as it should act
	set backspace=eol,start,indent
	set whichwrap+=<,>,h,l

	" Avoid garbled characters in Chinese - Windows OS
	let $LANG='en'
	set langmenu=en
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Enable syntax highlighting
	syntax enable

    " Encoding
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8

    " Use Unix as the standard file type
    set fileformats=unix,dos,mac

	" Enable 256 colors palette in Gnome Terminal
	if $COLORTERM == 'gnome-terminal'
		set t_Co=256
	endif

	" Set extra options when running in GUI mode
	if has("gui_running")
		set guioptions-=T
		set guioptions-=e
		set t_Co=256
		set guitablabel=%M\ %t
	endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Turn off backup files
	set nobackup
	set nowb
	set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set expandtab		" Use spaces instead of tabs
	set smarttab		" Be smart when using tabs ;)
	set autoindent		" Auto indent
	set nowrap 			" Don't wrap lines

	" 1 tab == 4 spaces
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4

	" Linebreak on 500 characters
	set linebreak
	set tw=500

	" Return to last edit position when opening files (You want this!)
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
	" Always show the status line
	set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Set lanaguage and highlighting
	setlocal spelllang=en_us,fr
    hi clear SpellBad
    hi SpellBad cterm=underline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Delete trailing white space on save
	fun! CleanExtraSpaces()
		let save_cursor = getpos(".")
		let old_query = getreg('/')
		silent! %s/\s\+$//e
		call setpos('.', save_cursor)
		call setreg('/', old_query)
	endfun

	" Returns true if paste mode is enabled
		function! HasPaste()
			if &paste
				return 'PASTE MODE  '
			endif
			return ''
		endfunction


""""""""""""""""""""""""""""""
" => Molokai
""""""""""""""""""""""""""""""
    set background=dark
    colorscheme molokai


""""""""""""""""""""""""""""""
" => Nerdtree
""""""""""""""""""""""""""""""
    let g:NERDTreeRespectWildIgnore = 1
    let g:NERDTreeShowHidden=1

    map <F9> :NERDTreeToggle <CR>


""""""""""""""""""""""""""""""
" => Vim-Better-Whitespace
""""""""""""""""""""""""""""""
    let g:better_whitespace_enabled=1
    let g:strip_whitespace_on_save=1


" User Options
let tab_size=2
let mapleader=','
let $MYVIM=$HOME . '/.vim'


" Sections
"  - Settings
"    - Directory
"    - Bells / Notifications
"    - Mouse
"    - TUI
"    - Terminal
"    - Status Line
"    - Movement
"    - vimdiff
"    - Files
"    - Wildignore
"    - Filetype
"    - Spaces
"    - Linebreaks
"    - Folds
"    - Buffers
"    - Undo
"    - Search
"    - Language
"  - Helper Functions
"  - Key Mappings


" Directory
set autochdir
set cdhome


" Bells
set noerrorbells
set visualbell
set t_vb=
set belloff=all


" Mouse
set mousehide


" TUI
set cmdheight=2
set laststatus=2
set shortmess=aOtTAI
set ruler
set number
set cursorline
set cursorlineopt=number


" Term
set termencoding=utf-8
set ttimeout
set ttimeoutlen=500
set ttyfast


" Status Line
set statusline=
set statusline+=%#ModeMsg#\ %n
set statusline+=\ %#CursorLineSign#\ %{&spelllang}
set statusline+=\ %#StatusLine#\ %<%f\ %m\ %r\ %h\ %w
set statusline+=\ %=\ %{&filetype}
set statusline+=\ \|\ %{&fenc}
set statusline+=\ \+\ %{&ff}
set statusline+=\ \|\ %c\:%l\/%L\ %p%%
set statusline+=\ %#ModeMsg#\ %{strftime(\"%H:%M:%S\")}


" Movement
set scrolloff=5


" vimdiff
set diffopt+=vertical,icase,iwhite


" Files
set autoread
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set fileformats=unix
set fileignorecase
set nrformats-=octal


" Wildignore
set wildmode=list:longest
set wildignore&


" Filetype
let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'
filetype plugin indent on
syntax on


" Spaces
set autoindent
set copyindent
set preserveindent
set shiftround
set expandtab
let &tabstop=tab_size
let &shiftwidth=tab_size
set smarttab


" Linebreaks
set wrap
set cpoptions+=n
set linebreak
set showbreak=...
set breakindent
let &breakindentopt='min:40,shift:' . (2*tab_size) . ',sbr'


" Folds
set foldenable
set foldlevelstart=99
set foldmethod=indent
set showmatch


" Buffers
set hidden  " allows unfocused tabs to remain in buffer instead of writing changes
set switchbuf=useopen
set splitright


" Undo
set noswapfile
if has('persistent_undo')
  let &undodir=$HOME . '/.vim/undodir/'
  set undofile
endif


" Search
set hlsearch
set incsearch
set ignorecase


" Language
set langmenu=none
set nospell
set spelllang=en_us
set spellsuggest+=5


"""""""""""""""""""""""""""
"     Helper Funcions     "
"""""""""""""""""""""""""""
" Highlights words when using search, removes highlight when not
augroup ToggleHighlightSearch
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


" Delete trailing white space on save, useful for some filetypes ;)
" - from amix/vimrc
func CleanExtraSpaces()
  let save_cursor=getpos(".")
  let old_query=getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunc


let dont_clean=[]
augroup OnWrite
  if has('autocmd') && exists('did_load_filetypes')
    autocmd!
    " clean trailing spaces
    autocmd BufWritePre *.* if index(dont_clean, &ft) < 0 | call CleanExtraSpaces() | endif

    if executable('pandoc')
      " output equilvant *.pdf, if possible
      autocmd BufWritePost *.md let @a=substitute(system('pandoc --mathjax ' . @% . ' -o ' . shellescape(expand('%:r') . '.pdf')), '\n', '', 'g') | @a ==? '' ? echo '' : echoerr @a
    endif
  endif
augroup END


""""""""""""""""""""""""
"     Key Mappings     "
""""""""""""""""""""""""
" Enhanced Movement
map H ^
map L $
map J <PageDown>
map K <PageUp>


" Quick Save
nmap <leader>w :w!<cr>


" System Clipboard: copy / cut / paste
" - whole line in normal
" - selected area in visual
nmap <leader>cy "+yy
vmap <leader>cy "+y
nmap <leader>cd "+dd
vmap <leader>cd "+d
nmap <leader>cp "+p

" Format Text
" - fc (format clean): make text in clipboard vim-friendly
nmap <leader>fc :let @+=substitute(substitute(strtrans(@+),'-\^@','','g'),'\^@',' ','g')<cr>


" Spell Check:  toggle / next / prev / add / select
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

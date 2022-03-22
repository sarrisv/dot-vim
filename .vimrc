"""""""""""""""""""""""""""""""""
" Sections                      "
" - User Settings               "
" - Options                     "
"   - Directory                 "
"   - Bells / Notifications     "
"   - Mouse                     "
"   - TUI                       "
"   - Terminal                  "
"   - Status Line               "
"   - Movement                  "
"   - vimdiff                   "
"   - Files                     "
"   - Wildignore                "
"   - Filetype                  "
"   - Spaces                    "
"   - Linebreaks                "
"   - Folds                     "
"   - Buffers                   "
"   - Undo                      "
"   - Search                    "
"   - Language                  "
" - Helper Functions            "
"   - ToggleHighlightSearch     "
"   - CleanTrailingSpaces       "
"   - OnWrite                   "
" - Non-Leader Mappings         "
"   - Cursor Movement           "
"   - Window Movement           "
" - Leader Mappings             "
"   - Clipboard                 "
"   - Formatting                "
"   - Spell Check               "
"   - Tab Controls              "
"   - Window Controls           "
"   - Buffer Controls           "
"""""""""""""""""""""""""""""""""



""""""""""""""""""""""""
" => User Settings     "
""""""""""""""""""""""""
let tab_size=2
let mapleader=','
let $MYVIM=$HOME . '/.vim'
let window_orientation='vertical' " vertical or horizontal, used to define key mappings



""""""""""""""""""""""
" => Vim Options     "
""""""""""""""""""""""
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
set switchbuf=useopen,usetab,newtab
set splitright
set splitbelow

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



""""""""""""""""""""""""""
" => Helper Funcions     "
""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""
" => Non-Leader Mappings     "
""""""""""""""""""""""""""""""
" Cursor Movement: left / right / down / up
map H ^
map L $
map J <PageDown>
map K <PageUp>

" Window Movement: left / right / down / up
"   - from to amix/vimrc
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings                                  "
"   - general style: <leader><prefix><command>        "
"     - prefix matches first letter of section        "
"     - command matches first letter of command       "
"       - movement follow vim-conventions instead     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard: yank / delete / paste
"   - whole line in normal
"   - selected area in visual
nmap <leader>cy "+yy
vmap <leader>cy "+y
nmap <leader>cd "+dd
vmap <leader>cd "+d
nmap <leader>cp "+p


" Format Text: clean
nmap <leader>fc :let @+=substitute(substitute(strtrans(@+),'-\^@','','g'),'\^@',' ','g')<cr>


" Spell Check:  toggle / prev / next / add / select
nmap <leader>ss :setlocal spell!<cr>
nmap <leader>sh [s
nmap <leader>sl ]s
nmap <leader>sa zg
nmap <leader>s? z=


" Tab Controls: new / edit / prev / next / close / only
"   - prev+next have no prefix since they are commonly used
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
nmap <leader>h :tabprevious<cr>
nmap <leader>l :tabnext<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>to :tabonly<cr>


" Window Controls: new / split / left / right / down / up
if (window_orientation=='vertical')
  nmap <leader>wn :vnew<cr>
  nmap <leader>ws :vsplit<cr>
else
  nmap <leader>wn :new<cr>
  nmap <leader>ws :split<cr>
endif

" Buffer Controls: prev / next
map <leader>bh :bprevious<cr>
map <leader>bl :bnext<cr>

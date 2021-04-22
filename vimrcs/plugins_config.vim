
call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'pechorin/any-jump.vim'

call plug#end()


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


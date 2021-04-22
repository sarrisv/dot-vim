"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Remap VIM 0 to first non-blank character
    map 0 ^

    " Fast Saving
    nmap <leader>w :w!<cr>

    " Quickly open a buffer for scribble
    map <leader>q :e ~/.vim/buffer<cr>

    " Quickly open a markdown buffer for scribble
    map <leader>x :e ~/.vim/buffer.md<cr>

    " Toggle paste mode on/off
    map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Close the current buffer
    map <leader>bd :Bclose<cr>:tabclose<cr>gT

    " Close all the buffers
    map <leader>ba :bufdo bd<cr>

    " Move to next buffer
    map <leader>bl :bnext<cr>

    " Move to previous buffer
    map <leader>bh :bprevious<cr>

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove
    map <leader>th :tabprev<cr>
    map <leader>tl :tabnext<cr>
    map <leader>tf :tabfind

    " Opens a new tab with the current buffer's path
    map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    " Next word
    map <leader>sn ]s

    " Previous Word
    map <leader>sp [s

    " Add word to dictionary
    map <leader>sa zg

    " Suggest alternatives
    map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
    function! <SID>BufcloseCloseIt()
        let l:currentBufNum = bufnr("%")
        let l:alternateBufNum = bufnr("#")

        if buflisted(l:alternateBufNum)
            buffer #
        else
            bnext
        endif

        if bufnr("%") == l:currentBufNum
            new
        endif

        if buflisted(l:currentBufNum)
            execute("bdelete! ".l:currentBufNum)
        endif
    endfunction


" :PlugInstall
" :w
" so %

call plug#begin('~/.vim/plugged')
        Plug 'pbondoer/vim-42header'
        Plug 'sainnhe/sonokai'
call plug#end()

if has ("syntax")
        syntax on
endif

set nu
" set showmatch
set mouse=a
set title
" set cindent
set clipboard=unnamedplus

if has('termguicolors')
        set termguicolors
endif
colorscheme sonokai

let g:hdr42user = 'ycha'
let g:hdr42mail = 'ycha@student.42seoul.kr'
let g:sonokai_style = 'shusia'
" let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

inoremap jj <esc>
inoremap qq <esc>
nnoremap 42h :Stdheader<enter>
inoremap std #include <stdio.h>
inoremap minit int<tab>main(void)<cr>{<cr>return (0);<cr>}<cr><esc>kk0

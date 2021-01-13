" :PlugInstall
" :w
" so %

call plug#begin('~/.vim/plugged')
        Plug 'pbondoer/vim-42header'
        Plug 'sainnhe/sonokai'
	Plug 'preservim/nerdtree'
" 	Plug 'junegunn/rainbow_parentheses.vim'
"         Plug 'cacharle/c_formatter_42.vim'
"         Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if has ("syntax")
        syntax on
endif

set nu
set showmatch
set ruler
set mouse=a
set autoindent
set cindent
set smartindent
set title

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
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

inoremap jj <esc>
inoremap qq <esc>
nnoremap 42h :Stdheader<enter>
" inoremap std #include <stdio.h>
inoremap minit int<tab>main(void)<cr>{<cr>return (0);<cr>}<cr><esc>kk0
nnoremap nnn :NERDTreeToggle<enter>
" augroup rainbow_lisp
" 	autocmd!
" 	autocmd FileType c,cpp RainbowParentheses
" augroup END

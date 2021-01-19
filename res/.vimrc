" :PlugInstall
" :w
" so %

call plug#begin('~/.vim/plugged')
    Plug 'pbondoer/vim-42header'
    Plug 'sainnhe/sonokai'
	Plug 'preservim/nerdtree'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"	Plug 'xolox/vim-session'
"	Plug 'xolox/vim-misc'
"	Plug 'ctrlpvim/ctrlp.vim'
"	Plug 'terryma/vim-smooth-scroll'
" 	Plug 'junegunn/rainbow_parentheses.vim'
"   Plug 'cacharle/c_formatter_42.vim'
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if has ("syntax")
        syntax on
endif

set nu
set title
set ruler
set mouse=a
set showmatch
set cursorline
set cindent
set autoindent
set smartindent
set smarttab
"set expandtab " 탭을 스페이스바로 간주
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set encoding=utf-8
"set termencoding=utf-8
"filetype on 
set pastetoggle=<F9>

set laststatus=2 
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F

if has('termguicolors')
        set termguicolors
endif
colorscheme sonokai

let g:hdr42user = 'ycha'
let g:hdr42mail = 'ycha@student.42seoul.kr'
let g:sonokai_style = 'shusia'
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
inoremap minit int<tab>main(void) {<cr>return (0);<cr>}<cr><esc>kk0
nnoremap mmm :NERDTreeFocus<CR>
nnoremap mm :NERDTreeToggle<CR>
nnoremap mmr :NERDTree<CR>

" vim-smooth-scroll
"noremap <silent> <c-i> :call smooth_scroll#up(&scroll, 10, 3)<CR>
"noremap <silent> <c-u> :call smooth_scroll#down(&scroll, 10, 3)<CR>

nmap <C-w>n <C-w>v
nmap <C-w>m <C-w>n
nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize -8"<CR>

" autocmd VimEnter * RainbowParenthese

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit |
    \ endif

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif

" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
	" remove previous autocmds
	autocmd!
	" set every new or read *.md buffer to use the markdown filetype
	autocmd BufRead,BufNew *.md setf markdown
augroup END

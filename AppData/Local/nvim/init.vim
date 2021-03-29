set encoding=utf-8
set number relativenumber
set clipboard+=unnamed
set tabstop=4
set shiftwidth=4
set autoindent
set laststatus=2
set fillchars=vert:\|
set termguicolors

"experimental
set cursorline
set wildmenu
set softtabstop=4
set expandtab
set copyindent

" setting powershell as the default terminal
" this slowdowns the PC as per some github issues
" set shell=powershell.exe
" set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
" set shellpipe=\|
" set shellredir=\|\ Out-File\ -Encoding\ UTF8
" set shellquote=
" set shellxquote=

cd D:\Chaitanya\
let g:python_host_prog="C:/Python27/python2.exe"
inoremap <silent> <S-Insert> <C-R>+
nnoremap <C-6> <C-^>

" vim-PLug
call plug#begin('~/AppData/Local/nvim-data.plugged')

source $HOME/AppData/Local/nvim/vim-plug.vim

call plug#end()

source ~/AppData/Local/nvim/coc.vim

filetype plugin indent on

"Setting theme

let ayucolor="light"
colorscheme one

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_symbols.notexists='∄'

let g:airline_theme='base16'

nmap <C-c> :TComment<CR>
nnoremap <C-CR> <F11>
nmap <C-w>

"NERDTree Binding
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>

" autocmd GUIEnter * silent! nvim_ui_detach(200, 300, ext_cmdline)
set termguicolors
set colorcolumn=90

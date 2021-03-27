"syntax on
"set number relativenumber
set novisualbell " or set belloff=all
set nocompatible
set renderoptions=type:directx " added for firacode icons
set termencoding=utf-8
set guifont=Fira\ Code\ Retina:h13
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set guioptions-=T "No Toolbar
" set linespace=4
set number relativenumber
set ruler
set clipboard+=unnamed
set fileencoding=utf-8
set fileencodings=utf-8
set cursorline
set fillchars+=vert:\|
set colorcolumn=80

" Vim Plug
if has('unix')
    cd /d
    so /c/Users/NEELKANTH/vimfiles/plugged/delimitMate/test/_setup.vim
    call plug#begin('~/vimfiles/plugged')
    source $HOME/vim-plug.vim
    call plug#end()
    let g:airline_theme="one"
    set termguicolors
    colorscheme one
    set bg=dark
    set termguicolors
    if &term =~ "screen."
        let &t_ti.="\eP\e[1 q\e\\"
        let &t_SI.="\eP\e[5 q\e\\"
        let &t_EI.="\eP\e[1 q\e\\"
        let &t_te.="\eP\e[0 q\e\\"
    else
        let &t_ti.="\<Esc>[1 q"
        let &t_SI.="\<Esc>[5 q"
        let &t_EI.="\<Esc>[1 q"
        let &t_te.="\<Esc>[0 q"
    endif
    let g:coc_data_home='/c/Users/NEELKANTH/.config/coc'
endif


syntax on

if has('win32')
    cd D:\Chaitanya
    so C:\Users\NEELKANTH\vimfiles\plugged\delimitMate\test\_setup.vim
    call plug#begin('~/vimfiles/plugged')
    source $HOME/vim-plug.vim
    call plug#end()
    colorscheme one
    set termguicolors
    if &term =~ "screen."
        let &t_ti.="\eP\e[1 q\e\\"
        let &t_SI.="\eP\e[5 q\e\\"
        let &t_EI.="\eP\e[1 q\e\\"
        let &t_te.="\eP\e[0 q\e\\"
    else
        let &t_ti.="\<Esc>[1 q"
        let &t_SI.="\<Esc>[5 q"
        let &t_EI.="\<Esc>[1 q"
        let &t_te.="\<Esc>[0 q"
    endif

endif

"Opens NERDTree on startup
autocmd vimenter * NERDTree

function! StartUp()
    if 0 == argc()
        NERDTree
    endif
endfunction

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-c> :TComment<CR>
nmap <C-s> :w<CR>

" Python(2) path
let &pythondll='C:\Windows\System32\python27.dll'
let &pythonhome='C:\Python27\python27.exe'

"Saying nerdtree to ignore few files while scanning
let NERDTreeIgnore=['\c^ntuser\..*']
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']

"Setting delimtMate : Plugin to auto close semicolon
let delimitMate_expand_cr = 1

let g:user_emmet_install_global = 1

"Experimental
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline_symbols.notexists = "∄"

" coc vim
source $HOME/coc.vim

filetype plugin indent on " Required 

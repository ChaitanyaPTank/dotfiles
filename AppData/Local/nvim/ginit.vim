GuiTabline 0
" GuiRenderLigatures 1
GuiPopupmenu 0
GuiLinespace 3
GuiFont! JetBrainsMono\ NF:h13

"Fullscreen toggle
let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

colorscheme darcula
let g:airline_theme='google_dark'

" Paper color config
" let g:PaperColor_Theme_Options = {
" \   'theme': {
" \       'default.light': {
" \           'override': {
" \           'color00': ['#eeeeee', '232'],
" \           'linenumber_bg': ['#eeeeee', '232']
" \               }
" \           }
" \        }
" \   }

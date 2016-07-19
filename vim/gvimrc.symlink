" # gvimrc
" Author: Alan Rafael Fachini
" Based on:
" * [holman vim files](http://github.com/holman/dotfiles/blob/master/vim/gvimrc.symlink)
" * http://nodnod.net/2008/aug/25/macvim/
" 

set guioptions-=T
set anti guifont=Inconsolata:h14  " Gui Font " set guifont=Inconsolata:h16
set antialias           " Vim will use smooth ("antialiased") fonts
set columns=9999       " All screen
set lines=80
set fuoptions=maxhorz,maxvert " Fullscreen takes up entire screen

" ## MacVim Key Bindings
"
" <Ctrl-Tab> Next Tab
" <Ctrl-Shift-Tab> Previous Tab

nmap <c-tab> :tabnext<cr>
imap <c-tab> <c-o>:tabnext<cr>
vmap <c-tab> <c-o>:tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
imap <c-s-tab> <c-o>:tabprevious<cr>
vmap <c-s-tab> <c-o>:tabprevious<cr>

" <Cmd-#> Switches to tab

map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>
map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

" Remove <Cmd-t> binding MacVim Binding and use it for Commant+T

macmenu &File.New\ Tab key=<c-t>

" <Cmd-Return> for fullscreen

macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

" Bind Cmd + f to PeepOpen
" if has("gui_macvim")
  " macmenu &File.New\ Tab key=<nop>
"  macmenu &Edit.Find.Find\.\.\. key=<nop>
"  map <D-f> <Plug>PeepOpen
"end

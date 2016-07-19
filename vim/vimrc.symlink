" Vimrc
" Author: Alan Rafael Fachini
"
" Based on:
" * [tpope vimfiles](http://github.com/tpope)
" * [akita vimfiles](http://github.com/akitaonrails/vimfiles)
" * [pengwynn vimfiles](http://github.com/pengwynn/dotfiles)
"
" TODO: Bind ack.vim functions to the same keys used on command-t
" TODO: Learn more about nerdcommenter commands

set nocompatible

" ## Pathogen
"
" [Pathogen](http://github.com/tpope/vim-pathogen) is a nice package format for Vim _'packages'_.
"
" Call infect to get the bundle handling started. Bundles are installed via
" git clone/submodule on ~/.vim/bundle
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
" Generage doc files:
call pathogen#helptags()

filetype on        " Enable filetype detection
filetype plugin on " Enable filetype-specific indenting
filetype indent on " Enable filetype-specific plugins

" ## Plugins and key bindings Configuration
"
" ### Command-T
"
" [Commant-T](http://github.com/wincent/Command-T) is a fuzzy finder plugin
"
" <Cmd-t> Open command-t (:CommandT)
" <Tab>  change focus to the prompt
" <CR>   open the selected file
" <C-CR> open the selected file in a new split window
" <C-s>  open the selected file in a new split window
" <C-v>  open the selected file in a new vertical split window
" <C-t>  open the selected file in a new tab

map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTMaxHeight=12

" ### Ack
"
" [Ack](http://github.com/mileszs/ack.vim) is ack pearl script on vim.
"
" <Cmd-Shift-F> Open Ack (:Ack)
" <o> open in same window
" <t> open in new tab
" <T> silently
" <q> quit

map <D-F> :Ack<space>

" ### NERDCommenter
"
" [NERDCommenter](http://github.com/scrooloose/nerdcommenter)
"
" <Cmd-/> Toggle comments

map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" ### Other key bindings
"
" #### Leader (,)

let mapleader=","

" #### Spell Correction
"
" <Ctrl-s> Toggle spell correction.

nmap <silent> <C-s> :set spell!<CR>

" #### Split window
"
" <Ctrl-w> <Ctrl-v> Split vertical :vsplit
" <Ctrl-w? <Ctrl-s> Split horizontal :split
"
" #### Indentation
"
" <Cmd-]> Increase indentation
" <Cmd-[> Decrease indentation

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" #### Remove Whitespaces
"
" <Ctrl-c>

function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
map <C-c> :call TrimWhiteSpace()<CR>
map! <C-c> :call TrimWhiteSpace()<CR>

" ## Vim Configuration

set encoding=utf-8 " Set the default file encoding to UTF-8
set noswapfile " Don't create .swp

" ### Behaviors

set autoread           " Automatically reload changes in files if detected
set wildmenu           " Turn on WiLd menu
set history=500        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set timeoutlen=250     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds

" ### UI, Syntax and ColorScheme
"
" [Solarized colorscheme](http://github.com/altercation/vim-colors-solarized) for vim with dark background.
" [Molokai colorsheme](http://github.com/tomasr/molokai)
" [Tomorrow Night colorscheme](http://github.com/ChrisKempson/Tomorrow-Theme)

syntax enable
set background=dark
  " colorscheme solarized
  " colorscheme molokai
colorscheme tomorrow-night
set cursorline   " Highliht cursor line
set showmatch    " Show matching brackets.
set mat=2        " How many tenths of a second to blink
set ruler        " Show rule at the bottom
set number       " Show line number
  " set nowrap   " Line wrapping off
set laststatus=2 " Always show the statusline
set cmdheight=1  " Number of lines for commands
set mouse=a      " Mouse in all modes

" ### Sounds

set noerrorbells
set novisualbell
set t_vb=

" ### Show whitespaces

set list
set listchars=tab:..,trail:.,extends:#,nbsp:.

" ### Text format and Indetation
set columns=84   " Column break line
set textwidth=80 " Break text at column 80
set linespace=4  " add some line space for easy reading
set ts=2         " Tab space
set smarttab
set autoindent   " Automatic indent new lines
set expandtab
set shiftwidth=2 " Tabs under smart indent
set softtabstop=2
set backspace=indent,eol,start

" ### Searching

set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " find the next match as we type the search
set hlsearch   " hilight searches by default

" ## Filetype based configuration

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" JSON syntax highlighting

au BufNewFile,BufRead *.json set ft=javascript

" Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )

au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

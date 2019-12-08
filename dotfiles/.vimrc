" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
call plug#end()

" Editor config
syntax enable       " enable syntax = syntax on
set number          " display  line #
set showcmd         " show last entered command
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set textwidth=80    " soft wrap limit
set ruler

" Tabs and indentation
set shiftwidth=4
set tabstop=4           " # of visual spaces in TAB
set expandtab           " tabs are spaces
set softtabstop=4       " # of spaces in TAB
set autoindent          " Auto indent on new line
set smarttab
set shiftround
filetype indent on      " load filetype-specific indent files

" Custom indentation settings for different filetypes
autocmd FileType c setlocal shiftwidth=8 tabstop=8
" autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8

" UI appearance
colorscheme gruvbox
" uncomment colorscheme for gruvbox
set background=dark     " Setting dark mode
" set background=light  " Setting light mode
set termguicolors       " enable Truecolor support of terminal
set t_co=256            " Supports 256 colors, full theme

" gruvbox configs
let g:gruvbox_contrast_dark='soft'  " soft, medium, hard
let g:gruvbox_bold=1                " enable bold txt
let g:gruvbox_italic=1              " enable italic txt
let g:gruvbox_underline=1           " enable underlined txt
let g:gruvbox_undercurled=1         " enable undercurled txt

" Simple terminal fixes
if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also http://sunaku.github.io/vim-256color-bce.html
         set t_ut=
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Misc
set backup                      " Create backups
set history=50                  " Remember last 50 commands
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

" Other
set spell               " spellckeck
set encoding=utf-8
set linebreak
set scrolloff=1
set wrap

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case

" Dont clutter the filesystem
silent !mkdir ~/.vimtmp > /dev/null 2>&1
set backupdir=~/.vimtmp
set directory=~/.vimtmp


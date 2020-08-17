set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'isRuslan/vim-es6'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" " Theme
 syntax enable
" for vim 7
" set t_Co=256

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif


colorscheme OceanicNext

"It should remove trailing spaces
"from https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim/75431#75431
autocmd BufWritePre * :%s/\s\+$//e


set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set mouse=a

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" text editor
Plugin 'tpope/vim-surround'
" file management
Plugin 'scrooloose/nerdtree'
" Showing git status for nerdtree
" status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" syntax static check
Plugin 'scrooloose/syntastic'
" Seamless navigation between tmux panes and vim splits
Plugin 'christoomey/vim-tmux-navigator'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/tagbar'
"Plugin 'prettier/vim-prettier'

" ack search tool 
Plugin 'mileszs/ack.vim'

" buffer delete without chaning window layout
Plugin 'qpkorr/vim-bufkill'


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

" Install Plugins
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall 

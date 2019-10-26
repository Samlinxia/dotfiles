" Do not put any lines in your vimrc that you don't understand.
"=============Launch Config============
" load plugins from vundle
source ~/.vim/plugins.vim

set autoread " detect when a file is changed
set ttyfast  " faster redrawing

"============Syntax,  Colors============
syntax enable " enable syntax processing
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256  " support 256 colors
set background=dark
set encoding=utf8

"============Spaces & Tabs================
set tabstop=2       " number of visual spaces per TAB
"highlight text past 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
let c_space_errors = 1 "Highlight bad spaces
set expandtab  " tabs are spaces
set modeline

"================UI config=============
set title  " set terminal title
set number  " show line numbers
set showcmd " show cmd in bottom bar
set cursorline " highlight current line
match OverLength /\%81v.\+/
set colorcolumn=81,101 " absolute columns to highlight "
set colorcolumn=+1,+21 " relative columns textwidth to highlight "
set wildmenu            " visual autocomplete for command menu
set wildmode=list:longest  " complete files like a shell
set lazyredraw   " redraw only when we need to
set hidden " current buffer can be put into background
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highligh conflicts
set scrolloff=3  " lines of text around cursor
set shell=$SHELL
set cmdheight=1  " command bar height

"==============typing & text setting============================
"set wrap  " turn on line wrapping
set nowrap
set wrapmargin=0
set linebreak
set showbreak=...  " show ellipsis at breaking
set autoindent  " auto set indent of new line
set smartindent
set textwidth=0 
"set whichwrap=<,>,h,l
" display trailing space
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"===================File Type Specific=========================
if has('autocmd') && !exists('autocommands_loaded')
  let autocommands_loaded = 1
  " auto resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='
  autocmd BufWritePost .vimrc source %
  autocmd BufWritePost .vimrc.local source %
  " make quickfix windows take all the lower section of the screen when
  " there are multiple windows open
  autocmd FileType qf wincmd J
endif

"======================Searching=========================
set hlsearch
set incsearch " Enable incremental search
set ignorecase " case-insensitivell
set smartcase " enable case-sensitive when keyword has upper case
set nolazyredraw  " don't redraw while executing macros
set showmatch " highlight matching [{()}]

set magic  " set magic on, for regex

set tags=tags;/ " enable ctags link to tags

"====================Code/Text Folding=====================
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set foldenable " foldable by default
set foldlevel=1
set foldlevelstart=10  " starting fold level for opening a new buffer. If it is set to 0, all folds will be closed. Setting it to 99 would guarantee folds are always open. So, setting it to 10 here ensures that only very nested blocks of code are folded when opening a buffer. 

"===================Status Line===========================
" Add full filename in bottom statusline
set laststatus=2  " show the status line all the time
set statusline+=%F

"==================Key Bindings========================
let mapleader = ','  " remap <Leader> key
let g:mapleader = ','

" remap - recursively mapping keys by default
" remap esc
inoremap jk <esc>
" toggle list character
nmap <leader>l :set list!<cr>
" disable Ex mode
noremap Q <NOP>
" toggle clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>
" switch between current and last buffer
" remap TBGS
nmap <leader>t :TBGS 
" switch splited windows
noremap <C-h> <C-w>h 
noremap <C-l> <C-w>l
" cycle through buffers. <C-j>, <C-k> mapping defined in vim-tmux-navigator
" plugin
" nnoremap <C-j> :bnext<cr>
" nnoremap <C-k> :bprevious<cr>
" skip to next blank line.
noremap J }
noremap K {
" With the help of Airline(List opened buffers at the top like tabs), don’t
" need tab any more.  Remap all tab keys to buffer. 
" Buffer Switch 
nmap <leader>. <c-^>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open/close fold
nnoremap <Enter> za
" Opens a new tab with the current buffer's path Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
noremap '' '.

" Tmux Configs
" Autogroups
"===========Files,Backups, and undo======================
set nobackup
set nowb
set noswapfile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Custom Functions
" interact with OS clipboard
set clipboard=unnamed

" Organization
" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template

"====================Plugins=============================
" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Nerd tree
noremap <C-z> :NERDTreeToggle<CR>
" Tag Bar 
noremap <C-t> :TagbarToggle<CR>

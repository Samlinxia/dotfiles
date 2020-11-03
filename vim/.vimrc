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
set expandtab  " tabs are spaces
set shiftwidth=2 " indent 2 space
"highlight text past 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
let c_space_errors = 1 "Highlight bad spaces
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

" Change cursor shape in different modes. 
" Vertical bar in INSERT; block in n-v-c mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"==============typing & text setting============================
"set wrap  " turn on line wrapping
set nowrap
set wrap!
set formatoptions-=t
set wrapmargin=0
set linebreak
set showbreak=...  " show ellipsis at breaking
set autoindent  " auto set indent of new line
set nosmartindent
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
" Set the working directory to wherever the open file lives
" set autochdir

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

" Set tags for vim-fugitive
set tags^=.git/tags

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
" map: recursive maps. default option
" noremap: non-recursive maps.
" :nmap - Display normal mode maps
" :nnoremap - non-recursive normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps

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
nmap <leader>. <c-^>

" go to the splited windows
noremap <C-h> <C-w>h 
noremap <C-l> <C-w>l

" split window and move to new window
nnoremap <Bar> <C-w>v<C-w><Right>
nnoremap - <C-w>s<C-w><Down>

" cycle through buffers. <C-j>, <C-k> mapping defined in vim-tmux-navigator
" plugin
" nmap <C-j> :bnext<cr>
" nmap <C-k> :bprevious<cr>
" nmap <leader>l :bnext<cr>
" nmap <leader>h :bprevious<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

nnoremap <C-d> <C-w>q

" skip to next blank line.
noremap J }
noremap K {

" With the help of Airline(List opened buffers at the top like tabs), don’t
" need tab any more.  Remap all tab keys to buffer. 
" Buffer Switch 
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open/close fold
"nnoremap <Enter> za
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
let g:airline_theme='dark'

" Nerd tree
noremap <C-z> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.d\.ts$', '\.d\.ts\.map$']

" CtrlP settings
" search file names
nnoremap <leader>f :CtrlP<cr>
"search tag
nnoremap <leader>t :CtrlPTag<cr>
" search MRU buffer
nnoremap <leader>b :CtrlPMRU<cr>
"" CtrlP uses Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tag Bar 
noremap <C-t> :TagbarToggle<cr>
" TagBar supports Typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" Ack search bar
" Set Ag as default search tool for ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>a :Ack ""<Left>

" Bufkill
nmap <leader>d :BD<cr> 

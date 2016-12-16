" Much of this was shamelessly stolen from
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" don't bother with vi compatibility
set nocompatible
" required
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle - setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle - plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'valloric/MatchTagAlways'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mxw/vim-jsx'
Plugin 'klen/python-mode'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'vimwiki/vimwiki'

" All plugins must be added before the following line
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set clipboard=unnamed

" set the encryption method to be strong (requires v>=7.4.399)
if v:version > 704
    setlocal cm=blowfish2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=node_modules/,__pycache__

" show line numbers
set number

" show relative linenos for all other lines
" set relativenumber

"Always show current position
set ruler

" Show current line
:set cursorline

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight current line
set cursorline

" Make movement between windows easier - CTRL-{h | j | k | l}
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Let vim windows be resized by mouse
set mouse=a
if &term =~ '^screen'
    " tmux support
    "set ttymouse=xterm2
    set ttymouse=sgr
endif

" Surround words with single or double quotes
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P

" Search for visually selected text with // 
vnoremap // y/<C-R>"<CR>

" Show file in statusline
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Replace slow, buggy highlighting for YAML
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

try
    colorscheme solarized
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Make vim pretty with tmux
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set `_` as a keyword, so it is treated as a word boundary
" (commented out as this is actually pretty annoying for python)
" set iskeyword-=_

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"Auto indent
set ai 

"Smart indent
set si

"Wrap lines
set wrap

" Indentation for YAML
autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""
" Python Mode
"""""""""""""""
let g:pymode_rope = 1
 
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Auto check on save
let g:pymode_lint_write = 1
" 
" Support virtualenv
let g:pymode_virtualenv = 1
" 
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
 
" Autocompletion
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion = 1

" Don't autofold code
let g:pymode_folding = 0

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>

" Disable specific errors/warning for linting
" for error codes check:
" https://pep8.readthedocs.io/en/latest/intro.html#error-codes
let g:pymode_lint_ignore = "E501,W,E402,E266"

" Enable running of code
let g:pymode_run = 1

" Organize imports
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
"""""""""""""""
" NerdTree
"""""""""""""""
" open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Make NerdTree ignore files I don't care about (compiled python files, etc.)
let NERDTreeIgnore = ['.pyc$', 'a\.out$', '__pycache__']

"""""""""""""""
" Vim-JSX
"""""""""""""""
let g:jsx_ext_required = 0


""""""""""""""
" Syntastic
""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_w = 0
"
"" Checkers
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_html_checkers   = ['tidy']


""""""""""""
" EasyAlign
""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

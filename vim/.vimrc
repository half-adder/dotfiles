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
"Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'

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
" set whichwrap+=<,>,h,l

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

" make the bottom airline thing always appear
set laststatus=2

" open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Make NerdTree ignore files I don't care about (compiled python files, etc.)
let NERDTreeIgnore = ['.pyc$', '.out$', '__pycache__']

let g:airline_powerline_fonts = 1 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" let g:airline_theme='solarized-dark'

" Make movement between windows easier - CTRL-{h | j | k | l}
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Let vim windows be resized by mouse
set mouse=a
if &term =~ '^screen'
    " tmux support
    set ttymouse=xterm2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

try
    colorscheme solarized
catch
endtry

" Background colors
if strftime("%H") <= 19
  set background=light
else
  set background=dark
endif
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

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set `_` as a keyword, so it is treated as a word boundary
" set iskeyword-=_

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""
" Python Mode
"""""""""""""""
let g:pymode_rope = 1
" 
" " Documentation
" let g:pymode_doc = 0 
" let g:pymode_doc_key = 'K'

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
let g:pymode_rope_complete_on_dot = 0

" Don't autofold code
let g:pymode_folding = 0

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>

" Disable specific errors/warning for linting
" for error codes check:
" https://pep8.readthedocs.io/en/latest/intro.html#error-codes
let g:pymode_lint_ignore = "E501,W,E402"
""""""""""""""""
" => UltiSnips
""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""
" Syntastic
"""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 
" " Syntastic plugins
" let g:syntastic_javascript_checkers = ['eslint']

"""""""""""""""
" NerdTree
"""""""""""""""

" open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Make NerdTree ignore files I don't care about (compiled python files, etc.)
let NERDTreeIgnore = ['.pyc$',]

"""""""""""""""
" Easy-Align
"""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""
" Vim-JSX
"""""""""""""""
let g:jsx_ext_required = 0


"""""""""""""""
" Silver Searcher
"""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

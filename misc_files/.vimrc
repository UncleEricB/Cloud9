" lorencarvalho's vimrc
" optimized for python development

""""""""""""""""""""""
"     defaults       "
""""""""""""""""""""""

" easier paste mode
set pastetoggle=<F3>

" mouse
" set mouse=a  " on OSX press ALT and click
"set ttymouse=xterm2
" set ttymouse=sgr

" make backspace behave like normal again
set bs=2

" .swp files, .swp files everywhere
set noswapfile
set nobackup
set nowritebackup

" tabs are spaces, ya dummy
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

" faster update time
set updatetime=300

" can i still undo?
set undofile
set undodir=~/.undo
set history=700
set undolevels=700

" searching
set incsearch " incremental search
set hlsearch " highlight search results
set ignorecase
set smartcase

" other set defaults
set encoding=utf-8
set hidden " hide buffers instead of closing them
set autoread " read outside file changes into buffer
set showmatch
set scrolloff=2 " scroll buffer
set splitbelow
set splitright

""""""""""""""""""""""
"   key remaps       "
""""""""""""""""""""""

" NO ARROWS! at least until my muscle memory catches up
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" comma is our leader
let mapleader = ","

" clear search results
nmap <silent> ,/ :nohlsearch<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" sudo pls
ca w!! w !sudo tee "%"

" big silicon valley company mode (twitter/google style guide)
command SVMode :set tabstop=2 shiftwidth=2 softtabstop=2

" m is for macro
nnoremap m @q

" navigate splits via ctrl-<hjkl>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remove trailing whitespace w/f5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

""""""""""""""""""""""
"   color & syntax   "
""""""""""""""""""""""

" syntax highlighting
filetype off
filetype plugin indent on
syntax on
syntax enable

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=LightGreen guibg=LightGreen
match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" theme
set t_Co=256
"Plug 'chriskempson/base16-vim'
"color tomorrow

" line numbers and length
set number  " show line numbers
set tw=99   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
"set fo-=t   " don't automatically wrap text when typing
set textwidth=120
set colorcolumn=120

" show current curser / line
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermfg=none

" automatically close autocompletion window
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" auto close quickfix
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Dont' line wrap at 79 chars for git commit messages
autocmd Syntax gitcommit setlocal textwidth=0

""""""""""""""""""""""
"     plugins        "
""""""""""""""""""""""

" vim-plug
call plug#begin('~/.vim/plugged')

" vim-flake8
Plug 'nvie/vim-flake8'
autocmd FileType python map <buffer> 8 :call Flake8()<CR>
let g:flake8_show_in_gutter=1
let g:flake8_quickfix_height=4

" vim-json
"Plug 'elzr/vim-json'

" vim-gradle
"Plug 'tfnico/vim-gradle'

" vim-surround
"Plug 'tpope/vim-surround'

" fugitive
"Plug 'tpope/vim-fugitive'

" Tagbar!
"Plug 'majutsushi/tagbar'
"let g:tagbar_autofocus = 1
"map <F2> :TagbarToggle<CR>

" NERDTree!
"Plug 'scrooloose/nerdtree'
"map <F1> :NERDTreeToggle<CR>
"let NERDTreeShowHidden=0 " set to 1 to enable
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '^__pycache__$[[dir]]']

" Close nerdtree if last buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
"    \ b:NERDTreeType == "primary") | q | endif

" NERDTree syntax
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1

" ctrlp!
"Plug 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_max_height = 30
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_custom_ignore = '*.pyc\|DS_Store\|git'
"map <leader>b :CtrlPBuffer<CR>
"set wildignore+=*.pyc
"set wildignore+=*build/*
"set wildignore+=*/coverage/*

" supertab!
" Plug 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = "<c-n>" " top down pls!

" jedi-vim
" Plug 'davidhalter/jedi-vim'

" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#usages_command = "<leader>z"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#documentation_command = "K"

" let g:jedi#show_call_signatures = 2
" let g:jedi#completions_enabled = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#popup_select_first = 0

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" Airline!
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"let g:airline_powerline_fonts = 0
"let g:airline#extensions#tabline#enabled = 1 " Use extensions!
"let g:airline_theme = "tomorrow"
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_mode_map = {
"    \ '__' : '-',
"    \ 'n'  : 'N',
"    \ 'i'  : 'I',
"    \ 'R'  : 'R',
"    \ 'c'  : 'C',
"    \ 'v'  : 'V',
"    \ 'V'  : 'V',
"    \ 's'  : 'S',
"    \ }
"set ls=2 " always show status line

" vim-illuminate
Plug 'RRethy/vim-illuminate'
let g:Illuminate_delay = 500

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-isort
"Plug 'fisadev/vim-isort'

" vim-rg
"Plug 'jremmen/vim-ripgrep'

" coc
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" end/load Plugins
call plug#end()

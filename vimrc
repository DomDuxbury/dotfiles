""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Dominic Duxbury                                                "
"        URL: http://github.com/domduxbury/dotfiles                          "
"                                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General {{{

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
filetype plugin on
set backspace=2 " make backspace work like most other apps

" File searching
set path+=**

" Display all matching files
set wildmenu

" Read the bottom of this file for folding formatting
set modelines=1

" Handle swp, undo and backup files in ~/.vim
" Set swap files dir
set dir=~/.vim/_swap/
" Turn on backup files and set the directory
set backup
set backupdir=~/.vim/_backup/
" Turn on undo files and set the directory
set undofile
set undodir=~/.vim/_undo/

set clipboard=unnamedplus
" }}}
" Plugins {{{

filetype off
filetype plugin indent on

" Begin Plugin List
call plug#begin('~/.vim/plugged')

" Syntax highlighting in Python
Plug 'vim-python/python-syntax'

let g:python_highlight_all = 1

" Lightweight plugin to handle comments
Plug 'tpope/vim-commentary'

" " Git Co Pilot
" Plug 'github/copilot.vim'

" Linting plugin
Plug 'w0rp/ale'
let g:ale_linters = {
\   'python': ['flake8'],
\}

" let g:ale_echo_cursor = 0

" Latex Plugins
Plug 'lervag/vimtex'
let g:vimtex_compiler_engine = 'xelatex'

" Async Commands
Plug 'skywind3000/asyncrun.vim'

Plug 'jremmen/vim-ripgrep'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Initialize plugin system
call plug#end()

" }}}
" Events {{{
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" }}}
" Colours / Theme {{{
" Enable 24-bit color support
if has('termguicolors')
  set termguicolors
endif

" Set background
set background=dark

" Choose your color scheme
colorscheme kanagawa

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

set pastetoggle=<F2>
" }}}
" Interface {{{
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
"set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
"set visualbell
" }}}
" Text Formatting/Layout {{{
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
"set smarttab             " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
" }}}
" {{{ Custom Commands, bindings and abbreviations
" Map my leader as ,
let mapleader = ","
let maplocalleader = "-"

" Map # to paste and yank
nnoremap # "+p
vnoremap # "+y

" Map exit to jk, remove esc map and arrows
inoremap jk <esc>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <silent> <C-S> :<C-u>update<CR>

" Map ; to : for faster quitting and writing
" nnoremap ; :

" Use space to open folds
nnoremap <space> za

" Create a mapping to open this file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" create a mapping to source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Latex bindings
au FileType tex nnoremap <localleader>wc :VimtexCountWords<cr>

" Bind leader n/p to next/prev buffer
nnoremap <leader>n :next<cr>
nnoremap <leader>p :prev<cr>

" Find and replace across a folder
" Open all the files in arg mode
nnoremap <leader>r :arg */**
nnoremap <leader>R :argdo %s/\<foo\>/bar/ge | update

" Create a mapping to insert an empty line below
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

nnoremap <localleader>p :AsyncRun -raw python %<cr>
nnoremap <localleader>c :copen<cr>

" }}}
" vim:foldmethod=marker:foldlevel=0

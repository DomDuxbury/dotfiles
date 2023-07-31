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
source ~/dotfiles/vimrc_modules/neocomplete.rc.vim

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

set viminfo =

" }}}
" Plugins {{{

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colorscheme Plugin
Bundle 'altercation/vim-colors-solarized'

" General Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/neocomplete.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'rust-lang/rust.vim'

" Latex Plugins
Plugin 'lervag/vimtex'

" Git Plugins
Plugin 'tpope/vim-fugitive'

" Scala
Plugin 'derekwyatt/vim-scala'

" Javascript
Plugin 'ruanyl/coverage.vim'
let g:coverage_json_report_path = 'coverage/coverage.json'
let g:coverage_auto_start = 0

call vundle#end()
filetype plugin indent on

" }}}
" Events {{{
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete
" }}}
" Colours / Theme {{{
let g:solarized_termcolors=256
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
colorscheme solarized       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

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
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell
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

" Map # to paste in n or copy in V
" to system clipboard
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

" Map - and _ to move lines up and down
noremap <leader>- ddp
noremap <leader>_ ddkkp

" Map ctrl U to uppercase a word
inoremap <c-u> <esc>viwU<esc>i
nnoremap <c-u> viwU<esc>

" Map space to select a word
nnoremap <leader><space> viw

" Surround a word with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Search for a file by name
nnoremap <leader>f :find *.

" Search for a file by grep
nnoremap <leader>g :vimgrep

" Navigate files found
nnoremap <leader>n :next<cr>
nnoremap <leader>p :prev<cr>

" Abbreviate email
iabbrev @@ domduxbury@hotmail.com

" Fix indentation for html files on write
autocmd BufWritePre *.html :normal gg=G

" Blogging settings
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_gb

" Scala ensime settings
au FileType scala nnoremap <buffer> <silent> <LocalLeader>ds :EnDeclarationSplit<CR>
au FileType scala nnoremap <buffer> <silent> <LocalLeader>db :EnDocBrowse<CR>
au FileType scala nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>
" New function with localLeader 
au FileType scala nnoremap <localleader>{ odef () = {<CR>}<esc>bbbi
au FileType scala nnoremap <localleader>g :vimgrep <C-R><C-W> */**<cr>

" Latex bindings
au FileType tex nnoremap <localleader>wc :VimtexCountWords<cr>

" Find and replace across a folder
" Open all the files in arg mode
nnoremap <leader>r :arg */**
nnoremap <leader>R :argdo %s/\<foo\>/bar/ge | update

" Create a mapping to insert an empty line below
nnoremap <leader>o o<esc>
" }}}
" {{{ Syntastic
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
" SBT
" required to disable syntastic checking.
" augroup filetype_sbt
"   autocmd!
"   autocmd BufNewFile,BufRead *.sbt set filetype=sbt
"   autocmd FileType sbt setlocal syntax=scala
" augroup END
" Prettify JSON files making the easier to read
" }}}
" vim:foldmethod=marker:foldlevel=0

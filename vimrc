"Run this command to install vundle(VIM package manager): git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Remember to install JEDI too
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
"Plugin 'Shougo/echodoc.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
" Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggdroot/indentLine'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"So you can actually see function params from echodoc
"set cmdheight=2

" change indent level bars
let g:indentLine_char = '·'

"Change airline theme
let g:airline_theme='violet'
set ttimeoutlen=50

" Helpful Syntastic commands
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes'] " add other checkers in brackets for example ['pyflakes', 'pylint'] pytlint can be useful for style checking run 'pip3 install pyflakes' to install
" make the syntastic error highlighting gutter readable
highlight QuickFixLine ctermbg=089 

"VIMUX COMMANDS
nnoremap <leader>c :VimuxCloseRunner<CR>
let g:VimuxUseNearest = 0
" Vimux run python interactive binding
autocmd FileType python  nnoremap <F5> :call VimuxRunCommandInDir("clear; python3 -i ", 1)<CR>:VimuxInspectRunner<CR>:call VimuxSendKeys("q")<CR>


"Vimux Mac change theme bindings: this doesnt work right now because the tmux
"session will not sync env variables between panes so you must close the
"runner on your own - <leader>c
nnoremap <F2> :silent exec "!~/dotfiles/scripts/togglebg.sh"<CR> 
    \:redraw!<CR>:AirlineRefresh<CR>

"Set so vim fonts work right
set encoding=UTF-8

" Enable vimrc auto reloading
autocmd! bufwritepost .vimrc source %
" enable syntax highlighting
syntax enable

"Assume 256 color support
set term=screen-256color " This gets airline to work in tmux

"Set encoding
set encoding=utf-8

" show line numbers
set number

"Get backspace working correctly
set backspace=2

"Set spacing correctly for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
"    \ set colorcolumn=80

"split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

" sort with \s in visual mode
vnoremap <leader>s :sort<CR>

"remove trailing white space
nnoremap <leader>ws :%s/\s\+$//e

"make it so :Q works as :q and :W works as :w
:command W w
:command Q q
:command WQ wq

"bind to fix tabs
nnoremap <leader>rt :retab<CR>
"
" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"recursive subdirectory searching for file operations
set path+=**

"show what matches a wild card then using commands such as :find
set wildmenu

"enable tag jumping
command! MakeTags !ctags -G .

"Create file and edit under cursor
map <leader>gf :e <cfile><cr>

"Enable python skeleton program (remember you can append movement commands to
"the end of this command)
nnoremap ,python :-1read $HOME/.vim/skeletons/skeleton.python<CR>
nnoremap ,pydoc :-1read $HOME/.vim/skeletons/skeleton.python.document<CR>
" toggle bind for file tree
map <leader>t :NERDTreeToggle<CR>
" auto open nerd treee when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto switch between relative line numbers and exact based on mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Show tab/newline/carridge return characters
set listchars=eol:¬
set list

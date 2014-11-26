" ------------------------------------------------------------------------------
" General Settings

command! W :w                                " Seriously, it's not like :W is bound
                                             " to anything anyway.
set nocompatible                             " Turn off vi compatibility.
set undolevels=1000                          " Large undo levels.
set undofile                                 " Save undo tree.
set undodir=/tmp                             " Undo tree directory.
set history=50                               " Size of command history.
set encoding=utf8                            " Always use unicode.
set backspace=indent,eol,start               " Fix backspace.

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

set notimeout                                " Fix lag in iTerm.
set ttimeout
set timeoutlen=50
set modeline
set selection=inclusive                      " Select to the end of line.

set spelllang=en_au                          " Set spell check language.

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" ------------------------------------------------------------------------------
" Binds
" ------------------------------------------------------------------------------
let mapleader = ","               " Use comma as leader.

" Strip all trailing whistpace.
nnoremap <leader>W :call StripTrailingWhitespace()<CR>

" Rename buffer
nnoremap <Leader><Leader>r :Rename!<space>

" Tabular
nmap <Leader><Leader>c<Bar> :Tabularize /<Bar><CR>
vmap <Leader><Leader>c<Bar> :Tabularize /<Bar><CR>
nmap <Leader><Leader>c, :Tabularize /,<CR>
vmap <Leader><Leader>c, :Tabularize /,<CR>

" Ack
noremap <leader>a :Ack<space>

" Fugitive Status
map <Leader>s :Gstatus<CR>

" No highlight shortcut
nmap <Leader>n :nohlsearch<CR>

" Toggle paste mode
function! g:TogglePasteMode()
    if(&paste == 1)
        set nopaste
    else
        set paste
    endif
endfunc
nnoremap <C-P> :call g:TogglePasteMode()<cr>

" Reselect indented text after indent
vnoremap < <gv
vnoremap > >gv

" Save files with sudo
cmap w!! %!sudo tee > /dev/null %

" Run PyLint
noremap <Leader>l :PyLint<CR>

" Man pages always trigger by accident, make it harder
noremap K <Leader>k

" ------------------------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<Leader>t'

set wildignore+=*/.git/*,*.pyc
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn)$',
 \ }

let g:ctrlp_user_command = {
 \ 'types': {
 \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
 \ },
 \ 'fallback': 'find %s -type f'
 \ }

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set wrapscan                      " Wrap to top of buffer when searching.
set gdefault                      " Make search and replace global by default.

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=4                     " Set tab to equal 4 spaces.
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set shiftwidth=4                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set smarttab                      " Insert spaces in front of lines.
set listchars=tab:··,trail:·      " Show leading whitespace
set list

" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------
set shortmess=aIoO                " Show short messages, no intro.
set ttyfast                       " Fast scrolling when on a decent connection.
set wrap                          " Wrap text.
set showcmd                       " Show last command.
set ruler                         " Show the cursor position.
" set hidden                        " Allow hidden buffers.
set showmatch                     " Show matching parenthesis.
let loaded_matchparen = 1         " Don't highliht the matching paren, it's dumb
set matchpairs+=<:>               " Pairs to match.
set cmdheight=1                   " Make command line height to 1 line.
set cf                            " Enable error jumping.
set noerrorbells visualbell t_vb= " Switch off visual bell
set nu                            " Show line numbers
syntax on                         " Enable syntax highlighting.
filetype on                       " Detect file type.
filetype indent on                " Enable file indenting.
filetype plugin indent on         " Load syntax files for better indenting.

" ------------------------------------------------------------------------------
" User Interface
" ------------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=a             " Do not auto copy selection to clipboard.
endif

if has('mouse')
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
    set ttymouse=xterm2           " Enables split resizing in tmux
endif

" ------------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------------
set t_Co=256                      " Make vim aware of 256 colorspace
let base16colorspace=256          " Enable base16 256 colorspace
colorscheme base16-default
set background=dark
highlight ColorColumn ctermbg=236 guibg=#262D51

" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------

" Always show status.
set laststatus=2

" Disable status line fill chars.
set fillchars+=stl:\ ,stlnc:\ " Space.

" ------------------------------------------------------------------------------
" Git commits and diffs
" ------------------------------------------------------------------------------

" Show git diff side by side with commit message editor
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p     " vsplit
"autocmd FileType gitcommit DiffGitCached | wincmd p               " hsplit

" ------------------------------------------------------------------------------
" Python Mode
" ------------------------------------------------------------------------------

au FileType python setlocal colorcolumn=79 textwidth=80
let g:pymode_lint_config = '$HOME/.pylintrc'
let g:pymode_lint_checker = 'pyflakes,pep8'
let g:pymode_lint_ignore = 'C0301'
let g:pymode_lint_write = 0                         " I prefer manual linting
let g:pymode_lint_minheight = 20                    " Show me more
let g:pymode_folding = 0                            " Folding is annoying
let g:pymode_run = 0                                " Don't enable python run code
let g:pymode_breakpoint = 0                         " Don't need
let g:pymode_doc = 0                                " Don't need python documentation
let g:pymode_lint_write = 0                         " I prefer manual linting

" ------------------------------------------------------------------------------
" Golang
" ------------------------------------------------------------------------------

nnoremap <buffer> <silent> <Leader>k :Godoc<cr> " Godoc on leader k


" ------------------------------------------------------------------------------
" Ruby & Puppet
" ------------------------------------------------------------------------------

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype puppet setlocal ts=2 sts=2 sw=2

" ------------------------------------------------------------------------------
" Javascript & HTML
" ------------------------------------------------------------------------------

autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

let g:used_javascript_libs = 'jquery,angularjs,backbone,jasmine,underscore,requirejs'


" ------------------------------------------------------------------------------
" Haskell
" ------------------------------------------------------------------------------
au BufEnter *.hs compiler ghc
let g:haddock_browser='google-chrome'
autocmd Filetype haskell setlocal ts=8 sts=4 sw=4 expandtab shiftround

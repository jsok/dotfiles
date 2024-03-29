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

set splitright                               " Open vsplits on right
set splitbelow                               " Open splits below
set switchbuf=vsplit                         " Quickfix and location list open in vsplit

set exrc                                     " execute per-project vimrc files
set secure                                   " make exrc safer

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

" Dash App
:nmap <silent> <leader>d <Plug>DashSearch

" Run PyLint
noremap <Leader>l :PyLint<CR>

" Man pages always trigger by accident, make it harder
noremap K <Leader>k


" ------------------------------------------------------------------------------
" Ag - silver searcher
" ------------------------------------------------------------------------------
let g:ag_working_path_mode="r"

" ------------------------------------------------------------------------------
" fzf
" ------------------------------------------------------------------------------
" Maintain ctrl-p muscle memory
nmap <leader>p :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" ------------------------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------------------------
"let g:ctrlp_map = '<Leader>p'
"
"set wildignore+=*/.git/*,*.pyc
"let g:ctrlp_custom_ignore = {
" \ 'dir':  '\v[\/]\.(git|hg|svn)$',
" \ }
"
"let g:ctrlp_user_command = {
" \ 'types': {
" \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
" \ },
" \ 'fallback': 'find %s -type f'
" \ }

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
set synmaxcol=300                 " Limit to improve performance

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
    if has("mouse_sgr")
        set ttymouse=sgr          " Mouse works in columns beyond 223
    else
        set ttymouse=xterm2
    end
endif

" ------------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------------
set t_Co=256                      " Make vim aware of 256 colorspace
let base16colorspace=256          " Enable base16 256 colorspace
colorscheme base16-default-dark
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
" Autocompletiong via omnifunc
" ------------------------------------------------------------------------------

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" ------------------------------------------------------------------------------
" Python Mode
" ------------------------------------------------------------------------------

au FileType python setlocal colorcolumn=79 textwidth=80

let g:pymode_virtualenv = 1

" Linting
let g:pymode_lint_config = '~/.pylintrc'
let g:pymode_lint_checker = 'pyflakes,pep8'
let g:pymode_lint_ignore = 'C0301'
let g:pymode_lint_minheight = 20                    " Show me more
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
noremap <leader>l :PymodeLint<cr>

let g:pymode_folding = 0                            " Folding is annoying
let g:pymode_run = 0                                " Don't enable python run code
let g:pymode_breakpoint = 0                         " Don't need
let g:pymode_doc = 0                                " Don't need python documentation

" Rope completion
let g:pymode_rope_project_root = '~/.rope'
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'vnew'


" ------------------------------------------------------------------------------
" Golang
" ------------------------------------------------------------------------------

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" ctrl + space for autocomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
au FileType go nmap <leader>d <Plug>(go-def-vertical)
au FileType go set nolist

" ------------------------------------------------------------------------------
" Ruby & Puppet
" ------------------------------------------------------------------------------

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype puppet setlocal ts=2 sts=2 sw=2

" ------------------------------------------------------------------------------
" PHP (send help)
" ------------------------------------------------------------------------------

autocmd Filetype php setlocal iskeyword-=$
autocmd Filetype php setlocal synmaxcol=500  " PHP devs have no respect

" ------------------------------------------------------------------------------
" Javascript & HTML
" ------------------------------------------------------------------------------

autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
au BufNewFile,BufRead *.ejs set filetype=javascript

let g:used_javascript_libs = 'jquery,angularjs,backbone,jasmine,underscore,requirejs'

" ------------------------------------------------------------------------------
" JSON
" ------------------------------------------------------------------------------
autocmd Filetype json setlocal ts=2 sts=2 sw=2
let g:vim_json_syntax_conceal = 0

" ------------------------------------------------------------------------------
" YAML
" ------------------------------------------------------------------------------
autocmd FileType yml,yaml setlocal ts=2 sts=2 sw=2 expandtab iskeyword+=-

" ------------------------------------------------------------------------------
" Haskell
" ------------------------------------------------------------------------------
au BufEnter *.hs compiler ghc
let g:haddock_browser='google-chrome'
autocmd Filetype haskell setlocal ts=8 sts=4 sw=4 expandtab shiftround

" Filetype hints
au BufRead,BufNewFile nginx*.conf set ft=nginx

" ------------------------------------------------------------------------------
" Terraform
" ------------------------------------------------------------------------------
let g:terraform_fmt_on_save=1

" ------------------------------------------------------------------------------
" Markdown
" ------------------------------------------------------------------------------
let g:markdown_syntax_conceal = 0

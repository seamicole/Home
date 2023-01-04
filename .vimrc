" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ FILE SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Disable writing backup files
set nowb
set nobackup

" Disable writing to swap file
set noswapfile

" Enable persisting undos across sessions
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ DISPLAY SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Display line numbers
set number

" Display a vertical line
let &colorcolumn = "88"

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ VIM PLUG
" └─────────────────────────────────────────────────────────────────────────────────────

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" UI ───────────────────────────────────────────────────────────────────────────────────

" Gruvbox
Plug 'morhetz/gruvbox'

" Vim Airline
Plug 'vim-airline/vim-airline'

" NERDTree
Plug 'preservim/nerdtree'

" SYNTAX HIGHLIGHTING  ─────────────────────────────────────────────────────────────────

" Polyglot
Plug 'sheerun/vim-polyglot'

" FORMATTING / LINTING  ────────────────────────────────────────────────────────────────

" ALE
Plug 'dense-analysis/ale'

" Python Black
Plug 'psf/black', { 'branch': 'stable' }

" AUTOCOMPLETION ───────────────────────────────────────────────────────────────────────

" UltiSnips
Plug 'SirVer/ultisnips'

" SEARCH ───────────────────────────────────────────────────────────────────────────────

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GIT ──────────────────────────────────────────────────────────────────────────────────

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Vim Fugitive
Plug 'tpope/vim-fugitive'

" ──────────────────────────────────────────────────────────────────────────────────────

" Uninitialize vim-plug
call plug#end()

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ ALE SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Define ALE linters
let g:ale_linters = {
\    'python': ['flake8'],
\}

" Define ALE fixers
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': [],
\}

" Ensure ALE runs fixers on save
let g:ale_fix_on_save = 1

" Set ALE signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

" Set Python Flake8 max line length
let g:ale_python_flake8_options = '--max-line-length 88'

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ BLACK SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Trigger Black on save of .py files
autocmd BufWritePre *.py execute ':Black'

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ GRUVBOX SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Set Gruvbox colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

" Set background color palette to dark
set bg=dark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ NERDTREE SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Remap NERDTree toggle
map <C-t> :NERDTreeToggle<CR>

" Open NERDTree automatically when vim starts
autocmd vimenter * NERDTree | wincmd p

" Configure tree settings
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrows = 0
let g:NERDTreeNodeDelimiter = "\u00a0"

" Close vim if NERDTree is the only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Define NERDTree ignore
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ POLYGLOT SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Disable annoying red highlighting for temporary space / tab errors in Python
let g:python_highlight_space_errors = 0

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ ULTISNIPS SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Set UltiSnips expand trigger
let g:UltiSnipsExpandTrigger = "<tab>"

" Define UltiSnips custom snippet directory
let g:UltiSnipsSnippetDirectories = ['ulti-snips']

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ KEY MAPPINGS
" └─────────────────────────────────────────────────────────────────────────────────────
"
" Remap files command
nnoremap <C-f> :Files<Cr>

" Remap grep command
nnoremap <C-g> :Rg<Cr>

" Remap ctrl + s to save from normal mode
nmap <c-s> :w<CR>

" Remap ctrl + s to escape and save from insert mode
imap <c-s> <Esc>:w<CR>

" Remap ctrl + c to copy visual block to clipboard
vmap <c-c> "+y

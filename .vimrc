" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ CORE SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Disable writing backup files
set nowb
set nobackup

" Disable writing to swap file
set noswapfile

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ VIM PLUG
" └─────────────────────────────────────────────────────────────────────────────────────

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" UI -----------------------------------------------------------------------------------

" Gruvbox
Plug 'morhetz/gruvbox'

" Vim Airline
Plug 'vim-airline/vim-airline'

" NERDTree
Plug 'preservim/nerdtree'

" FORMATTING ---------------------------------------------------------------------------

" Python Black
Plug 'psf/black', { 'branch': 'stable' }

" GIT ----------------------------------------------------------------------------------

" Git gutter
Plug 'airblade/vim-gitgutter'

" Vim fugitive
Plug 'tpope/vim-fugitive'

" --------------------------------------------------------------------------------------

" Uninitialize vim-plug
call plug#end()

" ┌─────────────────────────────────────────────────────────────────────────────────────
" │ UI SETTINGS
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
" │ PRODUCTIVITY SETTINGS
" └─────────────────────────────────────────────────────────────────────────────────────

" Enable persisting undos across sessions
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

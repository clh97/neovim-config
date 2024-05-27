call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'pmizio/typescript-tools.nvim'
call plug#end()

lua require('init')

" let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1

let g:fzf_command_prefix = 'Fz'
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Toggle
nnoremap <leader>n :NERDTreeToggle<CR>

" Find files
nnoremap <leader>N :NERDTreeFind<CR>

colorscheme gruvbox " Set colorscheme to gruvbo
set background=dark " Set background to dark
syntax enable " Enable syntax highlighting
set hidden " Required to keep multiple buffers open
set number " Show line numbers
set relativenumber " Show relative line numbers
set inccommand=split " Show live preview of substitution

" Open vim config file
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

" Source vim config file 
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Leader + arrow keys to change splits
nnoremap <leader><Left> <C-w>h
nnoremap <leader><Down> <C-w>j
nnoremap <leader><Up> <C-w>k
nnoremap <leader><Right> <C-w>l

" Leader + gh to open lazygit in a new split
" nnoremap <leader>gh :vsp | terminal lazygit<cr>

" Leader + f to search files
nnoremap <leader>f :FZF<cr>

" Leader + ; to toggle comments
nnoremap <leader>; :Commentary<cr>

" Leader + tab to navigate between tabs
nnoremap <leader><Tab> :tabn<cr>

" Leader + shift + tab to navigate between tabs in reverse
nnoremap <leader><S-Tab> :tabp<cr>


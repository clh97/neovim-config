call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
" Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1

let g:fzf_command_prefix = 'Fz'
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

" colorscheme gruvbox
set background=dark

set hidden
set number
set relativenumber
set inccommand=split

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 

let g:deoplete#enable_at_startup = 1

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-x>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

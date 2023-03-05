call plug#begin(stdpath('data') . '/plugged')
Plug 'haya14busa/incsearch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
call plug#end()


:command! -bar -bang Q quit<bang>
" Set line numbers
:set number

" set absolute line numbers in insert mode, and relative in normal mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
" show both line and column number in bottom right corner
:set ruler
" set incremental search
:set is
" set highlight search
:set hls
" set no compatible mode
:set nocp
" wildmenu and wildmode
:set wildmenu
:set wildmode=longest:full,full
:set ts=4 sw=4
:map /  <Plug>(incsearch-forward)
:map ?  <Plug>(incsearch-backward)
:map g/ <Plug>(incsearch-stay)
:map  <C-t> :tabnew<CR>
:map  <C-Right> :tabn<CR>
:map  <C-Left> :tabp<CR>
:map  <C-l> :tabn<CR>
:map  <C-h> :tabp<CR>
:map  <C-a> :qa<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-w> :q<CR>
nnoremap <C-e> <C-w><C-w>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-y> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" for coc taken from its github
" START
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" STOP

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Git diff<CR>
let g:NERDTreeWinSize=60

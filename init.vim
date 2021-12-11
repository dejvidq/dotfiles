call plug#begin(stdpath('data') . '/plugged')
Plug 'haya14busa/incsearch.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

set mouse+=a
set termguicolors
colorscheme dracula
lua << EOF
require'nvim-tree'.setup {
	disable_netrw = true,
	open_on_setup = true,
	open_on_tab = true,
	update_cwd = true,
	filters = {
		dotfiles = false,
	},
	view = {
		width = 40
	}
}
require("indent_blankline").setup {}
require('nvim_comment').setup()
require('gitsigns').setup {
	current_line_blame = true
}
EOF


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
:map  <C-S-Right> :tabn<CR>
:map  <C-S-Left> :tabp<CR>
:map  <C-S-l> :tabn<CR>
:map  <C-S-h> :tabp<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-w> :q<CR>
inoremap <C-w> <ESC>:q<CR>i
nnoremap <C-e> <C-w><C-w>
inoremap <C-e> <ESC><C-w><C-w>i
nnoremap <C-y> :NvimTreeToggle<CR>
inoremap <C-y> <ESC>:NvimTreeToggle<CR>i

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
nnoremap <silent> <C-Right> :BufferNext<CR>
inoremap <silent> <C-Right> <ESC>:BufferNext<CR>i
nnoremap <silent> <C-Left> :BufferPrevious<CR>
inoremap <silent> <C-Left> <ESC>:BufferPrevious<CR>i
nnoremap <silent> <C-l> :BufferNext<CR>
inoremap <silent> <C-l> <ESC>:BufferNext<CR>i
nnoremap <silent> <C-h> :BufferPrevious<CR>
inoremap <silent> <C-h> <ESC>:BufferPrevious<CR>i
nnoremap <silent> <leader>bn :BufferNext<CR>
nnoremap <silent> <leader>bp :BufferPrevious<CR>
nnoremap <silent> <leader>e :edit<space>
nnoremap <silent> <leader>q :BufferClose<CR>
nnoremap <silent> <C-a-q> :qa!<CR>
inoremap <silent> <C-a-q> <ESC>:qa!<CR>
nnoremap <silent> <leader>c :CommentToggle<CR>j

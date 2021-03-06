call plug#begin(stdpath('data') . '/plugged')
Plug 'haya14busa/incsearch.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update3
Plug 'williamboman/nvim-lsp-installer'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'
call plug#end()


set mouse+=a
set termguicolors
colorscheme dracula
highlight Normal guibg=None
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
require'lspconfig'.bashls.setup{
	on_attach = on_attach
}
require'lspconfig'.pyright.setup{
	on_attach = on_attach
}
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()
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
:map  <leader>t :tabnew<CR>
:map  <C-S-Right> :tabn<CR>
:map  <C-S-Left> :tabp<CR>
:map  <C-S-l> :tabn<CR>
:map  <C-S-h> :tabp<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-w> :q<CR>
inoremap <C-w> <ESC>:q<CR>i
nnoremap <C-q> <C-w><C-w>
inoremap <C-e> <ESC><C-w><C-w>i
nnoremap <C-y> :NvimTreeToggle<CR>
inoremap <C-y> <ESC>:NvimTreeToggle<CR>i
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :Lines<CR>
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
inoremap <silent> <C-f> <ESC>/
nnoremap <silent> <leader>rg :Rg<CR>
nnoremap <silent> <leader>p :w<CR>:term python %<CR>
nnoremap <F3> :set hlsearch!<CR>
inoremap <F3> <ESC>:set hlsearch!<CR>i
nnoremap <silent> <leader>ts :Gitsigns toggle_signs<CR>
nnoremap <silent> <leader>tl :Gitsigns toggle_linehl<CR>
nnoremap <silent> <leader>tn :Gitsigns toggle_numhl<CR>
vnoremap  y  "+y
nnoremap  yy  "+yy
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

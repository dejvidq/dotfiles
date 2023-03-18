call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
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
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'machakann/vim-sandwich'
Plug 'bogado/file-line'
Plug 'mfussenegger/nvim-lint'

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

if has('win32')
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;'
	let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	set shellquote= shellxquote=
endif
set mouse+=a
set termguicolors
colorscheme dracula
highlight Normal guibg=None
highlight NonText guifg=#ffffe0
set cc=120 
highlight ColorColumn ctermbg=8 guibg=LightGreen
lua << EOF
vim.g.mapleader = " "
require("mason").setup()
require("mason-lspconfig").setup()
require('lint').linters_by_ft = {
  python = {'flake8', 'mypy'}
}
require'nvim-tree'.setup {
	disable_netrw = true,
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
require("gitsigns").setup {
    current_line_blame = false,
	current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align',
        delay = 500,
        ignore_whitespace = false,
    }
}
require'lspconfig'.pyright.setup{
    on_atach = on_attach
}
require'lspconfig'.bashls.setup{
    on_atach = on_attach
}
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
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
:map  <leader>t :tabnew<CR>
:map  <C-S-Right> :tabn<CR>
:map  <C-S-Left> :tabp<CR>
:map  <C-S-l> :tabn<CR>
:map  <C-S-h> :tabp<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-b> <C-w><C-w>
inoremap <C-b> <ESC><C-w><C-w>i
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
vnoremap <silent> <leader>c :CommentToggle<CR>
inoremap <silent> <C-f> <ESC>/
nnoremap <silent> <leader>rg :Rg<CR>
nnoremap <silent> <leader>p :w<CR>:term python %<CR>
nnoremap <F3> :set hlsearch!<CR>
inoremap <F3> <ESC>:set hlsearch!<CR>i
nnoremap <silent> <leader>ts :Gitsigns toggle_signs<CR>
nnoremap <silent> <leader>tl :Gitsigns toggle_linehl<CR>
nnoremap <silent> <leader>tn :Gitsigns toggle_numhl<CR>
vnoremap <leader>y  "+y
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <A-Right> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <A-Left> <cmd>lua vim.diagnostic.goto_prev()<CR>
inoremap <A-Right> <cmd>lua vim.diagnostic.goto_next()<CR>
inoremap <A-Left> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>b :Gitsigns toggle_current_line_blame<CR>
inoremap jk <ESC>
tnoremap jk <C-\><C-n> 
nnoremap <space>v <c-v>

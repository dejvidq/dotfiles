local opt = vim.opt
vim.cmd.colorscheme("tokyonight")
vim.cmd([[highlight clear CursorLineNr]])
vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight LineNr guifg=white]])
vim.cmd([[highlight CursorLineNr guifg=yellow]])
-- require("mason").setup()
-- require("mason-lspconfig").setup()
--
--
vim.wo.relativenumber = true
--
vim.o.mouse = "a"
--
vim.o.undofile = true
--
vim.wo.signcolumn = "yes"
--
vim.o.updatetime = 250
vim.o.timeoutlen = 300
--
vim.o.termguicolors = true
--
opt.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4
--
--
opt.autowrite = true -- Enable auto write
--
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 8 -- Lines of context
opt.shiftround = true -- Round indent
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.undolevels = 10000
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true
end
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },
})

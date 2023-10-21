vim.g.mapleader = " "
vim.g.localleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:append("lua")

require("lazy").setup({ import = "core.plugins" })

require("core.settings")
require("core.keymaps")
require("core.lsp")

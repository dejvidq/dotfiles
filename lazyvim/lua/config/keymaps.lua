-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if vim.fn.executable("flake8") == 1 and vim.fn.executable("mypy") == 1 then
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end
vim.cmd("command! Mypy set makeprg=mypy | silent make % | copen")
vim.cmd("command! -bar -bang Q quit<bang>")
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })

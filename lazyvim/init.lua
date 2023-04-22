-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[highlight clear CursorLineNr]])
vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight LineNr guifg=white]])
vim.cmd([[highlight CursorLineNr guifg=yellow]])

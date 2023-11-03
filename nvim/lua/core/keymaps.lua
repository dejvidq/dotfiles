-- jk as ESC
vim.keymap.set("i", "jk", "<ESC>")
-- Copy & paste
-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank motion to clipboard" }) -- yank motion

-- Delete into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>dd", '"+d', { desc = "Delete motion to clipboard" }) -- delete motion

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after cursor from clipboard" }) -- paste after cursor
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before cursor from clipboard" }) -- paste before cursor
-- Buffers
vim.keymap.set("n", "<leader>bd", function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 1 then -- Yes
            vim.cmd.write()
            bd(0)
        elseif choice == 2 then -- No
            bd(0, true)
        end
    else
        bd(0)
    end
end, { desc = "Delete Buffer" })

-- stylua: ignore
vim.keymap.set("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end,
    { desc = "Delete Buffer (Force)" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
vim.keymap.set("n", "[b", "<cmd>bprev<CR>")
-- Git
vim.keymap.set("n", "<leader>ghl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
-- Aerial
vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<cr>", { desc = "Aerial Toggle" })
vim.keymap.set("n", "<leader>at", "<cmd>Telescope aerial<cr>", { desc = "Telescope aerial" })
vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { desc = "Aerial previous" })
vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { desc = "Aerial next" })
-- Flash
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>lua require('flash').jump()<cr>", { desc = "Flash" })
-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<leader><Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader><Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<leader><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- Move Lines
vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Mason
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Undotree
vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { desc = "Undotree toggle" })
vim.keymap.set("n", "<leader>ut", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })

-- Telescope
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>sD", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })

-- Todo comments
-- stylua: ignore start
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Telescope todo" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil --float .<cr>", { desc = "Oil in curr dir" })
vim.keymap.set("n", "<leader>E", "<cmd>Oil --float " .. vim.fn.expand("%:p:h") .. "<cr>", { desc = "Oil in curr dir" })

-- Refactor
vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end,
    { desc = "Extract Function" })
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end,
    { desc = "Extract Function To File" })
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end,
    { desc = "Extract Variable" })
vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end,
    { desc = "Inline Function" })
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end,
    { desc = "Inline Variable" })
vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end,
    { desc = "Extract Block" })
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end,
    { desc = "Extract Block To File" })

-- DAP
vim.keymap.set({ "n", "v" }, "<leader>tb", function() require('dap').toggle_breakpoint() end,
    { desc = "DAP toggle breakpoint" })
vim.keymap.set({ "n", "v" }, "<leader>bc", function() require('dap').continue() end,
    { desc = "DAP continue" })
vim.keymap.set('n', '<leader>so', function() require('dap').step_over() end, { desc = "DAP step over" })
vim.keymap.set('n', '<leader>si', function() require('dap').step_into() end, { desc = "DAP step into" })
vim.keymap.set('n', '<leader>sO', function() require('dap').step_out() end, { desc = "DAP step over" })
vim.keymap.set('n', '<leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    { desc = "DAP set breakpoint with log" })
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = "DAP REPL open" })
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = "DAP run last" })
vim.keymap.set({ 'n', 'v' }, '<leader>dh', function() require('dap.ui.widgets').hover() end, { desc = "DAP hover" })
vim.keymap.set({ 'n', 'v' }, '<leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "DAP preview" })
vim.keymap.set('n', '<leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = "DAP frames" })
vim.keymap.set('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = "DAP scopes" })
vim.keymap.set("n", "<leader>dt", function() require('dap').terminate() end, { desc = "DAP terminate" })

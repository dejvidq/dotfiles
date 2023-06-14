-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
local luasnip = require "luasnip"
local snippet = luasnip.snippet
local text = luasnip.text_node
luasnip.add_snippets("python", {
  snippet("pdb", {
    text("import pdb; pdb.set_trace()"),
  }),
})
require("luasnip.loaders.from_vscode").lazy_load()
if vim.loop.os_uname().sysname == "Windows_NT" then
  require("nvim-treesitter.install").compilers = { "clang" }
end
return {
  -- add gruvbox
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end,
  },
  { "nvie/vim-flake8" },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ghl", ":Gitsigns toggle_current_line_blame<CR>" },
    },
    opts = {
      current_line_blame_opts = {
        virt_text_pos = "right_align",
      },
    },
  },
  { "bogado/file-line" },
  { "mfussenegger/nvim-lint" },
  {
    "yamatsum/nvim-cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "flake8",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
  {
    "evanleck/vim-svelte",
  },
  {
    "dstein64/vim-startuptime",
    enabled = false,
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "RRethy/vim-illuminate",
    enabled = false,
  },
}

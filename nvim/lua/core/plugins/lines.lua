return {
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        -- See `:help lualine.txt`
        opts = {
            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = "",
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "yamatsum/nvim-cursorline",
        opts = {},
    },
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },
}

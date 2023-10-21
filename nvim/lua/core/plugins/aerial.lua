return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("telescope").load_extension("aerial")
            require("aerial").setup({
                layout = {
                    min_width = 20,
                    resize_to_content = false,
                },
            })
        end,
    },
}

return {
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
            },
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}

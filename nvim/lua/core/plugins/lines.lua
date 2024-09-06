local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end
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
            sections = {
                lualine_c = {
                    { "filename" },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                },
                lualine_x = {
                    {
                        "macro-recording",
                        fmt = show_macro_recording,
                        color = { fg = "#ff966c" },
                    },
                    { "encoding" },
                    { "fileformat" },
                },
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

return {
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            local navic = require('nvim-navic')

            navic.setup {
                highlight = true, -- Active les highlights dans la barre de navigation
            }
        end
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    priority = 15,
                    style = {
                        { fg = "#806d9c" },
                        { fg = "#c21f30" },
                    },
                    use_treesitter = true,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "╭",
                        left_bottom = "╰",
                        right_arrow = ">",
                    },
                    textobject = "",
                    max_file_size = 1024 * 1024,
                    error_sign = true,
                    -- animation related
                    duration = 200,
                    delay = 300,
                },
                indent = {
                    enable = true,
                    priority = 10,
                    style = {
                        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    },
                    use_treesitter = false,
                    chars = {
                        "│",
                        "¦",
                        "┆",
                    },
                    ahead_lines = 1,
                    delay = 100,
                },
                line_num = {
                    enable = true,
                    style = "#806d9c",
                },
            })
        end
    },
}

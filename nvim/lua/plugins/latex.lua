return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
        end,
        keys = {
            { "<leader>lc", "<cmd>VimtexCompile<cr>",       desc = "LaTeX: Compile" },
            { "<leader>ll", "<cmd>VimtexCompileToggle<cr>", desc = "LaTeX: Auto Compile (toggle)" },
            { "<leader>lv", "<cmd>VimtexView<cr>",          desc = "LaTeX: View PDF" },
            { "<leader>lk", "<cmd>VimtexClean<cr>",         desc = "LaTeX: Clean build" },
        },
    },
}

-- Buffer-local tweaks for TeX files
vim.opt_local.conceallevel = 2 -- keep math pretty but text readable
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- If you prefer no conceal at all, uncomment:
-- vim.opt_local.conceallevel = 0

-- Handy mappings (buffer-local duplicates of plugin keys if you prefer here)
-- vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<cr>",      { buffer = true, desc = "LaTeX: Compile" })
-- vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompileToggle<cr>",{ buffer = true, desc = "LaTeX: Auto Compile (toggle)" })
-- vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>",         { buffer = true, desc = "LaTeX: View PDF" })
-- vim.keymap.set("n", "<leader>lk", "<cmd>VimtexClean<cr>",        { buffer = true, desc = "LaTeX: Clean build" })

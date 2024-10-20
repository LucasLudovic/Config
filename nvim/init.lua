local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

vim.cmd.colorscheme "kanagawa"

-- color theme
vim.cmd [[colorscheme kanagawa]]

-- Tab Command Shortcut
vim.keymap.set("n", "<A-t>n", ":tabnew<CR>", { noremap = true, silent = true, desc = "open new tab" })
vim.keymap.set("n", "<A-t>q", ":tabclose<CR>", { noremap = true, silent = true, desc = "close current tab" })

-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- tab & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.softtabstop = 4

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- key binding
vim.api.nvim_set_keymap('n', '<S-t>', ':Neotree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-q>', ':q<CR>', { noremap = true, silent = true })

-- Change terminal
vim.keymap.set("n", "<A-h>", "<C-\\><C-N><C-w>h", { desc = 'move left in normal mode' })
vim.keymap.set("n", "<A-j>", "<C-\\><C-N><C-w>j", { desc = 'move down in normal mode' })
vim.keymap.set("n", "<A-k>", "<C-\\><C-N><C-w>k", { desc = 'move up in normal mode' })
vim.keymap.set("n", "<A-l>", "<C-\\><C-N><C-w>l", { desc = 'move right in normal mode' })

-- Telescope Keybind
vim.keymap.set("n", "<C-t>l", ":Telescope live_grep<CR>",
    { noremap = true, silent = true, desc = 'open live grep with Telescope' })
vim.keymap.set("n", "<C-t>f", ":Telescope find_files<CR>",
    { noremap = true, silent = true, desc = 'open file search with Telescope' })

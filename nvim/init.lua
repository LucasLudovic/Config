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

vim.cmd.colorscheme "catppuccin"

-- color theme
vim.cmd[[colorscheme catppuccin]]

-- tab & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.softtabstop = 1

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- key binding
vim.api.nvim_set_keymap('n', '<S-t>', ':Neotree<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-q>', ':q<CR>', {noremap = true, silent = true})

-- Change terminal
vim.keymap.set("n", "<A-h>", "<C-\\><C-N><C-w>h", { desc = 'move left in normal mode' })
vim.keymap.set("n", "<A-j>", "<C-\\><C-N><C-w>j", { desc = 'move down in normal mode' })
vim.keymap.set("n", "<A-k>", "<C-\\><C-N><C-w>k", { desc = 'move up in normal mode' })
vim.keymap.set("n", "<A-l>", "<C-\\><C-N><C-w>l", { desc = 'move right in normal mode' })

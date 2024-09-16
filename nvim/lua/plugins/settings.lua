return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "drawbu/vim-epitech" },
    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
},
{
    "williamboman/mason.nvim"
},
{
  "nvim-lua/plenary.nvim"
},
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
{
        "airblade/vim-gitgutter"
},
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
            'nvim-lua/plenary.nvim'
        }
}
}

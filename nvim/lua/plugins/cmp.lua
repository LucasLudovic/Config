return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'tamago324/cmp-zsh',
        'hrsh7th/cmp-nvim-lua',
        'SergioRibera/cmp-dotenv',

        -- LuaSnip
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'zbirenbaum/copilot-cmp',

        -- Icons
        'onsails/lspkind.nvim',
    },
    config = function()
        require('copilot_cmp').setup()
        require('luasnip.loaders.from_vscode').lazy_load() -- lspkind
        local cmp = require('cmp')

        -- Buffer completion
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<C-e>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm { select = true },
            }),
            sources = {
                { name = 'path' },
                { name = 'copilot' },
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'dotenv' },
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    local kind = require('lspkind').cmp_format({
                        mode = 'symbol_text',
                        max_width = 50,
                        symbol_map = { nvim_lua = ' ', dotenv = '', Copilot = '' },
                    })(entry, vim_item)
                    local strings = vim.split(kind.kind, '%s', { trimempty = true })
                    kind.kind = ' ' .. (strings[1] or '') .. ' '
                    kind.menu = '    (' .. (strings[2] or '') .. ')'

                    return kind
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
        })

        -- Autocomplete search
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = 'buffer' } }
        })

        -- Autocomplete command
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = 'path' } },
                { { name = 'cmdline' } },
                { { name = 'zsh' } }
            )
        })
    end,
}

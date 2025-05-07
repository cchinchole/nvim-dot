return {
    {
        'typicode/bg.nvim',
        lazy = false,
    },
    {
        'rose-pine/nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = "moon",
                enable = {
                    terminal = true,
                },
            })
            --vim.cmd([[colorscheme rose-pine-moon]])
            --vim.cmd([[hi normal guibg=#0a080f]])
        end,
    },
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = false,
        priority = 1000,
        config = function()
            --vim.cmd [[colorscheme moonfly]]
        end
    },
    {
        'shaunsingh/nord.nvim',
        priority = 1000,
        config = function()
            --vim.cmd("colorscheme nord")
            --vim.cmd([[hi normal guibg=#0a080f]])
        end
    },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
--            vim.cmd([[colorscheme catppuccin]])
        end
    },
    {
        'olimorris/onedarkpro.nvim',
        priority = 1000,
        config = function()
            --vim.cmd("colorscheme onedark_dark")
        end
    },
    {
        'ray-x/starry.nvim',
        priority = 1000,
        config = function()
            require("starry").setup({
                style = {
                    name = 'oceanic',
                }
            })
            --vim.cmd("colorscheme starry")
        end
    },
    { 'oncomouse/lushwal.nvim', cmd = { 'LushwalCompile' }, dependencies = { { 'rktjmp/lush.nvim' }, { 'rktjmp/shipwright.nvim' }, }, },
    {
        'uZer/pywal16.nvim',
        config = function()
            --require('pywal16').setup()
        end,
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
           -- vim.cmd('colorscheme nightfox')
        end
    },
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd('colorscheme cyberdream')
        end
    },
    {
        'RRethy/base16-nvim',
        lazy = false,
        priority = 1000,
        config = function()
              vim.cmd('colorscheme base16-chalk')
             -- vim.cmd('colorscheme base16-3024')
                
            -- set_colorscheme(vim.fn.readfile(base16_theme_fname)[1])
        end
    },
}

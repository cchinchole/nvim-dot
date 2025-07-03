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
                options = {
                    transparent = true,
                },
                variant = "dusk",
                enable = {
                    terminal = true,
                },
            })
        end,
    },
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = false,
        priority = 1000,
    },
    {
        'shaunsingh/nord.nvim',
        priority = 1000,
        lazy = false,
    },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                transparent = true,
                flavour = "mocha",
            })
        end
    },
    {
        'olimorris/onedarkpro.nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require('onedarkpro').setup({
                options = {
                    transparent = true,
                }
            })
        end
    },
    {
        'ray-x/starry.nvim',
        priority = 1000,
        config = function()
            require("starry").setup({
                style = {
                    name = 'oceanic',
                },
                options = {
                    transparent = true,
                },
            })
        end
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                },
            })
        end
    },
    {
        'RRethy/base16-nvim',
        lazy = false,
        priority = 1000,
    },
}

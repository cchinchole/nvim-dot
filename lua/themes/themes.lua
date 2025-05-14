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
    },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
        end
    },
    {
        'olimorris/onedarkpro.nvim',
        priority = 1000,
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
        end
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'RRethy/base16-nvim',
        lazy = false,
        priority = 1000,
    },
}

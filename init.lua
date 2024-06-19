-- Vim Setup
-- Leader Key
vim.g.mapleader = " "

vim.opt.nu = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.updatetime = 5

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Lazy Install
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
require("lazy").setup({
    spec = {
        { "folke/which-key.nvim" },
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
            laze = false,
            priority = 1000,
            config = function()
                --vim.cmd([[colorscheme moonfly]])
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
                --vim.cmd([[colorscheme catppuccin]])
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
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require('lualine').setup()
            end
        },
        { import = "plugins" },
    }
})

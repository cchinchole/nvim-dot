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

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


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
                vim.o.termguicolors = true
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
                vim.cmd([[colorscheme catppuccin]])
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
        { 'nvim-lua/plenary.nvim' },
        { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'mfussenegger/nvim-jdtls'},
        { 'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup({
                    formatters_by_ft = {
                        lua = { "stylua" },
                        svelte = { { "prettierd", "prettier" } },
                        javascript = { { "prettierd", "prettier" } },
                        typescript = { { "prettierd", "prettier" } },
                        javascriptreact = { { "prettierd", "prettier" } },
                        typescriptreact = { { "prettierd", "prettier" } },
                        json = { { "prettierd", "prettier" } },
                        graphql = { { "prettierd", "prettier" } },
                        java = { "google-java-format" },
                        kotlin = { "ktlint" },
                        ruby = { "standardrb" },
                        markdown = { { "prettierd", "prettier" } },
                        erb = { "htmlbeautifier" },
                        html = { "htmlbeautifier" },
                        bash = { "beautysh" },
                        proto = { "buf" },
                        rust = { "rustfmt" },
                        yaml = { "yamlfix" },
                        toml = { "taplo" },
                        css = { { "prettierd", "prettier" } },
                        scss = { { "prettierd", "prettier" } },
                    },
                })

                vim.keymap.set({ "n", "v" }, "<leader>l", function()
                    require("conform").format({
                        lsp_fallback = true,
                        async = false,
                        timeout_ms = 500,
                    })
                end, { desc = "Format file or range (in visual mode)" })
            end
        },
        { import = "plugins" },
    }
}
)

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({

    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tsserver",
        "clangd",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})

-- Tree Sitter Setup
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "php", "cpp", "rust", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

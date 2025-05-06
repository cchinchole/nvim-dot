return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = false,
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'mfussenegger/nvim-jdtls',
            'stevearc/conform.nvim',
        },
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

            --LSP Zero setup
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            -- lsp_zero.configure('lua_ls', {
            --     settings = {
            --         Lua = {
            --             diagnostics = {
            --                 globals = { 'vim' },
            --             },
            --         },
            --     },
            -- })

            vim.diagnostic.config({
                 virtual_text = true, -- Show inline error messages
                 float = { border = "rounded" }, -- Customize floating window
            })

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set('n', '<leader>ge', vim.diagnostic.goto_next, opts)
            end)

            -- Mason Setup
            require("mason").setup({
                ui = {
                    border = "rounded",
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                    "jdtls",
                    "pyright",
                    "gopls",
                },
                handlers = {
                    --function(server_name)
                    --    require("lspconfig")[server_name].setup({})
                    --end,

                    --lua_ls = function()
                    --    local lua_opts = lsp_zero.nvim_lua_ls()
                    --    require("lspconfig").lua_ls.setup(lua_opts)
                    --end,
                    lsp_zero.default_setup,
                },
            })

            -- Keybinds
            vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",{ noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
            vim.keymap.set({ "n", "v" }, "<leader>l", function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end)
        end
    },
}

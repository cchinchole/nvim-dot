return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = false,
        dependencies = {
            'neovim/nvim-lspconfig',
            'stevearc/conform.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'mfussenegger/nvim-jdtls',
            'j-hui/fidget.nvim',
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    --  lua = { "stylua" },
                    --  svelte = { { "prettierd", "prettier" } },
                    --  javascript = { { "prettierd", "prettier" } },
                    --  typescript = { { "prettierd", "prettier" } },
                    --  javascriptreact = { { "prettierd", "prettier" } },
                    --  typescriptreact = { { "prettierd", "prettier" } },
                    --  json = { { "prettierd", "prettier" } },
                    --  graphql = { { "prettierd", "prettier" } },
                    --  java = { "google-java-format" },
                    --  kotlin = { "ktlint" },
                    --  ruby = { "standardrb" },
                    --  markdown = { { "prettierd", "prettier" } },
                    --  erb = { "htmlbeautifier" },
                    --  html = { "htmlbeautifier" },
                    --  bash = { "beautysh" },
                    --  proto = { "buf" },
                    --  rust = { "rustfmt" },
                    --  yaml = { "yamlfix" },
                    --  toml = { "taplo" },
                    --  css = { { "prettierd", "prettier" } },
                    --  scss = { { "prettierd", "prettier" } },
                },
            })

            --LSP Zero setup
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            vim.diagnostic.config({
                virtual_text = true,            -- Show inline error messages
                float = { border = "rounded" }, -- Customize floating window
            })

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set('n', '<leader>ge', vim.diagnostic.goto_next, opts)
            end)

            local cmp = require('cmp')
            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require('fidget').setup({})
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

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<Return>'] = cmp.mapping.confirm({ select = true }),
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })

            -- Keybinds
            vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
                { noremap = true, silent = true })
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

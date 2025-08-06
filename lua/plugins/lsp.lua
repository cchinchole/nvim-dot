vim.pack.add({
    {src = 'https://github.com/neovim/nvim-lspconfig'},
    {src = 'https://github.com/hrsh7th/nvim-cmp'},
    {src = 'https://github.com/hrsh7th/cmp-nvim-lsp'},
    {src = 'https://github.com/hrsh7th/cmp-buffer'},
    {src = 'https://github.com/hrsh7th/cmp-path'},
    {src = 'https://github.com/hrsh7th/cmp-cmdline'},
    {src = 'https://github.com/L3MON4D3/LuaSnip'},
    {src = 'https://github.com/saadparwaiz1/cmp_luasnip'},
    {src = 'https://github.com/j-hui/fidget.nvim'},
    {src = 'https://github.com/stevearc/conform.nvim'}
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
        spacing = 4,
        prefix = '●',
    },
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})

-- Setup nvim-cmp
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

vim.lsp.enable({ 'clangd', 'lua_ls', 'rust_analyzer' })

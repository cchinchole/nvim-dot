vim.pack.add({
    {src = 'https://github.com/RRethy/base16-nvim.git'},
    {src = 'https://git.sr.ht/~swaits/colorsaver.nvim'},
    {src = 'https://github.com/brenoprata10/nvim-highlight-colors'},
    {src ='https://github.com/HiPhish/rainbow-delimiters.nvim'},
    {src ='https://github.com/nvim-lua/plenary.nvim'}
})

--require('colorsaver').setup({})
require('nvim-highlight-colors').setup({})

local rainbow_delimiters = require 'rainbow-delimiters'
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    }
}

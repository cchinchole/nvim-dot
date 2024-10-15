-- Vim Setup
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

-- keybind for auto complete braces
-- vim.keymap.set('i', '{', '{<CR>}<Esc>ko')

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
        { 'folke/which-key.nvim' },
        {
            'VonHeikemen/searchbox.nvim',
            dependencies = { 'MunifTanjim/nui.nvim' },
            config = function()
                vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')
                --vim.keymap.set('n', '<leader>ss', ':SearchBoxIncSearch <C-r>=expand(\'<cword>\')<CR><CR>')
                vim.keymap.set('n', '<leader>r', ':SearchBoxReplace<CR>')
                --vim.keymap.set('n', '<leader>rr', ':SearchBoxReplace confirm=menu -- <C-r>=expand(\'<cword>\')<CR><CR>')
            end
        },
        {
            'vidocqh/data-viewer.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'kkharji/sqlite.lua',
            },
        },
        { import = "themes", },
        { import = "plugins" },
    }
})



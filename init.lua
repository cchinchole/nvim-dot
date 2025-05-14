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
vim.keymap.set('n', '<Tab>', ':b#<CR>', { noremap = true, silent = true })

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
        { import = "themes", },
        { import = "plugins" },
    }
})

vim.cmd('colorscheme onedark_dark')



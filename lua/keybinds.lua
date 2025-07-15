local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Moving visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Move selection horizontally
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Jump half page with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

--Keep search match centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remove sticking to clipboard when deleting
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "x", '"_x', opts)

-- Keep yanked after pasting
vim.keymap.set("v", "p", '"_dp', opts)  

-- Yank to system clipboard in normal mode (e.g., yank entire line)
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Yank to system clipboard in visual mode
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Paste from system clipboard
vim.keymap.set('n', '<leader>P', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>P', '"+p', { desc = 'Paste from system clipboard' })

-- Stop highlighting and escape insert
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Find and replace under keyboard
vim.keymap.set('n', '<leader>fr', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

vim.keymap.set('n', '<leader>ql', function() require('quote_length').get_quote_length() end, { desc = 'Display quoted text length' })

--local refactor = require('parameters')
--vim.keymap.set('n', '<leader>sp', refactor.swap_parameter_with_previous, { desc = "Swap parameter with previous" })
--vim.keymap.set('n', '<leader>sn', refactor.swap_parameter_with_next, { desc = "Swap parameter with next" })

local opts = { noremap = true, silent = true }

-- Moving visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

-- Move selection horizontally
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Jump half page with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down in buffer with cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up in buffer with cursor centered' })

--Keep search match centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remove sticking to clipboard when deleting
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('v', 'x', '"_x', opts)

-- Keep yanked after pasting
vim.keymap.set('v', 'p', '"_dp', opts)  

-- Stop highlighting and escape insert
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { desc = 'Clear search hl', silent = true })

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>')

-- Formatting
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Find and replace under keyboard
vim.keymap.set('n', '<leader>fr', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Refactoring
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: Rename symbol' })


-- Plugins

-- Oil
vim.keymap.set('n', '<leader>e', require('oil').toggle_float, { desc = 'Toggle oil from the parent directory' })

-- Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal insert mode' })

-- LSP
vim.keymap.set('i', '<C-space>', vim.lsp.completion.get, { desc = 'trigger autocompletion' })
vim.keymap.set('i', '<Enter>', function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<Enter>' end, { expr = true })

-- Todo comments
--vim.keymap.set('n', '<leader>tl', ':TodoQuickFix<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>nt', function() require('todo-comments').jump_next() end, { desc = 'Next todo comment' })
--vim.keymap.set('n', '<leader>NT', function() require('todo-comments').jump_prev() end, { desc = 'Previous todo comment' })

-- Conform
vim.keymap.set({'n', 'v'}, '<leader>l', function() require('conform').format({lsp_fallback = true, async = false, timeout_ms = 500}) end, { desc = 'Format' })

-- Snacks
vim.keymap.set('n', '<leader><space>',      function() Snacks.picker.smart() end,                   { desc = 'Smart Find Files' })
vim.keymap.set('n', '<leader><space>',      function() Snacks.picker.smart() end,                   { desc = 'Smart Find Files' })
vim.keymap.set('n', '<leader>,',            function() Snacks.picker.buffers() end,                 { desc = 'Buffers' })
vim.keymap.set('n', '<leader>ff',           function() Snacks.picker.files() end,                   { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg',           function() Snacks.picker.git_files() end,               { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>fp',           function() Snacks.picker.projects() end,                { desc = 'Projects' })
vim.keymap.set('n', '<leader>gb',           function() Snacks.picker.git_branches() end,            { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gl',           function() Snacks.picker.git_log() end,                 { desc = 'Git Log' })
vim.keymap.set('n', '<leader>gd',           function() Snacks.picker.git_diff() end,                { desc = 'Git Diff (Hunks)' })
vim.keymap.set('n', '<leader>gs',           function() Snacks.picker.git_status() end,              { desc = 'Git Status' })
vim.keymap.set('n', '<leader>sb',           function() Snacks.picker.lines() end,                   { desc = 'Search Buffer Lines' })
vim.keymap.set('n', '<leader>sw',           function() Snacks.picker.grep_word() end,               { desc = 'Visual selection or word' })
vim.keymap.set({'n', 'x'}, '<leader>sC',    function() Snacks.picker.commands() end,                { desc = 'Search Commands' })
vim.keymap.set('n', '<leader>sd',           function() Snacks.picker.diagnostics() end,             { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sH',           function() Snacks.picker.highlights() end,              { desc = 'Search Highlights' })
vim.keymap.set('n', '<leader>si',           function() Snacks.picker.icons() end,                   { desc = 'Search Icons' })
vim.keymap.set('n', '<leader>sk',           function() Snacks.picker.keymaps() end,                 { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>su',           function() Snacks.picker.undo() end,                    { desc = 'Undo History' })
vim.keymap.set('n', '<leader>uC',           function() Snacks.picker.colorschemes() end,            { desc = 'Colorschemes' })
vim.keymap.set('n', 'gd',                   function() Snacks.picker.lsp_definitions() end,         { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD',                   function() Snacks.picker.lsp_declarations() end,        { desc = 'Goto Declaration' })
vim.keymap.set('n', 'gr',                   function() Snacks.picker.lsp_references() end,          { desc = 'References' })
vim.keymap.set('n', 'gI',                   function() Snacks.picker.lsp_implementations() end,     { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gy',                   function() Snacks.picker.lsp_type_definitions() end,    { desc = 'Goto T[y]pe Definition' })
vim.keymap.set('n', '<leader>ss',           function() Snacks.picker.lsp_symbols() end,             { desc = 'LSP Symbols' })
vim.keymap.set('n', '<leader>sS',           function() Snacks.picker.lsp_workspace_symbols() end,   { desc = 'LSP Workspace Symbols' })
vim.keymap.set('n', '<leader>qf',           function() Snacks.picker.qflist() end,                  { desc = 'Quickfix' })
vim.keymap.set('n', '<leader>tl',           function() Snacks.picker.todo_comments() end,           { desc = 'Open TODO Comments Picker' })
vim.keymap.set({'n', 'v'}, '<leader>gB',    function() Snacks.gitbrowse() end,                      { desc = 'Git Browse' })
vim.keymap.set({'n', 't'}, ']]',            function() Snacks.words.jump(vim.v.count1) end,         { desc = 'Next Reference' })
vim.keymap.set({'n', 't'}, '[[',            function() Snacks.words.jump(-vim.v.count1) end,        { desc = 'Prev Reference' })

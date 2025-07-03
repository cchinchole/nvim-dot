return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        size = 20,                -- Height of the terminal (for horizontal split)
        open_mapping = [[<C-t>]], -- Keybinding to toggle terminal
        hide_numbers = true,      -- Hide line numbers in terminal buffer
        shade_terminals = true,   -- Apply shading to terminal background
        start_in_insert = true,   -- Start terminal in insert mode
        insert_mappings = true,   -- Allow keybinding in insert mode
        terminal_mappings = true, -- Allow keybinding in terminal mode
        persist_size = true,      -- Persist terminal size
        direction = "horizontal", -- Terminal opens as horizontal split
        close_on_exit = false,    -- Close terminal when process exits
        shell = vim.o.shell,      -- Use default shell
    },
    keys = {
        { "<C-t>", "<Cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle terminal" },
        { "<Esc>", [[<C-\><C-n>]],        mode = "t",          desc = "Exit terminal insert mode" },
    }
}

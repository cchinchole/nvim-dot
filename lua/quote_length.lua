local M = {}

function M.get_quote_length()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()
  -- Get the cursor position (column)
  local col = vim.api.nvim_win_get_cursor(0)[2]

  -- Patterns for single and double quotes
  local patterns = {
    { start = '"', stop = '"', escape = '\\"' }, -- Double quotes
    { start = "'", stop = "'", escape = "\\'" }, -- Single quotes
  }

  for _, pat in ipairs(patterns) do
    -- Find the start and end of the quoted string
    local start_pos, end_pos = nil, nil
    local i = col + 1 -- Lua is 1-based, col is 0-based

    -- Search backward for the opening quote
    while i > 0 do
      local char = line:sub(i, i)
      if char == pat.start and (i == 1 or line:sub(i - 1, i - 1) ~= '\\') then
        start_pos = i
        break
      end
      i = i - 1
    end

    -- Search forward for the closing quote
    i = col + 1
    while i <= #line do
      local char = line:sub(i, i)
      if char == pat.stop and (i == 1 or line:sub(i - 1, i - 1) ~= '\\') then
        end_pos = i
        break
      end
      i = i + 1
    end

    -- If both quotes are found, calculate length
    if start_pos and end_pos and start_pos < end_pos then
      local quoted_text = line:sub(start_pos + 1, end_pos - 1)
      -- Count unescaped characters
      local length = 0
      local j = 1
      while j <= #quoted_text do
        if quoted_text:sub(j, j + 1) == pat.escape then
          j = j + 2 -- Skip escaped quote
        else
          length = length + 1
          j = j + 1
        end
      end
      vim.api.nvim_echo({{ string.format("Quoted text length: %d", length), "Normal" }}, false, {})
      return
    end
  end

  vim.api.nvim_echo({{ "No quoted text found", "ErrorMsg" }}, false, {})
end

return M

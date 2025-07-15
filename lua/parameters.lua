-- ~/.config/nvim/lua/parameters.lua

local M = {}

-- Swap current parameter with the previous one (left), with wrapping
function M.swap_parameter_with_previous()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype) or "c"
  local parser = vim.treesitter.get_parser(bufnr, lang)
  if not parser then
    print("No Tree-sitter parser for buffer")
    return
  end

  local tree = parser:parse()[1]
  local root = tree:root()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_node = vim.treesitter.get_node({ bufnr = bufnr, pos = { cursor[1] - 1, cursor[2] } })
  if not cursor_node then
    print("No node under cursor")
    return
  end

  -- Find the parameter_list node
  local node = cursor_node
  while node and node:type() ~= "parameter_list" do
    node = node:parent()
  end
  if not node then
    print("Not inside a parameter list")
    return
  end

  -- Collect all parameters
  local parameters = {}
  for child, _ in node:iter_children() do
    if child:type() == "parameter_declaration" then
      table.insert(parameters, child)
    end
  end
  if #parameters < 2 then
    print("Not enough parameters to swap")
    return
  end

  -- Find the current parameter's index
  local current_index
  for i, param in ipairs(parameters) do
    if param == cursor_node or vim.treesitter.is_ancestor(param, cursor_node) then
      current_index = i
      break
    end
  end
  if not current_index then
    print("Could not identify current parameter")
    return
  end

  -- Determine the previous parameter (wrap to last if at first)
  local prev_index = current_index == 1 and #parameters or current_index - 1
  local prev_param = parameters[prev_index]
  local current_param = parameters[current_index]

  -- Get text and ranges
  local prev_range = { prev_param:range() }
  local current_range = { current_param:range() }
  local prev_text = vim.treesitter.get_node_text(prev_param, bufnr)
  local current_text = vim.treesitter.get_node_text(current_param, bufnr)

  -- Replace text
  vim.api.nvim_buf_set_text(bufnr, prev_range[1], prev_range[2], prev_range[3], prev_range[4], { current_text })
  vim.api.nvim_buf_set_text(bufnr, current_range[1], current_range[2], current_range[3], current_range[4], { prev_text })

  -- Adjust commas
  if current_index == #parameters then
    vim.api.nvim_buf_set_text(bufnr, prev_range[3] - 1, prev_range[4], prev_range[3], prev_range[4], { "" })
    vim.api.nvim_buf_set_text(bufnr, current_range[3], current_range[4], current_range[3], current_range[4] + 1, { ", " })
  elseif prev_index == #parameters then
    vim.api.nvim_buf_set_text(bufnr, prev_range[3], prev_range[4], prev_range[3], prev_range[4] + 1, { ", " })
    vim.api.nvim_buf_set_text(bufnr, current_range[3] - 1, current_range[4], current_range[3], current_range[4], { "" })
  else
    vim.api.nvim_buf_set_text(bufnr, prev_range[3], prev_range[4], prev_range[3], prev_range[4] + 1, { ", " })
    vim.api.nvim_buf_set_text(bufnr, current_range[3], current_range[4], current_range[3], current_range[4] + 1, { ", " })
  end

  -- Move cursor to the new position of the swapped parameter
  local new_pos = { prev_range[1], prev_range[2] }
  vim.api.nvim_win_set_cursor(0, { new_pos[1] + 1, new_pos[2] })
end

-- Swap current parameter with the next one (right), with wrapping
function M.swap_parameter_with_next()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype) or "c"
  local parser = vim.treesitter.get_parser(bufnr, lang)
  if not parser then
    print("No Tree-sitter parser for buffer")
    return
  end

  local tree = parser:parse()[1]
  local root = tree:root()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_node = vim.treesitter.get_node({ bufnr = bufnr, pos = { cursor[1] - 1, cursor[2] } })
  if not cursor_node then
    print("No node under cursor")
    return
  end

  -- Find the parameter_list node
  local node = cursor_node
  while node and node:type() ~= "parameter_list" do
    node = node:parent()
  end
  if not node then
    print("Not inside a parameter list")
    return
  end

  -- Collect all parameters
  local parameters = {}
  for child, _ in node:iter_children() do
    if child:type() == "parameter_declaration" then
      table.insert(parameters, child)
    end
  end
  if #parameters < 2 then
    print("Not enough parameters to swap")
    return
  end

  -- Find the current parameter's index
  local current_index
  for i, param in ipairs(parameters) do
    if param == cursor_node or vim.treesitter.is_ancestor(param, cursor_node) then
      current_index = i
      break
    end
  end
  if not current_index then
    print("Could not identify current parameter")
    return
  end

  -- Determine the next parameter (wrap to first if at last)
  local next_index = current_index == #parameters and 1 or current_index + 1
  local next_param = parameters[next_index]
  local current_param = parameters[current_index]

  -- Get text and ranges
  local next_range = { next_param:range() }
  local current_range = { current_param:range() }
  local next_text = vim.treesitter.get_node_text(next_param, bufnr)
  local current_text = vim.treesitter.get_node_text(current_param, bufnr)

  -- Replace text
  vim.api.nvim_buf_set_text(bufnr, next_range[1], next_range[2], next_range[3], next_range[4], { current_text })
  vim.api.nvim_buf_set_text(bufnr, current_range[1], current_range[2], current_range[3], current_range[4], { next_text })

  -- Adjust commas
  if current_index == #parameters then
    vim.api.nvim_buf_set_text(bufnr, current_range[3] - 1, current_range[4], current_range[3], current_range[4], { "" })
    vim.api.nvim_buf_set_text(bufnr, next_range[3], next_range[4], next_range[3], next_range[4] + 1, { ", " })
  elseif next_index == #parameters then
    vim.api.nvim_buf_set_text(bufnr, current_range[3], current_range[4], current_range[3], current_range[4] + 1, { ", " })
    vim.api.nvim_buf_set_text(bufnr, next_range[3] - 1, next_range[4], next_range[3], next_range[4], { "" })
  else
    vim.api.nvim_buf_set_text(bufnr, current_range[3], current_range[4], current_range[3], current_range[4] + 1, { ", " })
    vim.api.nvim_buf_set_text(bufnr, next_range[3], next_range[4], next_range[3], next_range[4] + 1, { ", " })
  end

  -- Move cursor to the new position of the swapped parameter
  local new_pos = { next_range[1], next_range[2] }
  vim.api.nvim_win_set_cursor(0, { new_pos[1] + 1, new_pos[2] })
end

return M

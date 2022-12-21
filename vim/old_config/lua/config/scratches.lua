-- Credits to https://github.com/GustavoKatel/
-- and https://github.com/crivotz

local nvim_create_user_command = vim.api.nvim_create_user_command
local nvim_command = vim.api.nvim_command

local M = {
  _state = {
    last_floating_window = nil,
  },
}

function M.get_scratch_filename()
  return "~/Notes/notes.md"
end

function M.open_scratch_file()
  nvim_command("!mkdir -p ~/Notes")
  nvim_command("vsplit " .. M.get_scratch_filename())
end

function M.open_scratch_file_floating(opts)
  if M._state.last_floating_window ~= nil then
    vim.api.nvim_wim_close(M._state.last_floating_window, false)
    M._state.last_floating_window = nil
  end

  opts = vim.tbl_deep_extend("force", { percentWidth = 0.8,
    percentHeight = 0.8 }, opts or {})

  -- Get the current UI
  local ui = vim.api.nvim_list_uis()[1]

  local width = math.floor(ui.width * opts.percentWidth)
  local height = math.floor(ui.height * opts.percentHeight)

  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (ui.width / 2) - (width / 2),
    row = (ui.height / 2) - (height / 2),
    anchor = "NW",
    style = "minimal",
    border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
  }

  local winnr = vim.api.nvim_open_win(0, true, win_opts)
  M._state.last_floating_window = winnr

  nvim_command("edit " .. M.get_scratch_filename())

  local bufnr = vim.api.nvim_get_current_buf()

  local closing_keys = { "q", "<ESC>" }

  for _, key in ipairs(closing_keys) do
    vim.keymap.set({ "n" }, key, function()
      nvim_command(":silent !mkdir -p ~/Notes")
      nvim_command(":w")
      -- nvim_command(":bd")
      vim.api.nvim_win_close(0, true)
      M._state.last_floating_window = nil
    end, { buffer = bufnr })
  end
end

nvim_create_user_command("ScratchOpenSplit", M.open_scratch_file, {})
nvim_create_user_command("ScratchOpenFloat", M.open_scratch_file_floating, {})

return M

local wezterm = require('wezterm')

local M = {}

function M.is_window()
  return wezterm.target_triple:find('window')
end

function M.is_apple()
  return wezterm.target_triple:find('darwin')
end

function M.is_linux()
  return wezterm.target_triple:find('linux')
end

return M

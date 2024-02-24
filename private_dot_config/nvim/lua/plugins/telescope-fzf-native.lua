local function get_fzf_build_command()
  local windows_command = 'mingw32-make'
  local linux_command = 'make'
  local os = vim.loop.os_uname().sysname:lower()
  local is_windows = os:find('windows')
  if is_windows then
    return windows_command
  else
    return linux_command
  end
end

return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = get_fzf_build_command()
}

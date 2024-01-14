local is_fullscreen = 0;

function ToggleFullscreen()
  is_fullscreen = is_fullscreen == 1 and 0 or 1
  print(is_fullscreen)
  vim.fn.GuiWindowFullScreen(is_fullscreen)
end

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.keymap.set("n", "<F11>", "<cmd>lua ToggleFullscreen()<CR>")
  end
})

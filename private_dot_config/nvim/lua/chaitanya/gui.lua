local function toggle_screen()
  local is_fullscreen = 0;

  function ToggleFullscreen()
    is_fullscreen = is_fullscreen == 1 and 0 or 1
    vim.g.neovide_fullscreen = is_fullscreen
  end

  vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function()
      vim.keymap.set("n", "<F11>", function() ToggleFullscreen() end)
      vim.keymap.set("n", "<C-Tab>", "<cmd>bn<CR>")
      vim.keymap.set("n", "<C-S-Tab>", "<cmd>bp<CR>")
    end
  })
end

local function change_font_size()
  local current_size = 13
  local function change_size(method)
    if (method == '+') then
      print('ok')
      current_size = current_size + 1
    elseif (method == '-') then
      current_size = current_size - 1
    end
    print(current_size)
    vim.o.guifont = "Maple Mono NF:h" .. current_size
  end

  vim.keymap.set("n", "<C-=>", function() change_size('+') end)
  vim.keymap.set("n", "<C-->", function() change_size('-') end)

  change_size()
end

if vim.g.neovide then
  -- disable cursor animation
  vim.g.neovide_cursor_animation_length = 0

  change_font_size()

  toggle_screen()
end

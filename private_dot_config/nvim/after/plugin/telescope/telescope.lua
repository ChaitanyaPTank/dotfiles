-- change keymaps
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

-- https://github.com/nvim-telescope/telescope.nvim/issues/2014
local get_path_and_tail = function(filename)
  local utils = require('telescope.utils')
  local bufname_tail = utils.path_tail(filename)
  local path_without_tail = require('plenary.strings')
      .truncate(filename, #filename - #bufname_tail, '')

  -- This will trucate absolute URL to relative URL from project root
  local path_to_display = utils.transform_path({
    path_display = { 'truncate' },
  }, path_without_tail)

  return bufname_tail, path_to_display
end

local function filenameFirst(_, path)
  local tail, parent = get_path_and_tail(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end


vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>o', builtin.lsp_document_symbols, {})

local telescope = require('telescope')

-- ignore node modules and other stuff
telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    preview = false
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      path_display = filenameFirst
    },
    buffers = {
      theme = "dropdown",
      -- path_display = filenameFirst
    },
    git_files = {
      theme = "dropdown",
      -- path_display = filenameFirst
    },
    live_grep = {
      mirror = true,
      preview = true,
      -- path_display = filenameFirst
    },
    lsp_document_symbols = {
      theme = "dropdown",
      preview = true
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    }
  }
})

telescope.load_extension('fzf')

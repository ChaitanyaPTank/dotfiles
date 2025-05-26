return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require('statuscol.builtin')
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
          text = { builtin.lnumfunc, condition = { true, builtin.not_empty } },
          click = "v:lua.ScLa"
        },
        {
          text = {
            " ",
            function(args)
              args.fold = {
                width = 1, -- current width of the fold column
                close = "", -- foldclose
                open = "", -- foldopen
                sep = " " -- foldsep
              }
              return builtin.foldfunc(args)
            end,
            " "
          },
          click = "v:lua.ScFa"
        },
      },
      foldfunc = "builtin",
      setopt = true,
    })
  end
}

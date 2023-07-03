require("config.globals")

local plugin = 'indent-blankline'

return {
  "lukas-reineke/" .. plugin .. ".nvim",

  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = {}
    else
      opts.char = "│"
      opts.filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      }
      opts.show_trailing_blankline_indent = false
      opts.show_current_context = false
    end
  end,
}

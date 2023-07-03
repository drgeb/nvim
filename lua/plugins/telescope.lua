require("config.globals")

local plugin = "telescope.nvim"

return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "Telescope",
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts. defaults = {
        layout_config = { prompt_position = "top" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        winblend = 0,
      }
      opts.pickers = {
        colorscheme = { enable_preview = true },
      }
    end
  end,

  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}
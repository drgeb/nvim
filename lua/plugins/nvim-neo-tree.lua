require("config.globals")

local plugin = "neo-tree.nvim"

return {
  "nvim-neo-tree/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = false,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.filesystem = { bind_to_cwd = false, follow_current_file = true, }
      opts.window = { position = "right", }
    end
  end,
}

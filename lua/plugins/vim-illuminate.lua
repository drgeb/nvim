require("config.globals")

local plugin = "vim-illuminate"

return {
  "RRethy/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}

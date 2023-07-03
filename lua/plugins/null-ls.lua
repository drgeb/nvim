require("config.globals")

local plugin = "null-ls.nvim"

return {
  "jose-elias-alvarez/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts = {}
    end
  end,
}

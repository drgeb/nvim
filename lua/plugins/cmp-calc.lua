require("config.traap.globals")

local plugin = "cmp-calc"

return {
  "hrsh7th/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "hrsh7th/nvim-cmp",
  },
}

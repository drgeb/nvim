require("config.traap.globals")

local plugin = "cmp-cmdline"

return {
  "hrsh7th/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "hrsh7th/nvim-cmp",
  },
}

return {
    "axieax/urlview.nvim",

    opts = {
        plugins = { spelling = true }
    },

    config = function(_, opts)
    local urlview = require("urlview")
    urlview.setup(opts)
    end,
}
 
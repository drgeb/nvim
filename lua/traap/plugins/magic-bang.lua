return {
    "susensio/magic-bang.nvim",
    enabled = true,
    event = "BufNewFile",
    cmd = "Bang",

    opts = function(_, opts)
      opts.default = "#!/usr/bin/env bash"
    end,
}

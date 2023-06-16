Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ JuneGunn fzf.

  {
    "junegunn/fzf.vim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("fzf.vim"),
    dependencies = {
      "junegunn/fzf.vim",
      "Traap/vim-bundle-fzf",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope

  {
    "nvim-telescope/telescope.nvim",
    enabled = Is_Enabled("telescope.nvim"),
    cmd = "Telescope",
    keys = false,
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope fzf native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = Is_Enabled("telescope-fzf-native.nvim"),
    cmd = "Telescope",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}

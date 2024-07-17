return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
  build = ":TSUpdate",
  config = function ()
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      modules = {},
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "html",
        "git_config",
        "gitcommit",
        "gitignore",
        "java",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "nix",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "julia",
        "r",
        "hcl",
        "terraform",
        "kotlin",
        "org",
        "just",
        "zig"
      },

      -- Autoinstall languages that are not installed. Defaults to false (but you
      -- can change for yourself!)
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },

      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}

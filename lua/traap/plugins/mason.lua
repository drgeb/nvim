return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ui = {
      border = "rounded",
      height = 0.75,
      width = 0.75,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
    }
    opts.install = {
      "jdtls",
      "tsserver",
      -- "angularls",
      -- "rnix-lsp",
      "java-debug-adapter",
      "java-test",
      "java-language-server",
      "google-java-format",
    }
    opts.ensure_installed = {
      "markdownlint-cli2",
      "flake8",
      "jdtls",
      "java-debug-adapter",
      "java-test",
      "java-language-server",
      "detekt",
      "kotlin-debug-adapter",
      "kotlin-language-server",
      "angular-language-server",
      "typescript-language-server",
      "luaformatter",
      "bash-language-server",
      "ktlint",
      "ast-grep",
      "black",
      "google-java-format",
      "isort",
      "mdformat",
      "prettierd",
      "cbfmt",
      'golangci-lint',
      'bash-language-server',
      'lua-language-server',
      'vim-language-server',
      'gopls',
      'stylua',
      'sqlfmt',
      'editorconfig-checker',
      'gofumpt',
      'golines',
      'gomodifytags',
      'gotests',
      'goimports',
      'impl',
      'json-to-struct',
      'jq',
      'misspell',
      'revive',
      'shellcheck',
      'shfmt',
      'staticcheck',
      'vint',
      'yamllint',
      'yamlfmt',
      'yaml-language-server',
      'hadolint',
      --      'dockerls',
      --      'diagnostic-language-server',
      'sqlls',
      'delve',
      "awk-language-server",
      "bash-language-server",
      --    "css-language-server",
      "gradle-language-server",
      "cucumber-language-server",
      "css-lsp",
      "grammarly-languageserver",
      --    "graphql",
      "html-lsp",
      "htmx-lsp",
      "json-lsp",
      "typescript-language-server",
      "marksman",
      "lua-language-server",
      "pyright",
      --    "pylsp",
      "sqlls",
      --    "tailwindcss",
      "tflint",
      -- "vuels",
      "yaml-language-server"
    }
    return opts
  end,
}

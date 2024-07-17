return {
  "stevearc/conform.nvim",
      lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,

    -- event = { "BufReadPre", "BufNewFile" },
  -- config = function ()
    -- local conform = require("conform")
    -- conform.setup({
      formatters = {
        xmllint = {
          command = "xmllint",
          args = { "--format", "-" },
          -- Send file contents to stdin, read new contents from stdout (default true)
          -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
          -- file is assumed to be modified in-place by the format command.
          stdin = true,
        },
        tidy = {
          command = "tidy",
          args = { "--tidy-mark", "no", "-quiet", "-indent", "-wrap", "0" },
          stdin = true,
        },
      },

      formatters_by_ft = {
		    lua = { "stylua" },
		    sh = { "shfmt" },
        python = { 'isort', 'black' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'mdformat', 'cbfmt', 'markdownlint-cli2' },
        nix = { 'nixfmt' },
        html = { { "prettierd", "prettier", "tidy" } },
        css = { { "prettierd", "prettier", "tidy" } },
        xhtml = { "xmllint", "tidy" },
        xml = { "xmllint" },
        xsd = { "xmllint" },
        javascript = { { "prettierd", "prettier" } },
        java = { 'google-java-format' },
       },
--      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
 --       local disable_filetypes = { c = true, cpp = true }
   --     return {
     --     timeout_ms = 500,
       --   lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
         --                }
    -- {
       -- lsp_fallback = true,
        -- async = false,
       -- timeout_ms = 500,
      -- },
   -- })

   -- vim.keymap.set({"n", "v"}, "<leader>mp", function()
   --   conform.format({:w
   --     lsp_fallback = true,
   --     async = false,
   --     timeout_ms = 500
    --  })
   -- end, { desc = "Format file or range( in visual mode)"})
 -- end,
      -- }
--   end,
  }
}

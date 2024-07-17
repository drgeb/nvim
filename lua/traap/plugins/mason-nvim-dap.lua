return {
  "mason-nvim-dap",
  automatic_installation = true,
  ensure_installed = { "firefox" },
  handlers ={
    function(config)
      -- all sources with no handler get passed here
      --
      --  keep original functionality
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

require("config.globals")

local plugin = "neo-tree.nvim"

-- Note:  nvim-tree takes precedence when both neo-tree.nvim and nvim-tree
if Is_Enabled(plugin) and not Is_Enabled("nvim-tree") then
  Keymap("n", "<c-n>", "<cmd>NvimTreeToggle<cr>")
  Keymap("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>")
  Keymap("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>")
end

return {
  "nvim-neo-tree/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = false,
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts.filesystem = { bind_to_cwd = false, follow_current_file = true, }
      opts.window = { position = "right", }
    end
  end,
}

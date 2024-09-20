-- {{{ Alphabetical listing of settings I like.

-- NOTE: formatoptions default "tcqj"
local options = {
  autoread = true,
  autowrite = true,
  breakindent = true,
  clipboard = "unnamed,unnamedplus",
  colorcolumn = "+1",
  cmdheight = 0,
  complete = { ".", "w", "b", "u", "t", "i", "kspell" },
  completeopt = { "menuone", "noselect" },
  cursorline = false,
  expandtab = true,
  fillchars = { foldclose = " ", fold = " ", eob = " " },
  foldlevel = 0,
  foldlevelstart = 1,
  foldnestmax = 99,
  foldmethod = "marker",
  foldtext = "",
  foldcolumn = "0",
  hidden = true,
  inccommand = "split",
  ignorecase = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  mouse = "a",
  nrformats = { "alpha", "octal", "hex" },
  number = true,
  numberwidth = 3,
  relativenumber = true,
  scrolloff = 0,
  shiftround = true,
  shiftwidth = 2,
  shortmess = "aToIOWAF",
  showbreak = "↪",
  showmatch = true,
  showmode = false,
  sidescrolloff = 0,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  textwidth = 80,
  timeout = true,
  timeoutlen = 200,
  ttimeout = true,
  ttimeoutlen = 5,
  updatetime = 500,
  virtualedit = { "block" },
  wildmode = { "list", "longest" },
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.formatoptions:remove("o")

vim.cmd[[set termguicolors]]
vim.cmd([[filetype plugin indent on]])


-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

vim.g.bullets_enabled_file_types = {
  "gitcommit",
  "markdown",
  "scratch",
  "text",
  "wiki",
}
-- AddShebang
vim.api.nvim_create_augroup("AddShebang", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "AddShebang",
  pattern = "*.sh",
  callback = function()
    local first_line = vim.fn.getline(1)
    if not first_line:match("^#!") then
      vim.fn.setline(1, "#!/bin/bash")
      vim.api.nvim_command('normal! G')
    end
  end,
})

-- ------------------------------------------------------------------------- }}}

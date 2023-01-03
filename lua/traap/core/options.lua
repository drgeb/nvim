-- {{{ Alphabetical listing of settings I like.

local options = {
  breakindent = true,
  clipboard = 'unnamedplus',
  colorcolumn = '+1',
  complete = { '.', 'w', 'b', 'u', 't', 'i', 'kspell' },
  completeopt = { 'menuone', 'noinsert', 'noselect' },
  cursorline = false,
  expandtab = true,
  fillchars = 'fold: ',
  foldlevel = 20,
  foldmethod = 'marker',
  hidden = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = { eol = '↲', tab = '▸ ', trail = '·' },
  mouse = 'a',
  nrformats = { 'alpha', 'octal', 'hex' },
  number = true,
  numberwidth = 3,
  relativenumber = true,
  scrolloff = 4,
  shiftround = true,
  shiftwidth = 2,
  shortmess = 'aToOS',
  showbreak = '↪',
  showmatch = true,
  showmode = false,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 500,
  textwidth = 80,
  updatetime = 250,
  virtualedit = { 'block' },
  wildmode = { 'list', 'longest' },
  wrap = false,
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[filetype plugin indent on]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

vim.g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'scratch',
  'text',
  'wiki'
}

-- ------------------------------------------------------------------------- }}}
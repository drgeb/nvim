-- {{{ Credits

-- Karim Abou Zeid
-- https://github.com/kabouzeid/dotfiles/tree/master/nvim/lua

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis.

local function keymap(...) vim.api.nvim_set_keymap(...) end
local api = vim.api
local fn = vim.fn

-- ------------------------------------------------------------------------- }}}
-- {{{ compe setup

require "compe".setup {
  enabled          = true,
  autocomplete     = true,
  debug            = false,
  min_length       = 1,
  preselect        = "enable",
  throttle_time    = 80,
  source_timeout   = 200,
  incomplete_delay = 400,
  max_abbr_width   = 100,
  max_kind_width   = 100,
  max_menu_width   = 100,
  documentation    = true,
  source           = {
    buffer         = {kind = " ﬘  (Buffer)"},
    calc           = {kind = "   (Calc)"},
    nvim_lsp       = {kind = "   (LSP)"},
    path           = {kind = "   (Path)"},
    spell          = {kind = "   (Spell)"},
    vsnip          = {kind = "   (Snippet)"},
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Function to repalce termcodes

local t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Function to check for backspace

local check_back_space = function()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Function to check for tab completion.

_G.tab_complete = function()
  if fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif fn.call("vsnip#available", { 1 }) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return fn["compe#complete"]()
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Function to check for shift-tab completion.

_G.s_tab_complete = function()
  if fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Function to manage completions.

function _G.completions()
  local npairs = require("nvim-autopairs")
  if fn.pumvisible() == 1 then
    if fn.complete_info()["selected"] ~= -1 then
      return fn["compe#confirm"]("<CR>")
    end
  end
  return npairs.check_break_line_char()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Keymap for tab and shift-tab.

keymap("i", "<Tab>",   "v:lua.tab_complete()", {expr = true})
keymap("s", "<Tab>",   "v:lua.tab_complete()", {expr = true})

keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

keymap("i", "<C-Space>", "compe#complete()",     { expr = true, noremap = true, silent = true })
keymap("i", "<CR>",      "compe#complete()",     { expr = true, noremap = true, silent = true })
keymap("i", "<C-e>",     "compe#close('<C-e>')", { expr = true, noremap = true, silent = true })

keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { expr = true, noremap = true, silent = true })
keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true })

-- ------------------------------------------------------------------------- }}}

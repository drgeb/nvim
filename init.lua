vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]
vim.lsp.set_log_level("debug")

require("traap.core.bootstrap")
require("traap.core.clipboard")
require("traap.core.customize")
require("traap.core.functions")
require("traap.core.options")
require("traap.core.lazy")
require("traap.core.autocmds")
require("traap.core.keybindings")

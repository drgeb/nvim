-- {{{ Use protected call so we don't error on first use.

local  packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Have packer use a popup window

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer startup function definition.

return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

use {'wbthomason/packer.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

use {'Traap/nvim-base16.lua'}
use {'norcalli/nvim-colorizer.lua'}
use {'p00f/nvim-ts-rainbow'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion

use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-calc'}
use {'hrsh7th/cmp-cmdline'}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-nvim-lsp-document-symbol'}
use {'hrsh7th/cmp-nvim-lua'}
use {'hrsh7th/cmp-path'}
use {'onsails/lspkind-nvim'}
use {'saadparwaiz1/cmp_luasnip'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Easyalign

use {'junegunn/vim-easy-align'}

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

use {'kyazdani42/nvim-tree.lua'}
use {'kyazdani42/nvim-web-devicons'}
use {'NTBBloodbath/galaxyline.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua development

-- use {'tjdevries/nlua.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

use {'neovim/nvim-lspconfig'}
use {'williamboman/nvim-lsp-installer'}
use {'jose-elias-alvarez/null-ls.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

use {'tweekmonster/startuptime.vim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

use {'aklt/plantuml-syntax'}

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

use {'tpope/vim-characterize'}
use {'tpope/vim-commentary'}
use {'tpope/vim-dispatch'}
use {'tpope/vim-endwise'}
use {'tpope/vim-fugitive'}
use {'tpope/vim-rails'}
use {'tpope/vim-repeat'}
use {'tpope/vim-surround'}
use {'tpope/vim-unimpaired'}

-- ------------------------------------------------------------------------- }}}
-- {{{ RipGrep

use {'traap/vim-ripgrep'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Snippets

use {'L3MON4D3/LuaSnip'}
use {'rafamadriz/friendly-snippets'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

use {'nvim-telescope/telescope.nvim'}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use {'nvim-telescope/telescope-media-files.nvim'}
use {'benfowler/telescope-luasnip.nvim'}

use {'nvim-lua/popup.nvim'}
use {'nvim-lua/plenary.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'nvim-treesitter/nvim-treesitter-refactor'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Truble

use {
   'folke/trouble.nvim',
    config = function()
      require('trouble').setup {}
    end
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

use {'christoomey/vim-tmux-navigator'}
use {'christoomey/vim-tmux-runner'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

use {'sbdchd/neoformat'}
use {'triglav/vim-visual-increment'}
use {'vim-utils/vim-most-minimal-folds'}
use {'xiyaowong/nvim-transparent'}
use {'mechatroner/rainbow_csv'}
use {'iamcco/markdown-preview.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

use {'lervag/vimtex'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

use {'lervag/wiki.vim'}
use {'dkarter/bullets.vim'}
use {'lervag/wiki-ft.vim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

use {'Traap/vim-bundle-abbreviate'}
use {'Traap/vim-bundle-autocmd'}
use {'Traap/vim-bundle-plantuml'}
use {'Traap/vim-bundle-tmux-runner'}
use {'Traap/vim-bundle-vimtex'}
use {'Traap/vim-bundle-vimwiki'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

if vim.g.nvim_bootstrapped == 1 then
  packer.sync()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ The END!

end)

-- ------------------------------------------------------------------------- }}}

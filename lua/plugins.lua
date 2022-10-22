local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'fcpg/vim-farout' -- Themes
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } -- Status Line

  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- VsCode-like pictograms
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's build-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Code highlighting
  use 'windwp/nvim-autopairs' -- Autopairs
  use 'windwp/nvim-ts-autotag' -- Autotag
  use 'nvim-lua/plenary.nvim' -- Common utilities

  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser extension for telescope
  -- use 'nvim-telescope/telescope-media-files.nvim' -- Image previewer (only work for linux)

  use 'ryanoasis/vim-devicons' -- File icons
  use 'kyazdani42/nvim-web-devicons' -- File icons extend from vim-devicons
  use 'akinsho/nvim-bufferline.lua' -- Tabs bufferline
  use 'norcalli/nvim-colorizer.lua' -- Colorizer
  use "lukas-reineke/indent-blankline.nvim" -- Indentation lines

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'tpope/vim-surround' -- Surrounding utilities for work with brackets, tags and more
  use 'terryma/vim-multiple-cursors' -- Multiple select and edit

  use 'lewis6991/gitsigns.nvim' -- Fast git decorations implemented purely in lua/teal
  use 'dinhhuy258/git.nvim' -- For git blame & browser

  use 'numToStr/Comment.nvim' -- Commenting with gc
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Commenting jsx

  use {
    'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  } -- Image preview ascii
  use { 'm00qek/baleia.nvim', tag = 'v1.2.0' } -- Image colorizer ascii

  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  })
end)

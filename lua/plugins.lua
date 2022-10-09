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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Code highlighting
  use 'windwp/nvim-autopairs' -- Autopairs
  use 'windwp/nvim-ts-autotag' -- Autotag
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser extension for telescope
  use 'ryanoasis/vim-devicons' -- File icons
  use 'kyazdani42/nvim-web-devicons' -- File icons extend from vim-devicons
  use 'akinsho/nvim-bufferline.lua' -- Tabs bufferline
  use 'norcalli/nvim-colorizer.lua' -- Colorizer
end)

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false
opt.spelllang = "en_us"
opt.spell = true

-- Enable this option to avoid conflicts Biome with Prettier.
vim.g.lazyvim_prettier_needs_config = true

-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = false

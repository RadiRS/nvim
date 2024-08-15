-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a work backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Buffers
keymap.set("n", "<C-w>w", ":bd<CR>", opts)
keymap.set("n", "<C-w>W", "<cmd>bufdo bd<cr>", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Text Editor
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "\\s", ":w<Return>")

-- Diagnotics
keymap.set("n", "<C-e>", function()
  vim.diagnostic.goto_prev()
end, opts)

-- Javascript/Typescript
keymap.set("n", "<C-A-l>", ":put =printf('console.log(''%s:'',  %s);', expand('<cword>'), expand('<cword>'))<CR>")

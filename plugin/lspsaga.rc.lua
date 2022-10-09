local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<space>.', '<Cmd>Lspsaga code_action<cr>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts) -- not available
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>LSoutlineToggle<cr>', opts)
vim.keymap.set('n', '<C-;>', '<Cmd>Lspsaga open_floaterm<cr>', opts)
vim.keymap.set('t', '<C-c>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)

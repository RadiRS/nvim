local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'J', '<Cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<space>.', '<Cmd>Lspsaga code_action<cr>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts) -- deprecated
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts) -- deprecated
vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<cr>', opts)
vim.keymap.set('n', '<C-;>', '<Cmd>Lspsaga term_toggle<cr>', opts)
vim.keymap.set('t', '<C-;>', [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], opts)

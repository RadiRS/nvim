local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local statuscmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not statuscmp) then return end

local protocal = require('vim.lsp.protocol')
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --  group = vim.api.nvim_create_augroup("Format", { clear = true }),
    --  buffer = bufnr,
    --  callback = function() vim.lsp.buf.formatting_seq_sync() end
    -- })
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- Lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

-- HTML
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- CSS
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- JSON
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

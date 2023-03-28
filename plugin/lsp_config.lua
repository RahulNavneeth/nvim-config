require("mason").setup({
      ui = {
            border = "single", 
            icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
            }
      }
})

local on_attach = function(_, _)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local lspconfig = require('lspconfig')
lspconfig.gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer",
  }
}
require'lspconfig'.svelte.setup { filetypes = { "svelte", "html" } }

return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "typescriptreact", "json", "css", "html" },
          }),
          null_ls.builtins.code_actions.eslint,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
      return {
        sources = {
          null_ls.builtins.code_actions.eslint, -- Suggerimenti e fix
          null_ls.builtins.completion.tags, -- Completamento automatico
          null_ls.builtins.diagnostics.eslint, -- Diagnostica avanzata
          null_ls.builtins.formatting.prettier, -- Formattazione
        },
      }
    end,
  },
}

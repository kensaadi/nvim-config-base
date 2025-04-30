-- Disable "No information available" notification on hover
-- plus define border for hover window
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { "╭", "Comment" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
    }
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.split(table.concat(markdown_lines, "\n"), "\n", { trimempty = true })

  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          autostart = true, -- Garantisce che parta sempre
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
          root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              enableMoveToFileCodeAction = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              format = { enable = true },
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
            javascript = {
              format = { enable = true },
            },
          },
          keys = {
            {
              "gD",
              function()
                vim.lsp.buf.definition()
              end,
              desc = "Goto Definition",
            },
            {
              "gR",
              function()
                if vim.lsp.buf.server_capabilities().referencesProvider then
                  vim.lsp.buf.references()
                else
                  require("telescope.builtin").lsp_references()
                end
              end,
              desc = "Find References (Safe Fallback)",
            },
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            -- {
            --   "<leader>co",
            --   function()
            --     vim.lsp.buf.execute_command({
            --       command = "typescript.sortImports",
            --       arguments = { vim.api.nvim_buf_get_name(0) },
            --     })
            --   end,
            --   desc = "Organize Imports (via vtsls)",
            -- },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            -- {
            --   "<leader>cM",
            --   function()
            --     vim.lsp.buf.execute_command({
            --       command = "_typescript.organizeImports",
            --       arguments = { vim.fn.expand("%:p") }, -- Passa il file corrente come argomento
            --     })
            --   end,
            --   -- function()
            --   --   vim.lsp.buf.execute_command({ command = "source.addMissingImports.ts" })
            --   -- end,
            --   desc = "Add missing imports",
            -- },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            -- {
            --   "<leader>cu",
            --   function()
            --     vim.lsp.buf.execute_command({
            --       command = "typescript.removeUnusedImports",
            --       arguments = { vim.api.nvim_buf_get_name(0) },
            --     })
            --   end,
            --   desc = "Remove Unused Imports (via vtsls)",
            -- },
            {
              "<leader>cD",
              function()
                vim.lsp.buf.execute_command({ command = "source.fixAll.ts" })
              end,
              desc = "Fix all diagnostics",
            },
            {
              "<leader>cV",
              function()
                vim.lsp.buf.execute_command({ command = "typescript.selectTypeScriptVersion" })
              end,
              desc = "Select TS workspace version",
            },
            {
              "<leader>rn",
              function()
                vim.lsp.buf.rename()
              end,
              desc = "Rename function",
            },
          },
        },
      },
      setup = {
        vtsls = function(_, opts)
          require("lspconfig").vtsls.setup(opts) -- Avvia il server senza ripetere `autostart`
        end,
      },
    },
  },
}

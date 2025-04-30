return {
  "MunifTanjim/prettier.nvim",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("prettier").setup({
      bin = "prettier", -- Usa la versione locale di Prettier
      filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "json",
        "css",
        "html",
      },
    })
  end,
}

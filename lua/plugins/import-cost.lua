return {
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh",
    opts = {
      format = {
        color = "#ff8800", -- Colore del peso
        unit = "kb", -- Unità di misura (kb/mb);
        debug = true,
      },
      exclude_patterns = {}, -- Opzionale, esclude percorsi specifici
    },
    config = function(_, opts)
      require("import-cost").setup(opts)
    end,
  },
}

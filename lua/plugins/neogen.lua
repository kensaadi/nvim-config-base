return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
        input_after_comment = true,
      })
    end,
  },
}

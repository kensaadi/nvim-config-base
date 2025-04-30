return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "n",
        function()
          require("flash").jump({ continue = true })
        end,
        desc = "Next Flash Match",
      },
      {
        "b",
        function()
          require("flash").jump({ continue = true, forward = false })
        end,
        desc = "Previous Flash Match",
      },
    },
  },
}

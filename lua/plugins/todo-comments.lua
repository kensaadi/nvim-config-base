-- return {
--   {
--     "folke/todo-comments.nvim",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("todo-comments").setup()
--     end,
--   },
-- }
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    -- Puoi personalizzare qui i tuoi tag
    keywords = {
      FIX = { icon = "🐛", color = "error", alt = { "fix" } },
      TODO = { icon = "📝", color = "info", alt = { "todo" } },
      HACK = { icon = "🔧", color = "test", alt = { "hack" } },
      WARN = { icon = "⚠️", color = "warning", alt = { "warn" } },
      PERF = { icon = "🚀", alt = { "perf" } },
      INFO = { icon = "💡", color = "hint", alt = { "info", "INFO" } },
      WIP = { icon = "🚧", color = "hint", alt = { "wip" } },
    },
    merge_keywords = true,
  },
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "🔍 Cerca TODOs con Telescope" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "📋 Mostra TODOs con Trouble" },
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Prossimo TODO",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Precedente TODO",
    },
  },
}

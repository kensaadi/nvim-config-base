return {
  "andrewferrier/debugprint.nvim",

  opts = {
    create_keymaps = true,
    move_to_debugline = true,
    display_mode = "print", -- usa console.log per JS/TS
    filetypes = {
      typescript = {
        left = 'console.log("',
        right = '")',
        mid_var = ':", ',
        right_var = ")",
        comment_string = "//",
      },
      javascript = {
        left = 'console.log("',
        right = '")',
        mid_var = ':", ',
        right_var = ")",
        comment_string = "//",
      },
    },
  },

  dependencies = {
    "echasnovski/mini.nvim", -- Optional: Needed for line highlighting
    "ibhagwan/fzf-lua", -- Optional: If you want to use the :SearchDebugPrints command with fzf-lua
    "nvim-telescope/telescope.nvim", -- Optional: If you want to use the :SearchDebugPrints command with telescope.nvim
  },

  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
}

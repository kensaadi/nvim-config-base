return {
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = "#ffffff", guibg = "#44475a" },
            InclineNormalNC = { guifg = "#bbbbbb", guibg = "#282a36" },
          },
        },
        window = {
          placement = { horizontal = "right", vertical = "top" },
          margin = { vertical = 0, horizontal = 1 },
          padding = 1,
        },
        render = function(props)
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        end,
      })
    end,
  },
}

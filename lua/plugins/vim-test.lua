return {
  "vim-test/vim-test",
  config = function()
    vim.cmd([[
      let test#strategy = 'neovim' " Mostra i risultati nel terminal integrato
      let test#javascript#runner = 'vitest' " Imposta Vitest come runner di default per JavaScript/TypeScript
    ]])
  end,
}

return {
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- percorso assoluto del log di Tabnine (opzionale)
      })
    end,
  },
}

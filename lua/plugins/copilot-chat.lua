return {
  {
    -- Importa la configurazione predefinita di LazyVim per Copilot Chat
    import = "lazyvim.plugins.extras.ai.copilot-chat",
  },
  {
    -- Configurazione del plugin Copilot principale
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-h>",
        },
      },
      panel = {
        enabled = true,
        keymap = {
          open = "<M-CR>",
        },
      },
    },
  },
}

-- lua/plugins/ltex.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex = {
        filetypes = { "tex", "plaintex", "markdown", "bib" },
        settings = {
          ltex = {
            language = "en-GB", -- matches your UK English preference
            -- ltex will also pick up dictionaries; add words as needed:
            -- dictionary = { ["en-GB"] = { "neovim", "LazyVim" } },
            checkFrequency = "save", -- only check on save, not on every keystroke
          },
        },
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.clangd = { enabled = false } -- hard override, regardless of extras

    local configs = require("lspconfig.configs")
    local lspconfig = require("lspconfig")

    if not configs.basilisk then
      configs.basilisk = {
        default_config = {
          cmd = { "node", vim.fn.expand("~/qcc-lsp/server/out/server.js"), "--stdio" },
          filetypes = { "c" },
          root_dir = lspconfig.util.root_pattern(".git", "Makefile", ".comphy-basilisk"),
          settings = {
            basilisk = {
              basiliskPath = vim.fn.expand("$BASILISK"),
              qcc = { includePaths = { vim.fn.expand("$MYSANDBOX") } },
              clangd = { enabled = true, mode = "proxy" },
              fallbackFlags = { "-I" .. vim.fn.expand("$MYSANDBOX") },
            },
          },
        },
      }
    end

    lspconfig.basilisk.setup({})
    return opts
  end,
}

-- Using basilisk-lsp for ALL .c/.h files (not just Basilisk projects).
-- To revert to plain clangd:
--   1. Comment out/remove this file's `configs.basilisk`/`setup` calls (or return {})
--   2. Uncomment `lang.clangd` import in lua/config/lazy.lua

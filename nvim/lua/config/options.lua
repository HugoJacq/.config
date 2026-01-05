-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "c", "h", "py", "md", "lua" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("tq")
  end,
})

vim.opt.spelllang = { "en", "fr" }

-- disable lsp formating
vim.opt.formatexpr = ""

-- disable warnings vimtex
-- vim.g.vimtex_log_ignore = {
--   "LaTeX Warning: Label",
--   "Overfull \\\\hbox",
-- }
vim.g.vimtex_quickfix_ignore_filters = {
  "Underfull.*hbox",
}

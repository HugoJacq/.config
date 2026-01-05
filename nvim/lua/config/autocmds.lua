-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- copy pdf where the .tex is after successfull compilation
vim.api.nvim_create_autocmd("User", {
  pattern = "VimtexEventCompileSuccess",
  callback = function()
    local tex_file = vim.fn.expand("%:t:r") .. ".pdf"
    local src = "tex_compile/" .. tex_file
    local dest = "./" .. tex_file
    -- Move PDF back to root
    vim.fn.system({ "cp", src, dest })
  end,
})

-- trigger autocompletion on '\' for .tex files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     local cmp = require("cmp")
--     vim.keymap.set("i", "\\", function()
--       -- Insert the backslash
--       vim.api.nvim_feedkeys("\\", "n", false)
--       -- Trigger completion
--       cmp.complete()
--     end, { buffer = true })
--   end,
-- })
--
-- disable suggestions from buffer for tex files
-- require("cmp").setup.filetype({ "tex" }, {
--   sources = {
--     { name = "omni" }, -- texlab provides completions via omni
--     { name = "nvim_lsp" },
--     -- no buffer source here
--   },
-- })

--disable suggestions in md
-- require("cmp").setup.filetype({ "md", "tex", "lua", "h" }, {
--   enabled = false,
-- })
-- === Auto-wrap & reformat Markdown / TeX ===
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex" },
  callback = function()
    vim.bo.textwidth = 80
  end,
})

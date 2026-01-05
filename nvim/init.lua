-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

---------------
-- LUASNIP
---------------
-- help from here : https://ejmastnak.com/tutorials/vim-latex/luasnip/
-- load snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
-- Setting LuaSnip config
require("luasnip").config.set_config({
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  update_events = "TextChanged,TextChangedI",
})

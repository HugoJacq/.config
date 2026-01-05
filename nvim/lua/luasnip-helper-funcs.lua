-- ~/.config/nvim/lua/luasnip-helper-funcs.lua
local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
-- local get_visual = function(args, parent)
--   if #parent.snippet.env.LS_SELECT_RAW > 0 then
--     return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
--   else -- If LS_SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end
function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

return M

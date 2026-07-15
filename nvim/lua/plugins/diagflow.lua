return {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {
    placement = "top", -- pinned to top-right, not inline with text
    text_align = "right",
    padding_top = 0,
    padding_right = 1,
    show_sign = false, -- keep it text-only, no icon clutter
  },
}

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    status = {
      colors = function(colors)
        -- Match tabline sidebar padding to Neo-tree's background
        -- so there's no visible gap above the source selector.
        local NeoTreeNormal = require("astroui").get_hlgroup("NeoTreeNormal", { bg = colors.tabline_bg })
        colors.tabline_bg = NeoTreeNormal.bg
        return colors
      end,
    },
  },
}

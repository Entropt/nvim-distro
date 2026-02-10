return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 👈 show hidden files
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- for Windows hidden files
        never_show = {}, -- don't force-hide anything
      },
    },
  },
}

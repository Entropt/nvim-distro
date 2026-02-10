return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      },
    },
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

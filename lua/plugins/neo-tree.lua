return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    -- Refresh Neo-tree git status when leaving a terminal buffer,
    -- since libuv fs_event may not fire while the terminal is active.
    vim.api.nvim_create_autocmd("TermLeave", {
      callback = function()
        local ok, manager = pcall(require, "neo-tree.sources.manager")
        if ok then
          for _, source in ipairs({ "filesystem", "git_status" }) do
            local mod = "neo-tree.sources." .. source
            if package.loaded[mod] then
              manager.refresh(require(mod).name)
            end
          end
        end
      end,
    })
  end,
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

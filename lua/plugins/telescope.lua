return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      -- Hook into Telescope to enable line numbers on the results window.
      -- Telescope creates windows with style="minimal" which disables number.
      -- We wrap attach_mappings to re-enable number after the picker is mounted.
      local defaults = opts.defaults or {}
      local original_attach = defaults.attach_mappings

      defaults.attach_mappings = function(prompt_bufnr, map)
        -- Find the picker and enable line numbers on the results window
        vim.schedule(function()
          local ok, action_state = pcall(require, "telescope.actions.state")
          if not ok then return end
          local picker = action_state.get_current_picker(prompt_bufnr)
          if picker and picker.results_win and vim.api.nvim_win_is_valid(picker.results_win) then
            vim.wo[picker.results_win].number = true
            vim.wo[picker.results_win].relativenumber = true
          end
        end)

        -- Call original attach_mappings if it exists
        if original_attach then
          return original_attach(prompt_bufnr, map)
        end
        return true
      end

      opts.defaults = defaults
      return opts
    end,
    init = function()
      -- Enable line numbers in Telescope preview windows
      vim.api.nvim_create_autocmd("User", {
        pattern = "TelescopePreviewerLoaded",
        callback = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      })
    end,
  },
}

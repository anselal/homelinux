return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Ensure the sections structure exists
    opts.options = opts.options or {}
    opts.options.theme = 'tokyonight'

    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- Add the lazydo component to lualine_x
    table.insert(opts.sections.lualine_x, {
      function()
        return require("lazydo").get_lualine_stats()
      end,
      cond = function()
        return require("lazydo")._initialized
      end,
    })
  end,
}


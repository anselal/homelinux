require("soulistech.options")
require("soulistech.lazy")
require("soulistech.keymaps")

-- Auto-source soulistech modules on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/lua/soulistech/*.lua",
  callback = function(args)
    local mod = string.match(args.file, "lua/(.*)%.lua$")
    if mod then
      package.loaded[mod] = nil
      require(mod)
      vim.notify("Reloaded: " .. mod, vim.log.levels.INFO)
    end
  end,
})


-- nvim-lspconfig sets up language servers that provide the actual code intelligence (like completion, linting, go-to-definition, etc.)
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      }
    })
    require("lspconfig").pyright.setup({})
  end
}

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  print("mason_lspconfig not ok")
	return
end

mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
  function (server_name) -- default handler (optional)
    local opts = {
      on_attach = require("config.lsp.handlers").on_attach,
      capabilities = require("config.lsp.handlers").capabilities,
    }
    require("lspconfig")[server_name].setup(opts)
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["sumneko_lua"] = function ()
    local opts = {
      on_attach = require("config.lsp.handlers").on_attach,
      capabilities = require("config.lsp.handlers").capabilities,
    }
	 	local sumneko_opts = require("config.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    require("lspconfig").sumneko_lua.setup(opts)
  end,
  ["jsonls"] = function ()
    local opts = {
      on_attach = require("config.lsp.handlers").on_attach,
      capabilities = require("config.lsp.handlers").capabilities,
    }
	 	local jsonls_opts = require("config.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    require("lspconfig").jsonls.setup(opts)
  end,
})

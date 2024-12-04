return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }

      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
      end

      vim.diagnostic.config({ virtual_text = true })

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end

    local lspc = require("lspconfig")
    local servers = {
      "clangd",
      "gopls",
      "hls",
      "nixd",
      "pylsp",
      "rust_analyzer",
      "zls",
    }

    for _, s in ipairs(servers) do
      lspc[s].setup({ on_attach = on_attach, capabilities = capabilities })
    end
  end,
}

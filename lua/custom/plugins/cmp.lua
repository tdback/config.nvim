return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  lazy = false,
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    vim.opt.shortmess:append("c")

    local cmp = require("cmp")
    cmp.setup({
      preselect = cmp.PreselectMode.Item,

      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },

      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping.confirm({
          behavior = cmp.SelectBehavior.Insert,
          select = true,
        }),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
        ["<CR>"] = nil,
      },

      snippet = { expand = function(args) vim.snippet.expand(args.body) end },
    })
  end,
}

return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup({
        window = {
          width = 80,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            wrap = true,
            linebreak = true,
            cursorline = false,
            colorcolumn = "0",
          },
        },
        plugins = {
          gitsigns = { enabled = false },
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
          },
        },
      })
      require("zen-mode").toggle()
    end)
  end,
}

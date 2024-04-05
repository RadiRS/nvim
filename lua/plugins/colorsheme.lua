return {
  {
    "lmburns/kimbox",
    priority = 1000,
    config = function()
      require("kimbox").setup({
        transparent = true,
      })
    end,
  },

  -- Configure LazyVim to load kimbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kimbox",
    },
  },
}

return {
  -- install themes
  { "lmburns/kimbox" },
  { "savq/melange-nvim" },
  { "danilo-augusto/vim-afterglow" },

  -- Configure LazyVim to load kimbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "afterglow",
    },
  },
}

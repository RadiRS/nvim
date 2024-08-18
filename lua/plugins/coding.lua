return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Code Screenshoot
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      watermark = "",
      bg_color = "#5e3719",
    },
    config = function(_, opts)
      require("codesnap").setup(opts)
    end,
    init = function()
      local wk = require("which-key")
      wk.add({ "<leader>cs", ":CodeSnap<CR>", desc = "SnapShoot Code", mode = "v" })
    end,
  },

  -- Find next and replace
  {
    "mg979/vim-visual-multi",
  },

  -- Surrounddings code
  {
    "tpope/vim-surround",
  },

  -- For styled components in react
  {
    "styled-components/vim-styled-components",
  },

  -- For tailwind class fold like VSCode
  {
    "razak17/tailwind-fold.nvim",
    opts = {
      symbol = "~~",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
}

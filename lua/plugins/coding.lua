return {
  -- Code Screenshoot
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      watermark = "",
      bg_padding = 0,
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
}

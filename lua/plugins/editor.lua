return {
  -- Neo-tree Config
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },

  -- FZF Config
  {
    "ibhagwan/fzf-lua",
    keys = {
      { ";f", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { ";r", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { ";;", "<cmd>FzfLua resume<cr>", desc = "Resume" },
      { "\\\\", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { ";h", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
      { ";e", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
    },
  },

  -- Cursor animation Config
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "none",
      legacy_computing_symbols_support = true,
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  },
}

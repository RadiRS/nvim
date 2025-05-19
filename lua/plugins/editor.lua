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

  -- Yazi Config
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    version = "v10.3.0",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim",
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}

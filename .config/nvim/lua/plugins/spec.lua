return {
  "folke/which-key.nvim",
  "lewis6991/gitsigns.nvim",

  { "numToStr/Comment.nvim", opts = {} },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {
    -- "folke/tokyonight.nvim",
    -- "rebelot/kanagawa.nvim",
    -- "navarasu/onedark.nvim",
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = { flavour = "macchiato" },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "catppuccin" } },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
    cmd = { "Neotree" },
    keys = { { "<c-e>", "<cmd>Neotree toggle<CR>" } },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-left>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-down>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-up>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-right>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
}

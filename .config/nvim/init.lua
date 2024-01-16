-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Packages
vim.g.mapleader = " "
require("lazy").setup({
  'tpope/vim-sleuth',
  'editorconfig/editorconfig-vim',
  'neovim/nvim-lspconfig',

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',

      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  },

  {
    'vim-autoformat/vim-autoformat',
    init = function()
      vim.cmd([[
      let g:formatters_jsonc=['prettier']
      let g:formatters_typescript=['prettier']
      let g:formatters_typescriptreact=['prettier']
      let g:formatters_css=['prettier']
      autocmd BufWrite * : Autoformat
      ]])
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = { close_if_last_window = true },
    cmd = { "Neotree" },
    keys = {
      { "<c-e>", "<cmd>Neotree toggle<CR>" },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'tokyonight'
      }
    }
  },

  { 'lewis6991/gitsigns.nvim', opts = {} },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag'
    },
    build = ':TSUpdate',
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
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

})

-- Settings
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.nowrap = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.cmd('colorscheme tokyonight')

-- LSP setup
local on_attach = function(_, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
end

require('lspconfig').clangd.setup({ on_attach=on_attach })
require('lspconfig').tsserver.setup({ on_attach=on_attach})
require('lspconfig').html.setup({
  settings = {
    filetypes = {
      'html'
    }
  }
})
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  }
})

local function get_python_path(workspace)
  local path = require('lspconfig/util').path

  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

require('lspconfig').pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict"
      }
    }
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
})


-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item()
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


-- treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'graphql',
    'haskell',
    'html',
    'javascript',
    'latex',
    'lua',
    'purescript',
    'python',
    'scss',
    'sql',
    'terraform',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'xml',
    'yaml',
  },
  autotag = {
    enable = true,
  },
  auto_install = true,
})


-- Core Vim options that have to go early.
vim.g.mapleader = ' '

-- Bootstrap package manager.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin includes.
require('lazy').setup({
  -- Colorscheme.
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
  -- Coq support.
  'whonore/Coqtail',
  -- Unicode symbol input with latex commands.
  'joom/latex-unicoder.vim',
  -- Fuzzy file/buffer/word finder.
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      -- Required telescope.vim dep. Helper module for async lua.
      'nvim-lua/plenary.nvim',
      -- Optional telescope.vim dep. Fast fuzzy sorting.
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
  -- Sensible default configs for most LSP servers.
  'neovim/nvim-lspconfig',
})

-- Some plugins need a lot of config, so move those to sep modules.
-- Lua searches for these in `~/.config/nvim/lua`.
require('nvim-lspconfig')
require('coqtail')

-- Plugin: telescope (fuzzy finder).
require('telescope').load_extension('fzf')
tel = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() tel.find_files() end)
vim.keymap.set('n', '<leader>fg', function() tel.live_grep() end)
vim.keymap.set('n', '<leader>fb', function() tel.buffers() end)

-- Misc key bindings.
-- No highlight.
vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>')
-- From insert mode to normal mode.
vim.keymap.set('i', 'kj', '<Esc>')
-- On term open, go to insert mode so we can start running cmds.
vim.api.nvim_create_autocmd({'TermOpen'}, {
  pattern = {'*'},
  command = 'startinsert',
})
-- New horizontal term.
vim.keymap.set('n', '<leader>th', '<cmd>split term://zsh<cr>')
-- New vertical term.
vim.keymap.set('n', '<leader>tv', '<cmd>vsplit term://zsh<cr>')
-- Window switch.
vim.keymap.set('n', '<leader>w', '<C-w>')

-- Misc Vim settings.
vim.wo.relativenumber = true
-- Set Vim clipboard to be the system clipboard.
vim.opt.clipboard = 'unnamedplus'
vim.o.ignorecase  = true
vim.o.smartcase   = true
-- Start new horizontal split below current.
vim.o.splitbelow  = true
-- Start new vertical split to the right of current.
vim.o.splitright  = true
-- Some indentation settings I copied.
-- Don't know if they are actually good.
vim.o.smarttab    = true
vim.o.smartindent = true
vim.o.expandtab   = true
vim.o.tabstop     = 4
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4
-- Make trailing line spaces display as a '-'.
vim.opt.list = true

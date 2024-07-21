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
      -- My env doesn't support italics.
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  -- Coq support.
  'whonore/Coqtail',
  -- Unicode symbol input with latex commands.
  { 'whatever/latex-unicoder.vim', dev = true },
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
vim.keymap.set('n', '<leader>f', '<C-w>')
-- Make j and k move by visual line, not actual line, when text is soft-wrapped.
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- Jump to start and end of line using the home row keys.
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
-- Ctrl+k as Esc.
vim.keymap.set('n', '<C-k>', '<Esc>')
vim.keymap.set('i', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-k>', '<Esc>')
vim.keymap.set('s', '<C-k>', '<Esc>')
vim.keymap.set('x', '<C-k>', '<Esc>')
vim.keymap.set('c', '<C-k>', '<Esc>')
vim.keymap.set('o', '<C-k>', '<Esc>')
vim.keymap.set('l', '<C-k>', '<Esc>')
vim.keymap.set('t', '<C-k>', '<Esc>')
-- Quick-save.
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- Misc Vim settings.
-- Relative line numbers.
vim.opt.relativenumber = true
-- Show absolute line number for the current line.
vim.opt.number = true
-- Set Vim clipboard to be the system clipboard.
vim.opt.clipboard = 'unnamedplus'
-- Case-insensitive search / replace.
vim.opt.ignorecase = true
-- Unless upper-case in search term.
vim.opt.smartcase = true
-- Start new horizontal split below current.
vim.opt.splitbelow = true
-- Start new vertical split to the right of current.
vim.opt.splitright = true
-- Make trailing line spaces display as a '-'.
vim.opt.list = true
-- Color a recommended column width.
vim.opt.colorcolumn = "80"
-- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for while performing editing operations.
vim.opt.softtabstop = 4
-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 4
-- Keep tabs as tabs, not spaces. Especially useful for Golang.
vim.opt.expandtab = false
-- Smart tab screws up often, mistakenly adding idents.
-- E.g., in a Coq comment, I'll write `foo-bar` and it'll mis-interpret
-- the "dash" and indent the line.
vim.opt.smarttab = false

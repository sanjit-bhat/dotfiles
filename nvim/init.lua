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
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin includes.
require('lazy').setup({
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'whonore/Coqtail',
  'joom/latex-unicoder.vim',
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
})

-- Plugin: catppuccin (colorscheme).
vim.g.catppuccin_flavour = 'macchiato'
require('catppuccin').setup({
  flavour = 'macchiato',
  show_end_of_buffer = 'true',
})
vim.cmd([[colorscheme catppuccin]])

-- Plugin: Coqtail (Coq).
-- Default maps leader keys in insert mode, which slows down normal leader typing.
vim.g.coqtail_noimap = 1

-- Plugin: latex-unicoder.vim (tex unicode).
iris = {}
iris['\\fun']     = 'λ'
iris['\\mult']    = '⋅'
iris['\\ent']     = '⊢'
iris['\\valid']   = '✓'
iris['\\diamond'] = '◇'
iris['\\box']     = '□'
iris['\\bbox']    = '■'
iris['\\later']   = '▷'
iris['\\pred']    = 'φ'
iris['\\and']     = '∧'
iris['\\or']      = '∨'
iris['\\comp']    = '∘'
iris['\\ccomp']   = '◎'
iris['\\all']     = '∀'
iris['\\ex']      = '∃'
iris['\\to']      = '→'
iris['\\sep']     = '∗'
iris['\\lc']      = '⌜'
iris['\\rc']      = '⌝'
iris['\\Lc']      = '⎡'
iris['\\Rc']      = '⎤'
iris['\\lam']     = 'λ'
iris['\\empty']   = '∅'
iris['\\Lam']     = 'Λ'
iris['\\Sig']     = 'Σ'
iris['\\-']       = '∖'
iris['\\aa']      = '●'
iris['\\af']      = '◯'
iris['\\auth']    = '●'
iris['\\frag']    = '◯'
iris['\\iff']     = '↔'
iris['\\gname']   = 'γ'
iris['\\incl']    = '≼'
iris['\\latert']  = '▶'
iris['\\update']  = '⇝'
iris['\\\'o']     = 'ö'
iris['_a']        = 'ₐ'
iris['_e']        = 'ₑ'
iris['_h']        = 'ₕ'
iris['_i']        = 'ᵢ'
iris['_k']        = 'ₖ'
iris['_l']        = 'ₗ'
iris['_m']        = 'ₘ'
iris['_n']        = 'ₙ'
iris['_o']        = 'ₒ'
iris['_p']        = 'ₚ'
iris['_r']        = 'ᵣ'
iris['_s']        = 'ₛ'
iris['_t']        = 'ₜ'
iris['_u']        = 'ᵤ'
iris['_v']        = 'ᵥ'
iris['_x']        = 'ₓ'
vim.g.unicode_map = iris

-- Plugin: telescope (fuzzy finder).
require('telescope').load_extension('fzf')
tel = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() tel.find_files() end)
vim.keymap.set('n', '<leader>fg', function() tel.live_grep() end)

-- Misc key bindings.
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>') 
vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>') 
vim.keymap.set('i', 'kj', '<Esc>')

-- Misc vim settings.
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"

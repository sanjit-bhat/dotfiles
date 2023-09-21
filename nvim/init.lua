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
  { 'sainnhe/gruvbox-material', priority = 1000 },
  'whonore/Coqtail',
  'joom/latex-unicoder.vim',
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
})

-- Plugin: gruvbox-material (colorscheme).
vim.cmd([[colorscheme gruvbox-material]])

-- Plugin: Coqtail (Coq).
-- Default maps leader keys in insert mode, which slows down normal leader typing.
vim.g.coqtail_noimap = 1
-- Get rid of distracting CoqtailChecked bg highlight until I can find a better color.
normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
coq_hi_desc = vim.api.nvim_get_hl(0, { name = "CoqtailChecked" })
coq_hi_desc.bg = normal_bg
vim.api.nvim_set_hl(0, "CoqtailChecked", coq_hi_desc)

-- Plugin: latex-unicoder.vim (tex unicode).
-- Note: Std Latex symbs already exist in the package.
iris = {}
iris['fun']        = 'λ'
iris['mult']       = '⋅'
iris['ent']        = '⊢'
iris['valid']      = '✓'
iris['diamond']    = '◇'
iris['box']        = '□'
iris['bbox']       = '■'
iris['later']      = '▷'
iris['pred']       = 'φ'
iris['and']        = '∧'
iris['or']         = '∨'
iris['comp']       = '∘'
iris['ccomp']      = '◎'
iris['all']        = '∀'
iris['ex']         = '∃'
iris['sep']        = '∗'
iris['lc']         = '⌜'
iris['rc']         = '⌝'
iris['Lc']         = '⎡'
iris['Rc']         = '⎤'
iris['lam']        = 'λ'
iris['empty']      = '∅'
iris['Lam']        = 'Λ'
iris['Sig']        = 'Σ'
iris['-']          = '∖'
iris['aa']         = '●'
iris['af']         = '◯'
iris['auth']       = '●'
iris['frag']       = '◯'
iris['gname']      = 'γ'
iris['incl']       = '≼'
iris['latert']     = '▶'
iris['update']     = '⇝'
iris['\'o']        = 'ö'
iris['_a']         = 'ₐ'
iris['_e']         = 'ₑ'
iris['_h']         = 'ₕ'
iris['_i']         = 'ᵢ'
iris['_k']         = 'ₖ'
iris['_l']         = 'ₗ'
iris['_m']         = 'ₘ'
iris['_n']         = 'ₙ'
iris['_o']         = 'ₒ'
iris['_p']         = 'ₚ'
iris['_r']         = 'ᵣ'
iris['_s']         = 'ₛ'
iris['_t']         = 'ₜ'
iris['_u']         = 'ᵤ'
iris['_v']         = 'ᵥ'
iris['_x']         = 'ₓ'
iris[':']          = '∷'
iris['not']        = '¬'
iris['->']         = '→'
iris['<->']        = '↔'
iris['<-']         = '←'
iris['\\notequiv'] = '≢'
vim.g.unicode_map  = iris

-- Plugin: telescope (fuzzy finder).
require('telescope').load_extension('fzf')
tel = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() tel.find_files() end)
vim.keymap.set('n', '<leader>fg', function() tel.live_grep() end)
vim.keymap.set('n', '<leader>fb', function() tel.buffers() end)

-- Misc key bindings.
-- Write.
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- Quit.
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
-- No highlight.
vim.keymap.set('n', '<leader>h', '<cmd>noh<cr>')
-- Window switch.
vim.keymap.set('n', '<leader>w', '<C-w>')
-- From insert mode to normal mode.
vim.keymap.set('i', 'kj', '<Esc>')

-- Misc Vim settings.
vim.wo.relativenumber = true
-- Set Vim clipboard to be the system clipboard.
vim.opt.clipboard = "unnamedplus"
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.smarttab    = true
vim.o.smartindent = true
-- Start new horizontal split below current.
vim.o.splitbelow  = true
-- Start new vertical split to the right of current.
vim.o.splitright  = true
vim.o.expandtab   = true
vim.o.tabstop     = 4
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4
-- Make trailing line spaces display as a "-".
vim.opt.list = true

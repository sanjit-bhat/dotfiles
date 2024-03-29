-- Default maps leader keys in insert mode, which slows down normal leader typing.
vim.g.coqtail_noimap = 1
-- Get rid of distracting CoqtailChecked bg highlight until I can find a better color.
--[[
normal_bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
coq_hi_desc = vim.api.nvim_get_hl(0, { name = 'CoqtailChecked' })
coq_hi_desc.bg = normal_bg
vim.api.nvim_set_hl(0, 'CoqtailChecked', coq_hi_desc)
]]

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
iris['equiv']      = '⊣⊢'
vim.g.unicode_map  = iris

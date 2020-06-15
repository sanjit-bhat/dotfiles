# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Supports better colors in tmux
export TERM="xterm-256color"

# ZSH Plugins
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For the z command to work properly
. /usr/local/etc/profile.d/z.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias ut="cd $HOME/Documents/UT-Misc"
alias sec="cd $HOME/Documents/UT-Classes/cs-380s"
alias v="vim"
alias gg="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"

# Gtkwave for Verilog visualization
alias gtkwave="/Applications/gtkwave.app/Contents/Resources/bin/gtkwave"

# Using the pyenv version of Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Adding dotfiles folder to path
export PATH=~/.dotfiles/bin:${PATH}

# Use Vim bindings
bindkey -v

# Nvm - Manages node versions
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

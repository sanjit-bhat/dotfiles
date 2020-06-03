# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export TERM="xterm-256color"

# NOTE: use Tango Dark color pallet with 1c1c1c background
# ZSH Plugins
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For the z command to work properly
. /usr/local/etc/profile.d/z.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias linear="$HOME/Documents/UT-Classes/m-341h"
alias arch="$HOME/Documents/UT-Classes/cs-429h"
alias sec="$HOME/Documents/UT-Classes/cs-380s"
alias his="$HOME/Documents/UT-Classes/his-315k"
alias prob="$HOME/Documents/UT-Classes/m-362k"
alias lin="$HOME/Documents/UT-Classes/cs-178h"
alias ut="$HOME/Documents/UT-Misc"

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

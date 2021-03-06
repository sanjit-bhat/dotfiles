# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Support better colors in tmux
export TERM="xterm-256color"

# ZSH Plugins
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Autoload all ZSH functions in ~/.zfunc
# -U disables alias expansion
# z forces ZSH-style autoloading
fpath=( ~/.zfunc "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# Enable z command to work properly
. ~/.z.sh

# Set preferred editor for local and remote sessions
export EDITOR='vim'

# Add aliases
# Have sudo commands expand aliases
alias sudo="sudo "
alias v="vim"
alias m="make"
alias rg="rg -S"  # Smart case flag
alias p="ipython"
alias p3="python3"
alias ctags="ctags -R -f ./.tags ."
alias tl="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"

alias gg="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias gr="git restore"
alias gl="git log --all --graph --decorate"

# Conditional aliases depending on OS
case `uname` in
  Darwin)
    alias ls="ls -G"
    # Python binaries
    export PATH=/usr/local/bin:${PATH}
    # Open command
    alias o="open"
  ;;
  Linux)
    alias ls="ls --color"
    alias fd="fdfind"
    # Python binaries
    export PATH=~/.local/bin:${PATH}
    # Open command
    alias o="gio open"
  ;;
esac

# Gtkwave for Verilog visualization
alias gtkwave="/Applications/gtkwave.app/Contents/Resources/bin/gtkwave"

# Add dotfiles folder to path
export PATH=~/.dotfiles/bin:${PATH}

# Add Cargo to path
export PATH=~/.cargo/bin:${PATH}

# Add Go binaries to path
export PATH=~/go/bin:${PATH}

# Add Dotnet to path
export PATH=~/.dotnet/tools:${PATH}

# Use Vim bindings in Zsh
bindkey -v

# Bind 'k' and 'j' to history search in Vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Nvm - Manages node versions
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Haskell support
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

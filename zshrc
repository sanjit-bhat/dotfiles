# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Support better colors in tmux.
export TERM="xterm-256color"

# Zsh plugins.
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Autoload all ZSH functions in ~/.zfunc.
# -U disables alias expansion.
# z forces ZSH-style autoloading.
fpath=( ~/.zfunc "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# Make z cmd work.
. ~/.z.sh

# Set preferred editor for local and remote sessions.
export EDITOR='nvim'

# Add aliases.
# This lets sudo expand aliases.
alias sudo="sudo "
alias v="nvim"
alias m="make"
alias rg="rg -S"  # Smart case flag
alias p="python3"
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
alias cl="git clone"
alias gcp="git cherry-pick"

# Conditional aliases depending on OS.
case `uname` in
  Darwin)
    alias ls="ls -G"
    # Python binaries.
    export PATH=/usr/local/bin:${PATH}
    # Open command.
    alias o="open"
  ;;
  Linux)
    alias ls="ls --color"
    alias fd="fdfind"
    # Python binaries.
    export PATH=~/.local/bin:${PATH}
    # Open command.
    alias o="gio open"
  ;;
esac

# Homebrew bins.
export PATH=/opt/homebrew/bin:${PATH}

# Dotfiles bins.
export PATH=~/.dotfiles/bin:${PATH}

# Cargo bins.
export PATH=~/.cargo/bin:${PATH}

# Go bins.
export PATH=~/go/bin:${PATH}

# Zsh Vim bindings.
bindkey -v

# Bind 'k' and 'j' to history search in Vim mode.
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Ruby configs.
eval "$(rbenv init - zsh)"

# Racket bins.
export PATH=/Applications/Racket\ v8.6/bin/:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sanjit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sanjit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sanjit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sanjit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Opam configs.
[[ ! -r /Users/sanjit/.opam/opam-init/init.zsh ]] || source /Users/sanjit/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Haskell configs.
[ -f "/Users/sanjit/.ghcup/env" ] && source "/Users/sanjit/.ghcup/env" # ghcup-env

# Private zshrc.
source ~/.dotfiles/priv/zshrc

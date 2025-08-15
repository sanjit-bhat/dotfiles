# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew. needs to come early.
export PATH=/opt/homebrew/bin:${PATH}
export PATH=/opt/homebrew/sbin:${PATH}

# Zsh Vim bindings.
bindkey -v

# Zsh plugins.
source "$(brew --prefix)"/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source "$(brew --prefix)"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# history search on cmd prefix.
source "$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# history search on cmd fuzzy-match.
source "$(brew --prefix)"/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind 'k' and 'j' to history search in Vim mode.
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Autoload all ZSH functions in ~/.zfunc.
# -U disables alias expansion.
# z forces ZSH-style autoloading.
fpath=( ~/.zfunc "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# Preferred editor.
export EDITOR="nvim"

# Aliases.
# This lets sudo expand aliases.
alias sudo="sudo "
alias v="nvim"
alias m="make"
alias p="python3"
alias python="python3"
alias pip="pip3"
alias tl="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias g="git"
alias wifi="ping google.com"
alias d="delta"
alias rg="rg -S"

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

export PATH=~/.dotfiles/bin:${PATH}

export PATH=~/.cargo/bin:${PATH}

export PATH=~/go/bin:${PATH}

export PATH="$(brew --prefix rustup)"/bin:${PATH}

eval "$(rbenv init - zsh)"

[[ ! -r /Users/sanjit/.opam/opam-init/init.zsh ]] || source /Users/sanjit/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Haskell.
[ -f "/Users/sanjit/.ghcup/env" ] && source "/Users/sanjit/.ghcup/env"

# Default to standard Python venv.
source ~/py-venv/std/bin/activate

# Z. faster directory switching.
. "$(brew --prefix z)"/etc/profile.d/z.sh

# direnv. custom directory env vars.
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""

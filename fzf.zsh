# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/sb01967/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/sb01967/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/sb01967/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/sb01967/.fzf/shell/key-bindings.zsh"

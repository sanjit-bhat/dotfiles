# no greeting.
function fish_greeting
end

# user_functions comes from dotfiles.
# standard ~/.config/fish/functions is managed by fisher.
set fish_function_path $__fish_config_dir/user_functions $fish_function_path

# aliases.
abbr --add g git
abbr --add v nvim

# starship: shell prompt.
status --is-interactive; and starship init fish | source

# direnv: custom .envrc files.
direnv hook fish | source
set -gx DIRENV_LOG_FORMAT

# configure ecosystems.
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end
if test -e /opt/homebrew/bin/rustup
    fish_add_path (brew --prefix rustup)/bin
end
fish_add_path ~/.local/bin ~/.dotfiles/bin
fish_add_path ~/.cargo/bin ~/go/bin (brew --prefix rustup)/bin

# misc.
set -gx EDITOR nvim

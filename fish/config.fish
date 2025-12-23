# no greetings.
function fish_greeting
end

# user_functions comes from dotfiles.
# standard ~/.config/fish/functions is managed by fisher.
set fish_function_path $__fish_config_dir/user_functions $fish_function_path

# configure ecosystems.
if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end
if [ -f /opt/homebrew/bin/rustup ]
    fish_add_path (brew --prefix rustup)/bin
end
fish_add_path ~/.local/bin ~/.dotfiles/bin
fish_add_path ~/.cargo/bin ~/go/bin (brew --prefix rustup)/bin

direnv hook fish | source
set -gx DIRENV_LOG_FORMAT

# aliases.
abbr --add g git
abbr --add v nvim
function wifi
    ping google.com
end

# misc.
set -gx EDITOR nvim

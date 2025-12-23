# no greeting.
function fish_greeting
end

# user_functions comes from dotfiles.
# standard ~/.config/fish/functions is managed by fisher.
set fish_function_path $__fish_config_dir/user_functions $fish_function_path

# homebrew. needs to come early.
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# starship: shell prompt.
if status --is-interactive; and test -e /opt/homebrew/bin/starship
    starship init fish | source
end

# zoxide: fast dir switching.
if status --is-interactive; and test -e /opt/homebrew/bin/zoxide
    zoxide init fish | source
end

# direnv: custom .envrc files.
if test -e /opt/homebrew/bin/direnv
    direnv hook fish | source
    set -gx DIRENV_LOG_FORMAT
end

# configure ecosystems.
fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin
if test -e /opt/homebrew/bin/rustup
    fish_add_path (brew --prefix rustup)/bin
end

# misc.
set -gx EDITOR nvim
fish_vi_key_bindings

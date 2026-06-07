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
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# starship: shell prompt.
if status --is-interactive; and command -q starship
    starship init fish | source
end

# zoxide: fast dir switching.
if status --is-interactive; and command -q zoxide
    zoxide init fish | source
end

# direnv: custom .envrc files.
if command -q direnv
    direnv hook fish | source
    set -gx DIRENV_LOG_FORMAT
end

# colors for commands like fd.
if command -q vivid
    set -gx LS_COLORS (vivid generate gruvbox-light)
end

# configure ecosystems.
fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin
if command -q rustup
    fish_add_path (brew --prefix rustup)/bin
end
if test -e ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish
end
if test -e ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish
end

# misc.
set -gx EDITOR nvim
fish_vi_key_bindings
set -gx CLAUDE ~/OrbStack/agents/home/claude

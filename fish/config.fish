# no greeting.
function fish_greeting
end

# user_functions comes from dotfiles.
# standard ~/.config/fish/functions is managed by fisher.
set fish_function_path $__fish_config_dir/user_functions $fish_function_path

# homebrew. needs to come early.
if path is /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end
if path is /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# starship: shell prompt.
if status --is-interactive; and command --query starship
    starship init fish | source
end

# zoxide: fast dir switching.
if status --is-interactive; and command --query zoxide
    zoxide init fish | source
end

# direnv: custom .envrc files.
if command --query direnv
    direnv hook fish | source
    set --global --export DIRENV_LOG_FORMAT
end

# colors for commands like fd.
if command --query vivid
    set --global --export LS_COLORS (vivid generate gruvbox-light)
end

# configure ecosystems.
fish_add_path --global ~/.local/bin ~/.cargo/bin ~/go/bin
if command --query rustup
    fish_add_path --global (brew --prefix rustup)/bin
end
if path is ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish
end
if path is ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish
end

# misc.
set --global --export EDITOR nvim
set --global fish_key_bindings fish_vi_key_bindings
set --global --export CLAUDE ~/OrbStack/agents/home/claude

function tma -d "tmux attach (or create) session"
    tmux new-session -A -s $argv[1]
end

function tmls -d "tmux list sessions"
    tmux list-sessions
end

function notify -d "notify executes a long-running command and
        issues a system notification after it finishes"
    # run cmd.
    $argv
    # send notification with cmd and err code.
    /usr/bin/osascript -e "display notification \"err: $status\" with title \"$argv\" sound name \"Bottle\""
end

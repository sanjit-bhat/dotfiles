function notify -d "notify executes a long-running command and
        issues a system notification after it finishes"
    # run cmd with caffeinate to prevent sleep.
    # caffeinate preserves $status from $argv.
    caffeinate -i $argv
    # send notification with cmd and err code.
    /usr/bin/osascript -e "display notification \"err: $status\" with title \"$argv\" sound name \"Bottle\""
end

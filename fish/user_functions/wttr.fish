function wttr -d "get the weather report"
    argparse l/long -- $argv
    or return

    # https://wttr.in/:help
    # u: US units.
    # 0: just current weather.
    # q: quiet.
    # T: no colors.
    if set -ql _flag_long
        curl wttr.in?uqT
    else
        curl wttr.in?u0qT
    end
end

function wttr -d "get the weather report"
    argparse 'd/days=' 'l/location=' -- $argv
    or return

    if not set -qf _flag_days
        set -f _flag_days 0
    end
    if not set -qf _flag_location
        set -f _flag_location "cambridge,ma,us"
    end

    # uses the OpenWeather API.
    wego -days $_flag_days -location $_flag_location -units imperial \
        -owm-api-key $OWM_API_KEY | ansifilter
end

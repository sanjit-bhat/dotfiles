function u -d "go up some number of directories"
    if test (count $argv) -eq 0
        cd ..
    else
        cd (string repeat -n $argv[1] "../")
    end
end

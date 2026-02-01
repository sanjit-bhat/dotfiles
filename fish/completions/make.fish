# Completions for make
# this is a fork of the fish stdlib, with makefile target completions removed.
# those were too slow, even for smaller makefiles.
complete -c make -s f -d "Use file as makefile" -r
complete -x -c make -s C -l directory -x -a "(__fish_complete_directories (commandline -ct))" -d "Change directory"
complete -c make -s d -d "Debug mode"
complete -c make -s e -d "Environment before makefile"
complete -c make -s i -d "Ignore errors"
complete -x -c make -s I -d "Search directory for makefile" -a "(__fish_complete_directories (commandline -ct))"
complete -f -c make -s j -d "Number of concurrent jobs (no argument means no limit)"
complete -c make -s k -d "Continue after an error"
complete -c make -s l -d "Start when load drops"
complete -c make -s n -d "Do not execute commands"
complete -c make -s o -r -d "Ignore specified file"
complete -c make -s p -d "Print database"
complete -c make -s q -d "Question mode"
complete -c make -s r -d "Eliminate implicit rules"
complete -c make -s s -d "Quiet mode"
complete -c make -s S -d "Don't continue after an error"
complete -c make -s t -d "Touch files, don't run commands"
complete -c make -s v -d "Display version and exit"
complete -c make -s w -d "Print working directory"
complete -c make -s W -r -d "Pretend file is modified"

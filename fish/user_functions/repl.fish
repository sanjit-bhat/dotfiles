function repl -a from to -d "simple find and replace"
    set -x expr "s/"$from"/"$to"/g"
    fd . --type file --exec gsed --in-place $expr {}
end

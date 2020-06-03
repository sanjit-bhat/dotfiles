#!/bin/zsh

echo 'Installing lints through brew'
# icarus-verilog -> Verilog
# golangci/tap/golangci-lint -> Go
# hadolint -> Dockerfile
# cppcheck -> C/C++
# llvm -> C/C++
brew install \
    icarus-verilog \
    golangci/tap/golangci-lint \
    hadolint \
    cppcheck \
    llvm

echo 'Linking LLVM Lints'
ln -s "$(brew --prefix llvm)/bin/clang-format" "/usr/local/bin/clang-format"
ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"

echo 'Tex/Latex/Markdown/Text Lint'
pip install proselint

echo 'YAML Lint'
pip install yamllint

echo 'Python Lint'
pip install pylint

echo 'Cmake Lint'
pip install cmakelint

echo 'Vim Lint'
pip install vim-vint

echo 'JavaScript Lint'
sudo npm install standard --global

#!/bin/zsh

brew install pyenv

VERSION="3.8.2"  # Use latest version instead of 3.8.2
pyenv install $VERSION 
pyenv global $VERSION

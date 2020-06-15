Sanjit's Dotfiles
=================

Steps for setting up the dev environment:
1. Download `brew` and `ITerm2` on Mac OS for package management and a better terminal
1. Clone this repo
1. Run `./install` to link everything and automatically clone the submodules
1. Optional
    1. Install the `MesloLGF NF` font linked
    [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
    1. Load up `ITerm2` and apply the `ITerm-Powerlevel10k.json` config file in this repo as the default config.
    This should set the background color to `1c1c1c` and the
    text font to `MesloLGS NF`
    1. Set up `python` through the `install_python` script provided in this repo
    1. Run `install_lints` to install all the lints and syntax checkers needed for Vim Syntastic to work

Notes:
1. `git submodule update --init --recursive` in `install.conf.yaml`
keeps submodules at their proper versions
1. To upgrade submodules to their latest versions, run
`git submodule update --init --remote`
1. This repository uses
[dotbot](https://github.com/anishathalye/dotbot)
to handle automatic installation of dotfiles

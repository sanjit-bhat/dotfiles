Sanjit's Dotfiles
=================

Steps for setting up the dev environment:
1. Download `brew` and `ITerm2` on Mac OS for package management and a better terminal
1. Clone this repo
1. Setup `python` through the script provided in this repo
1. Run `./install` to link everything and automatically clone the submodules
1. Install the `MesloLGF NF` font linked
[here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
1. Load up `ITerm2` and apply the config file in this repo as the default config.
Specifically, make sure that the background color is set to `1c1c1c` and the
text font uses `MesloLGS NF`

Note:
1. To keep submodules at their proper versions, you could include something like
`git submodule update --init --recursive` in your `install.conf.yaml`
1. To upgrade your submodules to their latest versions, you could periodically run
`git submodule update --init --remote`
1. This repository uses
[dotbot](https://github.com/anishathalye/dotbot)
to handle automatic installation of dotfiles

Sanjit's Dotfiles
=================

Steps for setting up dev environment:
1. Clone this repo.
1. Run `./install` to link everything and automatically clone the submodules.
1. Install `homebrew` for package management.
`Brewfile` contains a checkpoint of my packages,
and can be installed with `brew bundle`.
(Note, I prefer to use one tool for as many dependencies as possible.
That way, I only need to perform upgrades in one place.)
1. Install `ITerm2` for a terminal.
1. Install the `MesloLGF NF` font linked
[here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).
1. Load up `ITerm2` and apply `ITerm-Powerlevel10k.json` as the default config.
This sets the terminal color scheme to `gruvbox-light` and
the terminal font to `MesloLG Nerd Font`.
1. At OS-level, re-map:
    1. `caps lock` to `control`. highly used in vim; easiest spot to reach.
    1. `control` to `escape`. used to change vim modes; easier to reach.

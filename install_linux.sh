# Should be idempotent

sudo apt upgrade

sudo apt install \
    build-essential \
    tldr \
    ripgrep \
    fd-find \
    curl \
    python-pip \
    htop

sudo apt install zsh
chsh -s /usr/bin/zsh

mkdir ~/Projects
cd ~/Projects
git clone https://github.com/sanjit-bhat/dotfiles.git
cd dotfiles
./install

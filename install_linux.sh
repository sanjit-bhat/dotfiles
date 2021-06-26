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

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt install gh

sudo apt install zsh
chsh -s /usr/bin/zsh

mkdir ~/Projects
cd ~/Projects
git clone https://github.com/sanjit-bhat/dotfiles.git
cd dotfiles
./install

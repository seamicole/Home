#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ CONFIGURE GIT
# └─────────────────────────────────────────────────────────────────────────────────────

# Set git user email and user name
git config --global user.email "seamicole@gmail.com"
git config --global user.name "Sean O'Leary"

# Set git upstream branch to main
cd ~/ && git branch --set-upstream-to=origin/main

# Set remote to use SSH
cd ~/ && git remote set-url origin git@github.com:seamicole/Home.git

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ SET AVATAR
# └─────────────────────────────────────────────────────────────────────────────────────

# Set avatar
sudo cp ~/Pictures/avatars/semicolon/semicolon-white.png ~/.face

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ CREATE REPOS DIRECTORY
# └─────────────────────────────────────────────────────────────────────────────────────

# Create Repos directory
mkdir ~/Repos

# Add Repos directory to Nautilus bookmarks
echo "file://$HOME/Repos" >> ~/.config/gtk-3.0/bookmarks

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ CONFIGURE BASH ALIASES
# └─────────────────────────────────────────────────────────────────────────────────────

# Add an external source file to .bashrc for aliases
echo -e "\n# Add an external source file for aliases\nif [ -f ~/.bashrc_aliases ]; then\nsource ~/.bashrc_aliases\nfi" >> ~/.bashrc

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ UPDATE AND UPGRADE
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt update and upgrade
sudo apt update && sudo apt upgrade -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL CURL
# └─────────────────────────────────────────────────────────────────────────────────────

# Install curl
sudo apt install curl -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL XCLIP
# └─────────────────────────────────────────────────────────────────────────────────────

# Install xclip
# e.g. so you can do things like cat file.txt | xclip -selection clipboard
sudo apt install xclip

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL RIPGREP
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Ripgrep .deb file
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb

# Install Ripgrep from .deb file
sudo dpkg -i ./ripgrep_13.0.0_amd64.deb

# Delete the Ripgrep .deb file
sudo rm -rf ./ripgrep_13.0.0_amd64.deb

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL PIP AND CORE LIBRARIES
# └─────────────────────────────────────────────────────────────────────────────────────

# Install pip for Python 3
sudo apt install python3-pip -y

# Install Black
pip3 install black

# Install Flake8
pip3 install flake8

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL POETRY
# └─────────────────────────────────────────────────────────────────────────────────────

# Download and set up Poetry using the custom installer
curl -sSL https://install.python-poetry.org | python3 -

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL NODE.JS
# └─────────────────────────────────────────────────────────────────────────────────────

# Specify Node.js source for v16 (minimum required for GitHub Copilot)
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Install Node.js (pre-requisite for GitHub Copilot)
sudo apt install nodejs -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL RUST
# └─────────────────────────────────────────────────────────────────────────────────────

# Install Rustup and Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup update stable

# Install rust-analyzer
rustup component add rust-analyzer

# Make rust-analyzer accessible system-wide
mkdir -p ~/.local/bin
ln -s $(rustup which rust-analyzer) ~/.local/bin/rust-analyzer

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL VIM
# └─────────────────────────────────────────────────────────────────────────────────────

# Add the latest PPA for Vim 9
sudo add-apt-repository ppa:jonathonf/vim

# Install Vim
sudo apt install vim -y

# Install python3-venv
# Necessary for using Black as a Vim dependency
sudo apt install python3-venv -y

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run PlugInstall
vim +'PlugInstall --sync' +qa

# Install vim-gtk
sudo apt install vim-gtk -y  # So "+y can be used to yank to clipboard

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL TLP
# └─────────────────────────────────────────────────────────────────────────────────────

# Install TLP battery manager
sudo apt install tlp tlp-rdw -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL DELL COMMAND CONFIGURE
# └─────────────────────────────────────────────────────────────────────────────────────

# Ensure in home directory
cd ~/

# Download Dell Command Configure zip file
wget https://dl.dell.com/FOLDER09518608M/1/command-configure_4.10.0-5.ubuntu22_amd64.tar.gz -O command-configure.tar.gz

# Extract zip file into a temporary command-configure directory
mkdir command-configure && tar -xf command-configure.tar.gz -C command-configure

# Delete the Command Configure zip file
sudo rm -rf ./command-configure.tar.gz

# Get file paths
file_paths=(./command-configure/*)

# Initialize for loop of files in reverse
# Because we need to install the srvadmin file first
for ((i = ${#file_paths[@]} - 1; i >= 0; i--))
do
    # Install the .deb file
    sudo dpkg -i ${file_paths[i]}
done

# Delete the temporary command-configure directory
sudo rm -rf ./command-configure

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL GOOGLE CHROME
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Google Chrome .deb file
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome from .deb file
sudo apt install ./google-chrome-stable_current_amd64.deb

# Delete the Google Chrome .deb file
sudo rm -rf ./google-chrome-stable_current_amd64.deb

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL NORDVPN
# └─────────────────────────────────────────────────────────────────────────────────────

# Install NordVPN
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# Configure NordVPN permissions
sudo usermod -aG nordvpn $USER

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL UPWORK
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Upwork .deb file
wget https://upwork-usw2-desktopapp.upwork.com/binaries/v5_8_0_24_aef0dc8c37cf46a8/upwork_5.8.0.24_amd64.deb \
	--user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" \
	-O upwork.deb

# Install Upwork from .deb file
sudo dpkg -i ./upwork.deb

# Ensure dependencies are met
sudo apt install -fy

# Delete the Upwork .deb file
sudo rm -rf ./upwork.deb

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL GITHUB CLI
# └─────────────────────────────────────────────────────────────────────────────────────

# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL AWS CLI
# └────────────────────────────────────────────────────────────────────────────────────

# Install AWS CLI
sudo apt install awscli -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL HEROKU CLI
# └────────────────────────────────────────────────────────────────────────────────────

# Install Heroku CLI
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL DOCKER
# └────────────────────────────────────────────────────────────────────────────────────

# Install Docker dependencies
sudo apt install ca-certificates gnupg -y

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index
sudo apt update

# Install Docker Engine, containerd, and docker-compose
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add Docker group
sudo groupadd docker

# Add current user to Docker group
sudo usermod -aG docker $USER

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ AUTOREMOVE PACKAGES
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt autoremove
sudo apt autoremove -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ CUSTOMIZE DESKTOP SIDEBAR
# └─────────────────────────────────────────────────────────────────────────────────────

# Assign desktop sidebar shortcuts
gsettings set org.gnome.shell favorite-apps "[\
	'org.gnome.Nautilus.desktop', \
	'google-chrome.desktop', \
	'upwork.desktop'\
	]"

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ DISABLE AUTO SCREEN BRIGHTNESS
# └─────────────────────────────────────────────────────────────────────────────────────

# Disable auto screen brightness
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ LOGIN TO GOOGLE CHROME
# └─────────────────────────────────────────────────────────────────────────────────────

# Open Google Chrome
google-chrome

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ LOGIN TO GITHUB CLI
# └─────────────────────────────────────────────────────────────────────────────────────

# Login to GitHub CLI
gh auth login --web --git-protocol ssh

# Add GitHub SSH key to known hosts
ssh -T git@github.com

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL GITHUB CO-PILOT
# └─────────────────────────────────────────────────────────────────────────────────────

# Install GitHub Copilot
git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim

# Setup GitHub Copilot
vim +':Copilot setup' +qa

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ REBOOT SYSTEM
# └─────────────────────────────────────────────────────────────────────────────────────

# Print completion message
echo
echo "System installation complete -- rebooting!"
echo

# Reboot computer
sudo reboot

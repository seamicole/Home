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
# │ INSTALL TLP
# └─────────────────────────────────────────────────────────────────────────────────────

# Install TLP battery manager
sudo apt install tlp tlp-rdw -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ INSTALL VIM
# └─────────────────────────────────────────────────────────────────────────────────────

# Install Vim
sudo apt install vim -y

# Install vim-gtk
sudo apt install vim-gtk -y  # So "+y can be used to yank to clipboard

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run PlugInstall
vim +'PlugInstall --sync' +qa

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
# │ INSTALL UPWORK
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Upwork .deb file
wget "drive.google.com/u/3/uc?id=1Bq5jCFAoAtIgx9atcynw27uM2WuMZ19z&export=download&confirm=yes" --no-check-certificate -O upwork.deb

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
# │ AUTOREMOVE PACKAGES
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt autoremove
sudo apt autoremove -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ CUSTOMIZE DESKTOP SIDEBAR
# └─────────────────────────────────────────────────────────────────────────────────────

gsettings set org.gnome.shell favorite-apps "[\
	'google-chrome.desktop', \
	'upwork.desktop', \
	'org.gnome.Nautilus.desktop'\
	]"

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
# │ REBOOT SYSTEM
# └─────────────────────────────────────────────────────────────────────────────────────

# Print completion message
echo
echo "System installation complete -- rebooting!"
echo

# Reboot computer
sudo reboot

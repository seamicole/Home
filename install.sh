#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ GIT UPSTREAM
# └─────────────────────────────────────────────────────────────────────────────────────

# Set git upstream branch to main
cd ~/ && git branch --set-upstream-to=origin/main

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ UPDATE AND UPGRADE
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt update and upgrade
sudo apt update && sudo apt upgrade -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ TLP
# └─────────────────────────────────────────────────────────────────────────────────────

# Install TLP battery manager
sudo apt install tlp tlp-rdw -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ VIM
# └─────────────────────────────────────────────────────────────────────────────────────

# Install Vim
sudo apt install vim -y

# Install vim-gtk
sudo apt install vim-gtk -y  # So "+y can be used to yank to clipboard

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ GOOGLE CHROME
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Google Chrome .deb file
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome from .deb file
sudo apt install ./google-chrome-stable_current_amd64.deb

# Delete the Google Chrome .deb file
sudo rm -rf ./google-chrome-stable_current_amd64.deb

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ UPWORK
# └─────────────────────────────────────────────────────────────────────────────────────

# Download Upwork .deb file
sudo wget "drive.google.com/u/3/uc?id=1Bq5jCFAoAtIgx9atcynw27uM2WuMZ19z&export=download&confirm=yes" --no-check-certificate -O upwork.deb

# Install Upwork from .deb file
sudo apt install ./upwork.deb

# Delete the Upwork .deb file
sudo rm -rf ./upwork.deb

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ DESKTOP SIDEBAR
# └─────────────────────────────────────────────────────────────────────────────────────

gsettings set org.gnome.shell favorite-apps "[\
	'google-chrome.desktop', \
	'upwork.desktop', \
	'org.gnome.Nautilus.desktop', \
	'org.gnome.Terminal.desktop'\
	]"

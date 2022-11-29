#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ GIT UPSTREAM
# └─────────────────────────────────────────────────────────────────────────────────────

# Set git upstream branch to main
git branch --set-upstream-to=origin/main

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ UPDATE AND UPGRADE
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt update and upgrade
sudo apt update && apt upgrade -y

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
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome from .deb file
sudo apt install ./google-chrome-stable_current_amd64.deb

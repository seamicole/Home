#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ UPDATE AND UPGRADE
# └─────────────────────────────────────────────────────────────────────────────────────

# Run apt update and upgrade
sudo apt update && apt upgrade -y

# ┌─────────────────────────────────────────────────────────────────────────────────────
# │ VIM
# └─────────────────────────────────────────────────────────────────────────────────────

# Install Vim
sudo apt install vim -y

# Install vim-gtk
sudo apt install vim-gtk -y  # So "+y can be used to yank to clipboard

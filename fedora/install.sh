#!/bin/bash

# Configure DNF for Faster Downloads of Packages
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=true" | sudo tee -a /etc/dnf/dnf.conf

# Update and Upgrade
sudo dnf update -y && sudo dnf upgrade -y

# Used to counter time inconsistencies in dual boot systems
sudo timedatectl set-local-rtc '0'

# Install RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh

# Install NVIDIA Driver
sudo dnf install akmod-nvidia

# Install packages
sudo dnf install -y \
  gnome-tweaks \
  mpv \
  vlc \
  unrar \
  unzip \
  htop \
  neofetch \
  timeshift \
  xclip

# Install package from FlatHub
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub com.google.Chrome
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
flatpak install flathub org.telegram.desktop
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.visualstudio.code
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub com.getpostman.Postman
flatpak install flathub com.redis.RedisInsight
flatpak install flathub com.google.AndroidStudio
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.localsend.localsend_app
flatpak install flathub org.flameshot.Flameshot
flatpak install flathub com.dropbox.Client
flatpak install flathub org.mozilla.Thunderbird
flatpak install flathub dev.k8slens.OpenLens

# Install nerdfonts
curl -L https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh | bash
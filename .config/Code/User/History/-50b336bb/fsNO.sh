#!/bin/bash
# Variables
base_pkgs="
    # Base
    mesa vulkan-intel sddm polkit polkit-gnome libnotify udiskie

    # Terminal and CLI Utilities
    kitty brightnessctl pamixer imagemagick neofetch btop acpi unzip neovim cava

    # QT
    qt5-wayland qt5-quickcontrols2 qt5-graphicaleffects qt5-svg qt6-wayland qt6ct

    # Fonts
    ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd font-manager

    # Themes - GTK, Cursor and Icon
    tokyonight-gtk-theme-git bibata-cursor-theme-bin papirus-icon-theme"
wayland_pkgs="
    wayland xorg-xwayland hyprland xdg-desktop-portal-hyprland waybar rofi-wayland mako grim slurp"
apps="
    pavucontrol nwg-look firefox feh visual-studio-code-bin"
dev_tools="
    openssh git gcc cmake wget curl"

# TUI - Simple Text-User Interface
function TUI() {
    # Display A Simple Text-User Interface
    echo -e "\tArchDots by Voxi0"
    echo "1) Install"
    echo "2) Uninstall"
    read -p "Choice: " choice
    case $choice in
        1)
            install_pkgs
            ;;
        2)
            uninstall_pkgs
            ;;
        *)
            echo "Invalid Option!"
            echo
            TUI
    esac
}

# Install/Uninstall Packages
function install_pkgs() {
    # Move Pacman Config File to System, Sync Arch Repos and Update System
    sudo cp pacman.conf /etc/ && sudo pacman -Syy && sudo pacman -Syu

    # Install Yay AUR Package Manager
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sic && cd ..
    rm -rf yay

    # Install Packages
    yay -S $base_pkgs $wayland_pkgs $apps $dev_tools
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Install Dots
    install_dots
}
function uninstall_pkgs() {
    # Install Yay AUR Package Manager - Just so The Commands Below Works
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sic && cd ..
    rm -rf yay

    # Uninstall Packages
    yay -Rscun $base_pkgs $wayland_pkgs $apps $dev_tools
    rustup self uninstall
}

# Install Dotfiles to System - '.config', SDDM, GRUB and Default Icon Config
function install_dots() {
    # SDDM and Default Icon Config
    sudo cp ./index.theme /usr/share/icons/default/
    sudo cp -r ./TokyoNight-SDDM /usr/share/sddm/themes/ && sudo cp ./sddm.conf /etc/

    # GRUB - Install GRUB Theme and Move GRUB Config to System
    git clone https://github.com/mino29/tokyo-night-grub.git && sudo cp -r tokyo-night-grub/tokyo-night /usr/share/grub/themes/
    rm -rf tokyo-night-grub
    sudo cp ./grub /etc/default/ && sudo grub-mkconfig -o /boot/grub/grub.cfg

    # Home - '.config', 'Pictures' and 'Documents' Folders
    sudo rm -rf ~/.config && sudo cp -r ./.config ~/
    sudo cp -r ./Pictures ~/ && sudo cp -r ./Documents ~/

    # Finish
    finish
}

# Add User to Groups, Enable System Services and Run Custom Commands
function finish() {
    # Enable Firewall
    sudo ufw enable && sudo ufw allow ssh && sudo ufw status verbose

    # Add User to Groups
    sudo usermod -aG video voxi0
    sudo usermod -aG uucp voxi0

    # Enable System Services
    sudo systemctl enable sddm.service

    # Finish Message
    echo && echo
    echo "Would You Like to Reboot Now?"
    read -p "Y/N: " choice
    case $choice in
        'Y')
            reboot
            ;;
        'N')
            ;;
        *)
            echo "Invalid Option! Rebooting in 5 Seconds."
            sleep 5
            reboot
    esac
}

# Script Entry Point
TUI
# Sync Arch Repos and Update System
sudo pacman -Syy && sudo pacman -Syu

# Create Basic Directories
cd ~ && mkdir -p Desktop Downloads

# Move Pacman Config File to System
sudo mv ./pacman.conf /etc/

# Install Packages
# Base
sudo pacman -S mesa vulkan-intel wayland xorg-xwayland polkit polkit-gnome qt5-wayland qt6-wayland qt6ct hyprland xdg-desktop-portal-hyprland
sudo pacman -S papirus-icon-theme hyprpaper waybar rofi libnotify mako udiskie kitty brightnessctl pamixer pavucontrol ufw

# Apps
sudo pacman -S nwg-look firefox feh

# Fonts
sudo pacman -S ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd font-manager

# CLI Utils
sudo pacman -S neofetch imagemagick btop acpi unzip grim slurp neovim
sudo pacman -S openssh git gcc cmake wget curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Yay AUR Package Manager
cd ~/Downloads/
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sic
cd .. && rm -rf yay

# Install AUR Packages
yay -S tokyonight-gtk-theme-git bibata-cursor-theme-bin visual-studio-code-bin cava

# Install SDDM
sudo pacman -S qt5-quickcontrols2 qt5-graphicaleffects qt5-svg
sudo pacman -S sddm

# Install SDDM Tokyo Night Theme
sudo mv ./tokyo-night-sddm /usr/share/sddm/themes/

# Install GRUB Tokyo Night Theme
cd ~/Downloads/ && git clone https://github.com/mino29/tokyo-night-grub.git
sudo cp -r tokyo-night-grub/tokyo-night /usr/share/grub/themes/
rm -rf tokyo-night-grub

# Generate a New ED25519 SSH Key
ssh-keygen -t ed25519 -C "alif200099@gmail.com"

# Enable Firewall
sudo ufw enable && sudo ufw allow ssh && sudo ufw status verbose

# Move Config Files to System
sudo mv ./grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo mv ./sddm.conf /etc/
sudo mv ./index.theme /usr/share/icons/default/
sudo rm -rf ~/.config && sudo mv ./.config ~/
sudo mv ./Pictures ./Documents ~/

# Add User to Groups
sudo usermod -aG video voxi0
sudo usermod -aG uucp voxi0

# System Services
sudo systemctl enable sddm.service

# Reboot
reboot

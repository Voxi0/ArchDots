# Copy Dotfiles
rm -rf ./.config && cp -r ~/.config ~/Pictures ~/Documents ./                   # Home Directories
cp /usr/share/icons/default/index.theme ./.config/                              # Default Cursor Theme Config
cp /etc/default/grub ./.config/                                                 # GRUB
cp -r /usr/share/sddm/themes/TokyoNight-SDDM ./ && cp /etc/sddm.conf ./.config/ # SDDM
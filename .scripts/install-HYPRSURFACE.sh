sudo pacman -S hypridle hyprlock hyprshot hyprpolkitagent 

cd /tmp/
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S cpio cmake
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars

sudo pacman -S awww kvantum zsh hellwal cliphist

chsh -s $(which zsh)

curl -s https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
    | sudo pacman-key --add -

sudo pacman-key --finger 56C464BAAC421453
sudo pacman-key --lsign-key 56C464BAAC421453

sudo echo "
[linux-surface]
Server = https://pkg.surfacelinux.com/arch/
" >> /etc/pacman.conf

yay -S libwacom-surface

sudo pacman -Syu
sudo pacman -S linux-surface linux-surface-headers iptsd linux-firmware-intel

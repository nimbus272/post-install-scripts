echo '***** Installing Yay *****'
#refresh package cache and update system
sudo pacman -Syu --noconfirm

#install git and required base-devel tools (such as makepkg)
sudo pacman -S --noconfirm --needed base-devel git

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si --noconfirm
cd ~

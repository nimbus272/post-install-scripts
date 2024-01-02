echo '***** Installing Yay *****'
#refresh package cache and update system
pacman -Syu --noconfirm

#install git and required base-devel tools (such as makepkg)
pacman -S --noconfirm --needed base-devel git
sudo -u bebbis bash -c '\
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si --noconfirm
'

echo '***** Installing Yay *****'

SCRIPT_USER=$1

#install git and required base-devel tools (such as makepkg)
pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git /home/"$SCRIPT_USER"/yay
sudo -u "$SCRIPT_USER" bash -c "cd /home/$SCRIPT_USER/yay && makepkg -si --noconfirm"

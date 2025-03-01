echo '***** Installing Zsh, Oh-My-Zsh, and Starship *****'

PKG_MANAGER="pacman -S --noconfirm"

# Get the username of the user running the script
SCRIPT_USER=$1

# Install zsh and change default shell
$PKG_MANAGER zsh

# Install oh-my-zsh
# No config should be necessary, we will clone dotfiles later
sudo -u "$SCRIPT_USER" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

sudo -u "$SCRIPT_USER" yay -S --noconfirm starship

chsh -s /usr/bin/zsh "$SCRIPT_USER"

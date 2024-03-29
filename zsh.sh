echo '***** Installing Zsh, Oh-My-Zsh, and Starship *****'

# Determine the package manager
if [ -f "/etc/arch-release" ]; then
    PKG_MANAGER="pacman -S --noconfirm"
elif [ -f "/etc/debian_version" ]; then
    PKG_MANAGER="apt-get install -y"
elif [ -f "/etc/fedora-release" ]; then
    PKG_MANAGER="dnf install -y"
else
    echo "Unsupported distribution"
    exit 1
fi

# Get the username of the user running the script
SCRIPT_USER=$1

# Install zsh and change default shell
$PKG_MANAGER zsh

# Install oh-my-zsh
# No config should be necessary, we will clone dotfiles later
sudo -u "$SCRIPT_USER" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Install starship
if [ -f "/etc/arch-release" ]; then
    sudo -u "$SCRIPT_USER" yay -S --noconfirm starship
elif [ -f "/etc/debian_version" ]; then
    sudo -u "$SCRIPT_USER" curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
elif [ -f "/etc/fedora-release" ]; then
    $PKG_MANAGER starship
else
    echo "Unsupported distribution"
    exit 1
fi

# Install zplug
git clone https://github.com/zplug/zplug /home/"$SCRIPT_USER"/.zplug
chown -R "$SCRIPT_USER": /home/"$SCRIPT_USER"/.zplug

chsh -s /usr/bin/zsh "$SCRIPT_USER"

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

#Install zsh and change default shell
sudo -u bebbis bash -c '\
    "$PKG_MANAGER zsh"
    chsh -s $(which zsh) $(whoami)
    
    # Install oh-my-zsh
    # No config should be necessary, we will clone dotfiles later
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
    
    # Install starship
    if [ -f "/etc/arch-release" ]; then
        yay -S --noconfirm starship
    elif [ -f "/etc/debian_version" ]; then
        curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
    elif [ -f "/etc/fedora-release" ]; then
        $PKG_MANAGER starship
    else
        echo "Unsupported distribution"
        exit 1
    fi
    rm -rf ~/.zshrc
    #install zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | bash
'


echo '***** Installing Zsh, Oh-My-Zsh, and Starship *****'
#Install zsh and change default shell
sudo pacman -S --noconfirm zsh
sudo chsh -s /usr/bin/zsh bebbis
touch /home/bebbis/.zshrc

# Install oh-my-zsh
# No config should be necessary, we will clone dotfiles later
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
yay -S --noconfirm starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc

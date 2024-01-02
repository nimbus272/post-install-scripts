#setup pacman keys
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy --noconfirm archlinux-keyring

#install reflector and get faster mirrors for pacman
sudo pacman -S --noconfirm reflector rsync
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --country 'United States' --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm

#install git and clone post-install repo
sudo pacman -S --noconfirm git
git clone https://github.com/nimbus272/post-install-scripts.git ~/post-install-scripts
bash $HOME/post-install-scripts/install-all.sh

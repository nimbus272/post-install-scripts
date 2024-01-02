#setup pacman keys
pacman -Sy --noconfirm archlinux-keyring
pacman-key --init
pacman-key --populate

#install reflector and get faster mirrors for pacman
for pkg in reflector rsync; do
    if ! pacman -Qi "$pkg" &> /dev/null; then
        pacman -S --noconfirm "$pkg"
    fi
done

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --country 'United States' --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman-key --init
pacman -Syu --noconfirm

#install git and clone post-install repo
if ! command -v git &> /dev/null
then
    sudo pacman -S --noconfirm git
fi
curl -s "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/install-all.sh" | sudo bash

exec zsh
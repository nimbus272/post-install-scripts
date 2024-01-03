SCRIPT_USER=$1

#setup pacman keys
pacman-key --init
pacman-key --populate
pacman -Sy --noconfirm archlinux-keyring

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
    pacman -S --noconfirm git
fi
curl -s "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/install-all.sh" | sudo bash -s -- "$SCRIPT_USER"

if ! command -v zsh &> /dev/null
then
    echo "zsh is not installed, cannot switch to zsh shell"
    exit 1
fi
exec zsh

# Determine the package manager
if [ -f "/etc/arch-release" ]; then
    PKG_MANAGER="pacman -S --noconfirm"
    PKG_QUERY="pacman -Qi"
elif [ -f "/etc/debian_version" ]; then
    PKG_MANAGER="apt-get install -y"
    PKG_QUERY="dpkg -s"
elif [ -f "/etc/fedora-release" ]; then
    PKG_MANAGER="dnf install -y"
    PKG_QUERY="dnf list installed"
else
    echo "Unsupported distribution"
    exit 1
fi

for pkg in neofetch stow docker; do
    if ! $PKG_QUERY "$pkg" &> /dev/null; then
        $PKG_MANAGER "$pkg"
    fi
done

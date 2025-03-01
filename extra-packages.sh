PKG_MANAGER="yay -S --noconfirm"
PKG_QUERY="pacman -Qi"

for pkg in fastfetch stow docker wget eza arch-update spotify timeshift tldr trash-cli ttf-iosevka-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbos unrar unzip wezterm wl-clipboard yaak yazi zsh-syntax-highlighting nvim-lazy obsidian thefuck; do
	if ! $PKG_QUERY "$pkg" &>/dev/null; then
		$PKG_MANAGER "$pkg"
	fi
done

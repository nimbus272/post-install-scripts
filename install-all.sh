SCRIPT_USER=$1

if [ -f "/etc/arch-release" ]; then
    SCRIPT_USER=$(whoami)
fi
#Initial setup
execute_script() {
    local script_url=$1
    curl -s "$script_url" | sudo bash -- "$SCRIPT_USER"|| { echo "Execution of $script_url failed"; exit 1; }
}

# Initial setup
if [ -f "/etc/arch-release" ]; then
    echo "Arch Linux detected"
    execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/yay.sh"
fi

execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/zsh.sh"

# Now that we have zsh
execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/extra-packages.sh"
execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/get-dotfiles.sh"

exec zsh

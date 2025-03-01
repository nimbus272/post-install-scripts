SCRIPT_USER=$1

#Initial setup
execute_script() {
	local script_url=$1
	curl -s "$script_url" | sudo bash -s -- "$SCRIPT_USER" || {
		echo "Execution of $script_url failed"
		exit 1
	}
}

execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/yay.sh"

execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/zsh.sh"

# Now that we have zsh
execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/extra-packages.sh"
execute_script "https://raw.githubusercontent.com/nimbus272/post-install-scripts/main/get-dotfiles.sh"

exec zsh

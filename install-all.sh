#Initial setup
bash $HOME/post-install-scripts/yay.sh && \
bash $HOME/post-install-scripts/zsh.sh

#Now that we have zsh
zsh $HOME/post-install-scripts/extra-packages.sh && \
zsh $HOME/post-install-scripts/get-dotfiles.sh
exec zsh

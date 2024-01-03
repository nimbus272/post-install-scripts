SCRIPT_USER=$1
git clone https://github.com/nimbus272/bebfiles.git /usr/local/stow/bebfiles
stow -v -R -t /home/"$SCRIPT_USER" bebfiles

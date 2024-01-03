SCRIPT_USER=$1
git clone https://github.com/nimbus272/bebfiles.git /home/"$SCRIPT_USER"/bebfiles
chown -R "$SCRIPT_USER": /home/"$SCRIPT_USER"/bebfiles
cd /home/"$SCRIPT_USER"/bebfiles
rm -rf /home/"$SCRIPT_USER"/.zshrc
stow -v -R -t /home/"$SCRIPT_USER" .

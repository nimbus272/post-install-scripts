SCRIPT_USER=$1
git clone https://github.com/nimbus272/bebfiles.git home/"$SCRIPT_USER"/bebfiles
chown -R bebbis: home/"$SCRIPT_USER"/bebfiles
cd /home/"$SCRIPT_USER"/bebfiles
stow -v -R -t /home/"$SCRIPT_USER" /home/"$SCRIPT_USER"/bebfiles

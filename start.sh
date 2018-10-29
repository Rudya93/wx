#!/bin/bash
#before use, please run "sudo -s" and input admin password "chmod 775 start.sh", after that run exit, and run "./start.sh"
sudo apt install -y gnupg
sudo apt install -y gnupg2
read -p 'input pass: ' pass
read -p 'input git user name: ' gitusnm
read -p 'input git user email: ' gitusem
read -p 'input gerrit user name: ' gerritusnm
gpg --passphrase $pass --output init.sh --decrypt init.sh.gpg
gpg --passphrase $pass --output repo.sh --decrypt repo.sh.gpg
gpg --passphrase $pass --output conf.sh --decrypt conf.sh.gpg
echo "This script is about to run another scripts"
chmod 775 init.sh
chmod 775 repo.sh
chmod 775 conf.sh
chmod 775 rdp.sh
echo "run init"
sh ./init.sh
echo "configuration"
export gitusnm
export gitusem
export gerritusnm
sh ./conf.sh
echo "run repo"
export gerritusnm
sh ./repo.sh


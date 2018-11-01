#!/bin/bash
#before use, please run "sudo -s" and input admin password "chmod 775 start.sh", after that run exit, and run "./start.sh"
echo "before use, please run sudo -s and input admin password chmod 775 start.sh, after that run exit, and run start.sh"
sudo apt install -y gnupg
sudo apt install -y gnupg2
read -p 'input pass: ' pass
echo "###################"
read -p 'input git user name: ' gitusnm
echo "###################"
read -p 'input git user email: ' gitusem
gpg --passphrase $pass --output init.sh --decrypt init.sh.gpg
gpg --passphrase $pass --output repo.sh --decrypt repo.sh.gpg
gpg --passphrase $pass --output conf.sh --decrypt conf.sh.gpg
echo "###################"
echo "This script is about to run another scripts"
echo "###################"
chmod 775 init.sh
chmod 775 repo.sh
chmod 775 conf.sh
echo "run init"
sh ./init.sh
echo "###################"
echo "configuration"
echo "###################"
export gitusnm
export gitusem
sh ./conf.sh
echo "###################"
echo "run repo"
echo "###################"
export gitusnm
sh ./repo.sh
echo "###################"
echo "clean"
echo "###################"
rm -rf init.sh.gpg
rm -rf repo.sh.gpg
rm -rf conf.sh.gpg

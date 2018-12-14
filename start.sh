#!/bin/bash
#before use, please run "sudo -s" and input admin password "chmod 775 start.sh", after that run exit, and run "./start.sh"
echo "before use, please run sudo -s and input admin password chmod 775 start.sh, after that run exit, and run start.sh"
sudo apt install -y gnupg
sudo apt install -y gnupg2
read -p 'input pass: ' pass
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
read -p 'input git user name: ' gitusnm
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
read -p 'input git user email: ' gitusem
gpg --passphrase $pass --output init.sh --decrypt init.sh.gpg
gpg --passphrase $pass --output repo.sh --decrypt repo.sh.gpg
gpg --passphrase $pass --output conf.sh --decrypt conf.sh.gpg
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
echo -e "\e[1;32m This script is about to run another scripts \e[0m"
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
chmod 775 init.sh
chmod 775 repo.sh
chmod 775 conf.sh
echo "run init"
sh ./init.sh
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
echo -e "\e[1;32m configuration \e[0m"
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
export gitusnm
export gitusem
sh ./conf.sh
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
echo -e "\e[1;32m run repo \e[0m"
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
export gitusnm
sh ./repo.sh
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
echo -e "\e[1;32m clean \e[0m"
echo -e "\e[1;32m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \e[0m"
rm -rf init.sh.gpg
rm -rf repo.sh.gpg
rm -rf conf.sh.gpg

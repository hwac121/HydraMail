#!/bin/bash

# TITLE: HydraMail
# AUTHOR: RJ Levesque, Jr. - Majik Cat Security
# DATE: August 21, 2019
# GITHUB: https://github.com/hwac121

#===========================================#
#              CHECK FOR ROOT               #
#===========================================#

if [ "$EUID" -ne 0 ]
  then
  echo "You must run as root!"
  exit
fi

#===========================================#
#                 FUNCTIONS                 #
#===========================================#

splash(){
        echo -e "\e[36m _   _             _                               _   \e[0m"
        sleep 0.05
        echo -e "\e[36m( ) ( )           ( )            /'\_/\`\        _ (_ ) \e[0m"
        sleep 0.05
        echo -e "\e[36m| |_| | _   _    _| | _ __   _ _ |     |   _ _ (_) | | \e[0m"
        sleep 0.05
        echo -e "\e[36m|  _  |( ) ( ) /'_\` |( '__)/'_\` )| (_) | /'_\` )| | | | \e[0m"
        sleep 0.05
        echo -e "\e[36m| | | || (_) |( (_| || |  ( (_| || | | |( (_| || | | | \e[0m"
        sleep 0.05
        echo -e "\e[36m(_) (_)\`\__, |\`\__,_)(_)  \`\__,_)(_) (_)\`\__,_)(_)(___)\e[0m"
        sleep 0.05
        echo -e "\e[36m       ( )_| |                                         \e[0m"
        sleep 0.05
        echo -e "\e[36m       \`\___/'                                         \e[0m"
        sleep 0.05
        echo " "
}

credits(){
        echo -e " "
        echo -e "Developed by Majik Cat Security"
        sleep 1.5
        echo -e "Written: July of 2019"
        sleep 1.5
        echo -e " "
        echo -e "Web URL: http://www.majikcat.com"
        sleep 1.5
        echo -e "GitHub: https://github.com/hwac121"
        sleep 1.5
        echo -e "eMail: rjl@majikcat.com"
        sleep 5.0
        echo -e " "
}

#===========================================#
#         CHECKING FOR REQUIREMENTS         #
#===========================================#

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' hydra | grep "install ok installed")
echo Checking for hydra: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "hydra not installed. Attempting to install hydra now..."
  sleep 0.15
  apt-get install hydra
fi

#===========================================#
#     SET PERMISSIONS & COPY FOR GLOBAL     #
#===========================================#

clear
splash
echo " "
echo "Setting permissions for application and making global"
sleep 0.05
chmod +x hydramail.sh
sleep 0.05
cp hydramail.sh /bin/hmail
sleep 0.05
chmod +x /bin/hmail
sleep 0.05
echo " "
sleep 0.05
credits
sleep 0.05
echo " "
echo "Installation is complete!"
sleep 0.05
echo " "
echo "Type hmail anywhere in terminal to activate"
sleep 3
clear

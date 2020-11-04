#!/usr/bin/env bash

###########################################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox                            #
# Updated by Dirty Harry for crypto use...                                                                #
# This script is intended to be run like this:                                                            #
#                                                                                                         #
#  curl https://raw.githubusercontent.com/DirtyHarryDev/Yiimp-Server-Installer/master/bootstrap.sh | bash # 
#                                                                                                         #
###########################################################################################################

if [ -z "${TAG}" ]; then
	TAG=v1.0
fi


# Clone the Yiimp Server repository if it doesn't exist.
if [ ! -d $HOME/yiimpserver ]; then
	if [ ! -f /usr/bin/git ]; then
		echo Installing git . . .
		apt-get -q -q update
		DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y git < /dev/null
		echo
	fi

	echo Downloading Yiimp Server Installer ${TAG}. . .
	git clone https://github.com/DirtyHarryDev/yiimp_server_setup \
		"$HOME"/yiimpserver/install \
		< /dev/null 2> /dev/null

	echo
fi

# Start setup script.
bash $HOME/yiimpserver/install/start.sh

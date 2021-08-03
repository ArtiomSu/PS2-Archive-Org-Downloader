#!/usr/bin/env bash
SCRIPT="$(realpath $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
source $SCRIPTPATH/colours.sh

function autorun(){
	./get_urls.sh
	./converturls.sh

	echo -e "${colour_Green}do you want to create game_names.yaml for selecting games? if you have done this before press n${colour_NC}"
	read -r -p "Create and Edit games_names.yaml? [y/N] " response
	response=${response,,}    # tolower
	if [[ "$response" =~ ^(yes|y)$ ]]; then
		cp game_names.txt game_names.yaml
		vim game_names.yaml
		./build_download_urls.sh && ./download_all.sh && ./clean.sh
	else
		echo -e "${colour_Green}you have selected not to create games_name.yaml perhaps you already created it so would you like to use it to download games?${colour_NC}"
		read -r -p "Start Download? [y/N] " response
		response=${response,,}    # tolower
		if [[ "$response" =~ ^(yes|y)$ ]]; then
			./build_download_urls.sh && ./download_all.sh && ./clean.sh
		else
			echo -e"${colour_Green}you have not selected to download you can run ./build_download_urls.sh and ./download_all.sh manually when ready${colour_NC}"
		fi
	fi
}

echo -e "$colour_Blue"
echo "     #############################################"
echo "      ###########################################"
echo "      #                                         #"
echo "      #        PS2 Archive Org Downloader       #"
echo "      #        By                               #"
echo "      #        Terminal_Heat_Sink               #"
echo "      #                                         #"
echo "      #                                         #"
echo "      #                                         #"
echo "      #                                         #"
echo "      #        Press Y to begin                 #"
echo "      #                                         #"
echo "      ###########################################"
echo "      ###########                     ###########"
echo "       #########                       ######### "
echo "        #######                         #######  "
echo "     #############                   #############"
echo -e "$colour_NC"

read -r -p "" response
response=${response,,}
if [[ "$response" =~ ^(yes|y)$ ]]; then
	autorun
fi
echo "GoodBye"



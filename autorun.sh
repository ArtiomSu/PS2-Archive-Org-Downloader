#!/usr/bin/env bash

echo "Getting all urls"
./get_urls.sh
echo "Got all urls"

echo "converting urls to file names"
./converturls.sh
echo "converting done"

echo ""
echo "do you want to create game_names.yaml for selecting games? if you have done this before press n"
read -r -p "Create and Edit games_names.yaml? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]; then
	cp game_names.txt game_names.yaml
	vim game_names.yaml
	./build_download_urls.sh && ./download_all.sh && ./clean.sh
else
	echo "you have selected not to create games_name.yaml perhaps you already created it so would you like to use it to download games?"
	read -r -p "Start Download? [y/N] " response
	response=${response,,}    # tolower
	if [[ "$response" =~ ^(yes|y)$ ]]; then
		./build_download_urls.sh && ./download_all.sh && ./clean.sh
	else
		echo "you have not selected to download you can run ./build_download_urls.sh and ./download_all.sh manually when ready"
	fi

fi



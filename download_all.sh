#!/usr/bin/env bash

SCRIPT="$(realpath $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
source $SCRIPTPATH/colours.sh

counter=0
echo -e "$colour_LightBlue"
while read p; do
	(( counter++ ))
	echo -en "${counter}.\t"
	echo "$p" | cut -d '/' -f6 | sed 's/%20/ /g' | sed "s/%27/'/g" | sed 's/%28/(/g' | sed 's/%29/)/g' | sed 's/%2C/,/g' | sed 's/%26/\&/g' | sed 's/%21/!/g' | sed 's/%23/#/g'
done <download_urls.txt
echo -e "$colour_NC"

echo -e "${colour_Green}Will be downloading $counter games listed above${colour_NC}"
read -r -p "Are you sure? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]; then
	while read p; do
		echo -e "${colour_LightPurple}Downloading $p ${colour_NC}"
  		./download.sh $p
  		echo -e "${colour_LightPurple}Done Downloading $p ${colour_NC}"
	done <download_urls.txt
fi

#!/usr/bin/env bash
SCRIPT="$(realpath $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
source $SCRIPTPATH/colours.sh

echo -e "${colour_Green}Downloading Urls Part 1${colour_NC}"
curl -s https://archive.org/download/RedumpSonyPS2NTSCU | grep "<a href=" | grep ".7z" | cut -d "\"" -f2 > urls.txt
awk '{print "https://archive.org/download/RedumpSonyPS2NTSCU/" $0}' urls.txt > urlss
mv urlss urls.txt
echo -e "${colour_Green}Done${colour_NC}"

echo -e "${colour_Green}Downloading Urls Part 2${colour_NC}"
curl -s https://archive.org/download/RedumpSonyPS2NTSCUPart2 | grep "<a href=" | grep ".7z" | cut -d "\"" -f2 > urls2.txt
awk '{print "https://archive.org/download/RedumpSonyPS2NTSCUPart2/" $0}' urls2.txt > urlss
mv urlss urls2.txt
echo -e "${colour_Green}Done${colour_NC}"

cat urls.txt urls2.txt > all_urls.txt

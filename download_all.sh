#!/usr/bin/env bash

while read p; do
	echo "$p" | cut -d '/' -f6 | sed 's/%20/ /g' | sed "s/%27/'/g" | sed 's/%28/(/g' | sed 's/%29/)/g' | sed 's/%2C/,/g' | sed 's/%26/\&/g'
done <download_urls.txt

echo "will be downloading all above"
read -r -p "Are you sure? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]; then
	while read p; do
		echo "downloading $p"
  		./download.sh $p
	done <download_urls.txt
fi

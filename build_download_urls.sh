#!/usr/bin/env bash

url="https://archive.org/download/RedumpSonyPS2NTSCU/"
url2="https://archive.org/download/RedumpSonyPS2NTSCUPart2/"
rm -f download_urls.txt
skip_tracker=0
while read p; do
        if [[ $p =~ "MLB 06 - The Show (USA).7z" ]]; then
		(( skip_tracker ++ ))
		if [[ $skip_tracker -eq 2 ]]; then
			url=$url2
		fi
	fi
        if [[ ! $p =~ ^# ]]; then
		echo -n "$url" >> download_urls.txt
                echo "$p" | cut -d '/' -f6 | sed 's/ /%20/g' | sed "s/'/%27/g" | sed 's/(/%28/g' | sed 's/)/%29/g' | sed 's/,/%2C/g' | sed 's/\&/%26/g' | sed 's/!/%21/g' | sed 's/#/%23/g' >> download_urls.txt
        fi
done <game_names.yaml

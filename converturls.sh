#!/usr/bin/env bash

rm -f game_names.txt
while read p; do
	echo -n "#" >> game_names.txt
	echo "$p" | cut -d '/' -f6 | sed 's/%20/ /g' | sed "s/%27/'/g" | sed 's/%28/(/g' | sed 's/%29/)/g' | sed 's/%2C/,/g' | sed 's/%26/\&/g' | sed 's/%21/!/g' | sed 's/%23/#/g' >> game_names.txt
done <all_urls.txt

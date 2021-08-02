#!/usr/bin/env bash

curl https://archive.org/download/RedumpSonyPS2NTSCU | grep "<a href=" | grep ".7z" | cut -d "\"" -f2 > urls.txt
awk '{print "https://archive.org/download/RedumpSonyPS2NTSCU/" $0}' urls.txt > urlss
mv urlss urls.txt

curl https://archive.org/download/RedumpSonyPS2NTSCUPart2 | grep "<a href=" | grep ".7z" | cut -d "\"" -f2 > urls2.txt
awk '{print "https://archive.org/download/RedumpSonyPS2NTSCUPart2/" $0}' urls2.txt > urlss
mv urlss urls2.txt

cat urls.txt urls2.txt > all_urls.txt

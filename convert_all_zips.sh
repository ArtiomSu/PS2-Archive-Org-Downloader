#!/usr/bin/env bash
minimumsize=5
for file in *.7z; do
        size=$(wc -c <"$file")
        if [ $size -ge $minimumsize ]; then
                ./convert_zip.sh "$file"
                if gzip -t "./extracted_isos/$file/${file}.gz"; then
                        rm "$file" && touch "$file"
                else
                        echo 'file is corrupt'
                fi
        else
                echo "$file is done"
        fi
done
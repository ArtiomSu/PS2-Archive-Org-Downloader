# PS2-Archive-Org-Downloader

Bash script for easily downloading ps2 games from archive.org. Script won't download already downloaded files so its safe to update the yaml file and rerun.

# Dependancies
1. `axel` downloader used to speed up the downloads from archive.org available in repos `apt get install axel`.
2. `bash` and other basic linux comandline tools that should already be installed.

# Interactive
Run `./autorun.sh` for an interactive session. Ok for first time use but I recommend manually calling scripts later on.

# Manual
1. `./get_urls.sh` will download the download links from archive.org into `urls.txt`, `urls2.txt` and `all_urls.txt`
2. `./convert_urls.sh` will convert `all_urls.txt` into a readable file `game_names.txt`
3. `cp game_names.txt game_names.yaml` and edit `game_names.yaml` by uncommenting what games you want to download. when finished make a backup of `game_names.yaml` just incase you use the `autorun.sh` script later on and accidentally press y when it asks you to create a `game_names.yaml` file.
4. `./build_download_urls.sh` this will convert `game_names.yaml` back to proper urls and save the output to `download_urls.txt`
5. Finally `./download_all.sh` will download everything from `download_urls.txt`

# Config
You can edit `download.sh` to your liking as it is just a wrapper for axel. As is axel will use a random user agent each time it downloads, it will use 6 connections per download by default as I had issues with 10 on archive.org. It will also skip already downloaded files so you can safely rerun the script without it downloading everything again. And it will use an alternative graph so that it doesnt spam the display like the default one.

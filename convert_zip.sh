#!/usr/bin/env bash

mkdir -p "./extracted_isos/$1" && 7za e -y "$1" -o"./extracted_isos/$1/" && cd "./extracted_isos/$1" && pigz -9 * && mv * "./${1}.gz"
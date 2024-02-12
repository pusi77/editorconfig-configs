#!/bin/bash

REPO="https://raw.githubusercontent.com/pusi77/editorconfig-configs/main"

if [ -z "$1" ]; then
    echo "Usage: sh <(curl -s ${REPO}/downloader.sh) <programming_language|list>"
    exit 1
fi

list_configs() {
    echo "Supported configs:"
    echo "> cdk"
    
}

if [ "$1" == "list" ]; then
    list_configs
    exit 0
fi

lang="$1"
file_path="${lang}/.editorconfig"
raw_url="${REPO}/${file_path}"

curl -O -L -s "${raw_url}"

if [ $? -eq 0 ]; then
    echo ".editorconfig file for ${lang} downloaded successfully."
else
    echo "Failed to download .editorconfig file for ${lang}. Please make sure the language folder exists in the repository."
fi

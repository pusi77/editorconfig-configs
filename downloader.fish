#!/bin/fish

set REPO "https://raw.githubusercontent.com/pusi77/editorconfig-configs/main"

if test -z $argv[1]
    echo "Usage: sh (curl -s "$REPO/downloader.sh") <programming_language|list>"
    exit 1
end

# Function to list supported programming languages
function list_configs
    echo "Supported programming languages:"
    echo "> cdk"
end

if test $argv[1] = "list"
    list_configs
    exit 0
end

set lang $argv[1]
set file_path "$lang/.editorconfig"
set raw_url "$REPO/$file_path"

curl -O -L -s $raw_url

if test $status -eq 0
    echo ".editorconfig file for $lang downloaded successfully."
else
    echo "Failed to download .editorconfig file for $lang. Please make sure the language folder exists in the repository."
end

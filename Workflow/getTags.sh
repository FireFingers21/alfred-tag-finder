#!/bin/zsh --no-rcs

echo '{"items": ['

while IFS= read -r tag; do
tagCount=$(echo ${tag} | awk '{ print $1 }')
tagName=$(echo ${tag} | awk '{ print $2 }')

[[ ${tagCount} -eq 1 ]] && plural="file" || plural="files"

echo '{
    "uid": "'"${tagName}"'",
    "title": "'"${tagName}"'",
    "subtitle": "'"${tagCount}"' '"${plural}"'",
    "arg": "'"${tagName}"'",
    "mods": {
        "shift": { "valid": false }
    }
},'
done <<< "$(tag --usage)"

echo ']}'
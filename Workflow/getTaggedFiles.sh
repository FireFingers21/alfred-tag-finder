#!/bin/zsh --no-rcs

echo '{"items": ['

while IFS= read -r file; do
fileName=$(basename "${file}")
[[ "${showIcons}" == 0 || -d "${file}" ]] && iconType="fileicon" || iconType=""
echo '{
    "uid": "'"${file}"'",
    "title": "'"${fileName}"'",
    "subtitle": "'"${file}"'",
    "arg": "'"${file}"'",
    "quicklookurl": "'"${file}"'",
    "icon": {
        "type": "'"${iconType}"'",
        "path": "'"${file}"'"
    }
},'
done <<< "$(mdfind "kMDItemUserTags == '${1}'")"

echo ']}'
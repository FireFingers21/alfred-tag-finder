#!/bin/zsh --no-rcs

echo '{"items": ['

while IFS= read -r file; do
fileName=$(basename "${file}")
mimeType=$(file -b --mime-type "${file}")

[[ "${useFilePath}" == 1 ]] && searchFilter="${file}" || searchFilter="${fileName}"
[[ "${showIcons}" == 0 || "${mimeType}" != *"image/"* && "${mimeType}" != *"/pdf"* ]] && iconType="fileicon" || iconType=""

echo '{
    "uid": "'"${file}"'",
    "title": "'"${fileName}"'",
    "subtitle": "'"${file}"'",
    "arg": "'"${file}"'",
    "quicklookurl": "'"${file}"'",
    "match": "'"${searchFilter}"'",
    "icon": {
        "type": "'"${iconType}"'",
        "path": "'"${file}"'"
    }
},'
done <<< "$(mdfind "kMDItemUserTags == '${1}'")"

echo ']}'
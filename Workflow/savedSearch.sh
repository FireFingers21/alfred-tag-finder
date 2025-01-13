#!/bin/zsh --no-rcs

mkdir -p "${alfred_workflow_cache}"

# Create Smart Search folder for specified tag
[[ -f "${alfred_workflow_cache}/${1}.savedSearch" ]] || echo -n '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CompatibleVersion</key>
	<integer>1</integer>
	<key>RawQuery</key>
	<string>(kMDItemUserTags = "'"${1}"'"cd)</string>
	<key>RawQueryDict</key>
	<dict>
		<key>FinderFilesOnly</key>
		<false/>
		<key>RawQuery</key>
		<string>(kMDItemUserTags = "'"${1}"'"cd)</string>
		<key>SearchScopes</key>
		<array>
			<string>kMDQueryScopeComputer</string>
		</array>
		<key>UserFilesOnly</key>
		<true/>
	</dict>
	<key>SearchCriteria</key>
	<dict>
		<key>FXCriteriaSlices</key>
		<array>
			<dict>
				<key>criteria</key>
				<array>
					<string>kMDItemUserTags</string>
					<integer>103</integer>
					<integer>104</integer>
				</array>
				<key>displayValues</key>
				<array>
					<string>Tags</string>
					<string>is</string>
					<string>'"${1}"'</string>
				</array>
				<key>rowType</key>
				<integer>0</integer>
				<key>subrows</key>
				<array/>
			</dict>
		</array>
		<key>FXScope</key>
		<integer>1396925814</integer>
		<key>FXScopeArrayOfPaths</key>
		<array>
			<string>kMDQueryScopeComputer</string>
		</array>
	</dict>
	<key>SuggestedAttributes</key>
	<array/>
</dict>
</plist>' > "${alfred_workflow_cache}/${1}.savedSearch"

# Open Smart Search folder in Finder
open -b "com.apple.finder" "${alfred_workflow_cache}/${1}.savedSearch"
#!/bin/bash

command -v jq >/dev/null 2>&1 || {
    echo "jq 未安装! 退出!"
    exit 1
}
#Check the update of MAA core.
url="https://api.github.com/repos/MaaAssistantArknights/MaaAssistantArknights/releases/latest"
response=$(curl -s $url)
latest_version=$(echo "$response"|jq -r .tag_name)
if [ "$latest_version" == null ]; then
  echo Github api limit,exit...
  exit 1
fi
current_version=$(grep '^_pkgver' PKGBUILD|awk -F '=' '{print $2}')
if [ "$current_version" == "$latest_version" ]; then
  echo "No updates needed"
  exit 0
fi

#Replace the PKGBUILD file detail with newset version number and hash sum of the file.
file_name="MAA-$latest_version-linux-x86_64.tar.gz"
release_url="https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases/download/$latest_version/$file_name" 
ls "$file_name"||wget "$release_url"
md5sum=$(md5sum "$file_name"|awk -F ' ' '{print $1}')
sed -i "s/^_pkgver=.*/_pkgver=${latest_version}/" PKGBUILD
sed -i "s/^md5sums=.*/md5sums=('${md5sum}')/" PKGBUILD

#Add and commit the modifications to Github.

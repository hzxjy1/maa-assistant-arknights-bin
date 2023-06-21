#!/bin/bash

url="https://api.github.com/repos/MaaAssistantArknights/MaaAssistantArknights/releases/latest"
latest_version=$(curl -s $url|grep 'tag_name'| awk -F '"' '{print $4}')
current_version=$(grep '^_pkgver' PKGBUILD|awk -F '=' '{print $2}')
if [ "$current_version" == "$latest_version" ]; then
  exit
fi
file_name="MAA-$latest_version-linux-x86_64.tar.gz"
release_url="https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases/download/$latest_version/$file_name" 
ls "$file_name"||wget "$release_url"
md5sum=$(md5sum "$file_name"|awk -F ' ' '{print $1}')
sed -i "s/^_pkgver=.*/_pkgver=${latest_version}/" PKGBUILD
sed -i "s/^md5sums=.*/md5sums=('${md5sum}')/" PKGBUILD

#!/usr/bin/env /bin/bash
set -euo pipefail

version=$(curl --silent "https://api.github.com/repos/weavejester/cljfmt/tags" | jq -r '.[0].name')

curl --show-error --fail -sLO "https://github.com/weavejester/cljfmt/releases/download/$version/cljfmt-$version-linux-amd64-static.tar.gz"
curl --show-error --fail -sLO "https://github.com/weavejester/cljfmt/releases/download/$version/cljfmt-$version-darwin-aarch64.tar.gz"
curl --show-error --fail -sLO "https://github.com/weavejester/cljfmt/releases/download/$version/cljfmt-$version-darwin-amd64.tar.gz"

linux="cljfmt-$version-linux-amd64-static.tar.gz"
macos_arm="cljfmt-$version-darwin-aarch64.tar.gz"
macos_amd="cljfmt-$version-darwin-amd64.tar.gz"
linux_sha=$(sha256sum "$linux" | cut -f 1 -d " ")
macos_amd_sha=$(sha256sum "$macos_amd" | cut -f 1 -d " ")
macos_arm_sha=$(sha256sum "$macos_arm" | cut -f 1 -d " ")

sed -e "s/\${i}/1/" -e "s/\${VERSION}/$version/g" \
    -e "s/\${LINUX_SHA}/$linux_sha/g" \
    -e "s/\${MACOS_ARM_SHA}/$macos_arm_sha/g" \
    -e "s/\${MACOS_AMD_SHA}/$macos_amd_sha/g" \
    templates/cljfmt.template.rb > Formula/cljfmt.rb

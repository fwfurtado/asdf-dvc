#!/usr/bin/env bash

set -eo pipefail
echo "$(dirname $0)"

GH_REPO="https://github.com/iterative/dvc"
curl_opt=("-fSL")

if test -n "$GITHUB_API_TOKEN"; then
  curl_opt+=("-H" "'Authorization: token $GITHUB_API_TOKEN'")
fi


download() {

  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail $install_path "asdf-dvc supports release installs only"
  fi

  echo "Downloading DVC $version..."

  local filename=$(filename $version)
  local url="$GH_REPO/releases/download/${version}/${filename}"
  
  curl "${curl_opt[@]}" --output "$install_path/$filename" -C - "$url" || fail $install_path "Could not download $url"

  echo "Download completed"
}

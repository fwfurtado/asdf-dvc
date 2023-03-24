#!/usr/bin/env bash

set -eo pipefail

filename() {
  local version="$1"
  local architecture
  local suffix



  case "$(uname -s)" in
    Darwin*) echo "dvc-${version}.pkg" ;;
    Linux*) echo "dvc_${version}_amd64.deb" ;;
    *) echo "unsupported" ;;
  esac
}

#!/usr/bin/env bash

set -eo pipefail

filename() {
  local version="$1"
  local architecture
  local suffix

  case "$(uname -m)" in
    x86_64 | x86-64 | x64 | amd64) architecture="amd64" ;;
    *) ;;
  esac

  case "$(uname -s)" in
    Darwin*) suffix=".pkg" ;;
    Linux*) suffix="_${architecture}.deb" ;;
    *) ;;
  esac

  echo "dvc_${version}${suffix}"
}

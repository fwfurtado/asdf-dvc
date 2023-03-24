#!/usr/bin/env bash

set -eo pipefail

fail() {
  local to_be_removed=$1
  shift 
  echo -e "\e[31mFail:\e[m $*"
  
  if [[ -d $to_be_removed ]]; then
    rm -rf "$to_be_removed/{*,.*}"
  fi

  exit 1
}

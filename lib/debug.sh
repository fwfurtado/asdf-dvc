#!/usr/bin/env bash

set -eo pipefail

debug() {

  if is_debug; then
    echo -e "\e[44masdf dvc: [debug] $*\e[m"
  fi
}

is_debug() {

  if [[ "$ASDF_DVC_DEBUG" == "true" ]]; then
    return 0
  fi

  return 1
}

fail() {
  echo -e "\e[31mFail:\e[m $*"
  exit 1
}

#!/usr/bin/env bash

set -eo pipefail

source "$(dirname "$0")/../lib/error_handling.sh"
source "$(dirname "$0")/../lib/platform.sh"
source "$(dirname "$0")/../lib/debug.sh"
source "$(dirname "$0")/../lib/download.sh"
source "$(dirname "$0")/../lib/install.sh"


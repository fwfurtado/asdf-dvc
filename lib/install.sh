#!/usr/bin/env bash

set -eo pipefail

install() {
	
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  debug "installation type: $install_type"
  debug "installation version: $version" 
  debug "installation path: $install_path"
  debug "content of installation path:"
  
  if is_debug; then 
    ls -l $install_path
  fi

  if [ "$install_type" != "version" ]; then
    fail "asdf-dvc supports release installs only"
  fi

  echo "Installing DVC $version..."
    

    case "$(uname -s)" in
      Darwin*) install_darwin $version $install_path ;;
      Linux*) install_linux $version $install_path ;;
      *) fail $1 "Unsupported platform" ;;
    esac

  echo "Installation completed"

  if is_debug; then 
    ls -l $ASDF_INSTALL_PATH/bin
  fi
}

install_linux() {
  local version="$1"
  local install_path="$2"
  local download_path="$ASDF_DOWNLOAD_PATH"
  local filename="$download_path/$(filename $version)"
  
  (
    cd $download_path
    ar x $filename
    tar xf data.tar.gz

    if is_debug; then
      ls -l
    fi

    cp -r ./usr/bin $install_path
    cp -r ./usr/lib $install_path
  )
}


install_darwin() {
  local version="$1"
  local install_path="$2"
  local download_path="$ASDF_DOWNLOAD_PATH"
  local filename="$download_path/$(filename $version)"

  (
    mkdir -p $install_path/{bin,lib}
    cd $download_path
    xar -xf $filename
    tar xzf Payload
    cp -r ./usr/local/lib $install_path/lib      
    ln -sf ../lib/dvc/dvc $install_path/bin/dvc
  )

}
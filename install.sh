#!/bin/bash

set -eu

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

# Download zipped installer
curl -LSfs -o ${tempfile} https://github.com/koki-sato/dotfiles/archive/master.zip

# Unzip installer into workspace
unzip -oq ${tempfile} -d ${workspace}

cp -r ${workspace}/dotfiles-master/home $HOME

# Cleanup
rm -rf ${tempfile} ${workspace}

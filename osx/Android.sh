#!/bin/bash

set -u

export PLATFORM="Android"
export HOST_PLATFORM="MacOSX"
export BOOST_ARCH="arm"
export ARCH_NAME="gcc-arm"
export HOST_ARG="--host=arm-linux-androideabi"
source $(dirname "$BASH_SOURCE")/settings.sh

if [[ "${CXX11:-false}" == false ]]; then
  export CXX11=false
fi

# ADT to actually run and test the binaries
# http://dl.google.com/android/adt/adt-bundle-mac-x86_64-20130729.zip
# http://dl.google.com/android/adt/adt-bundle-mac-x86_64-20130917.zip
ADT_BUNDLE="${ROOTDIR}/adt-bundle-mac"
PATH="${ADT_BUNDLE}/sdk/tools:${ADT_BUNDLE}/sdk/platform-tools":${PATH}

function run {
  emulator -avd Phone & ddms
}
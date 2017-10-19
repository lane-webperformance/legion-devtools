#!/bin/bash

SCRIPTS="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
HERE=$PWD
PACKAGES=("legion-control" "legion-io" "legion-metrics" "legion-obstacle-course" "legion-core" "legion-capture" "legion-instrument" "legion" "legion-io-proxy" "legion-io-delay" "legion-selenium-webdriver" "legion-io-fetch" "legion-starter-pack")

for i in "${PACKAGES[@]}"; do
  if [ -d "$i" ]; then
    echo "examining $i"
    cd "$i"
    if [ -f "package.json" ]; then
      ("../bin/update.bash" $1) || exit 1
    fi
    cd "$HERE"
  fi
done

#!/bin/bash

here=$PWD

for i in *; do
  if [ -d "$i" ]; then
    echo "examining $i"
    cd "$i"
    if [ -f "package.json" ]; then
      ("$@")
    fi
    cd "$here"
  fi
done

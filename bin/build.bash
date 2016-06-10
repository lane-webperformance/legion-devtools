#!/bin/bash

here=$PWD

for i in *; do
  if [ -d "$i" ]; then
    cd "$i"
    if [ -f "package.json" ]; then
      echo "Building $i . . ."
      npm install || exit 1
    fi
    cd "$here"
  fi
done

for i in *; do
  if [ -d "$i" ]; then
    cd "$i"
    if [ -f "package.json" ]; then
      echo "Testing $i . . ."
      npm test || exit 1
    fi
    cd "$here"
  fi
done

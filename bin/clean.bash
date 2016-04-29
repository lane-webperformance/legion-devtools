#!/bin/bash

here=$PWD

for i in *; do
  echo "examining $i"
  if [ -d "$i" ]; then
    cd "$i"
    if [ -d "node_modules" ]; then
      echo "Cleaning $i . . ."
      npm run clean
    fi
    cd "$here"
  fi
done

#!/bin/bash

if [ -d "$1" ]; then
  echo "$1 already exists."
else
  git clone "https://github.com/lane-webperformance/$1.git"
fi

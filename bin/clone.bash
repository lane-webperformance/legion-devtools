#!/bin/bash

if [ -z "$1" ]; then
  git clone "https://github.com/lane-webperformance/legion.git" &&
  git clone "https://github.com/lane-webperformance/legion-io.git" &&
  git clone "https://github.com/lane-webperformance/legion-instrument.git" &&
  git clone "https://github.com/lane-webperformance/legion-metrics.git" &&
  git clone "https://github.com/lane-webperformance/legion-io-fetch.git" &&
  exit 0

  exit 1
fi

if [ -d "$1" ]; then
  echo "$1 already exists." && exit 0
else
  git clone "https://github.com/lane-webperformance/$1.git" && exit 0
fi

exit 1

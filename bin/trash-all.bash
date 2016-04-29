#!/bin/bash

TRASHDIR="trash-`date +%Y-%m-%d-%H-%M-%S`"

mkdir "./$TRASHDIR" &&
mv ./legion* "./$TRASHDIR"

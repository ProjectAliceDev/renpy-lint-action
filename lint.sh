#!/bin/sh

sdk_name=renpy-$1-sdk
if [ "$(ls -A ../renpy)" ]; then
  echo "Cached copy of sdk found. No additional downloading required."
else
  echo "Downloading the specified SDK (${sdk_name})..."
  wget https://www.renpy.org/dl/$1/${sdk_name}.tar.bz2
  clear

  echo "Downloaded SDK version (${sdk_name})."
  echo "Setting up the specified SDK (${sdk_name})..."
  tar -xf ./${sdk_name}.tar.bz2
  rm ./${sdk_name}.tar.bz2
  mv ./${sdk_name} ../renpy
fi

echo "Linting the project at $2..."
rm -rf game/README.html
../renpy/renpy.sh $2 lint

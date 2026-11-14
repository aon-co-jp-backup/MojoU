#!/usr/bin/env sh
# MojoU for Android (aarch64): run from Termux, or push with adb:
#   adb push mojou /data/local/tmp/ && adb shell chmod 755 /data/local/tmp/mojou && adb shell /data/local/tmp/mojou --version
# In Termux:  ./install.sh   (installs to $PREFIX/bin)
set -eu
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="${PREFIX:-$HOME/.local}/bin"
mkdir -p "$DEST"
install -m 755 "$HERE/mojou" "$DEST/mojou"
echo "Installed mojou to $DEST"; "$DEST/mojou" --version

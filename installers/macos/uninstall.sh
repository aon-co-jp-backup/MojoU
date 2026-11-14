#!/usr/bin/env sh
PREFIX="${1:-$HOME/.local}"
rm -f "$PREFIX/bin/mojou"; rm -rf "$PREFIX/share/mojou"; echo "mojou removed from $PREFIX"

#!/usr/bin/env sh
# MojoU installer for Linux (x86_64 / aarch64). Usage: ./install.sh [--prefix DIR]   (default: ~/.local, no root needed)
set -eu
PREFIX="${HOME}/.local"
[ "${1:-}" = "--prefix" ] && PREFIX="$2"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$PREFIX/bin" "$PREFIX/share/mojou/examples"
install -m 755 "$HERE/mojou" "$PREFIX/bin/mojou"
[ -d "$HERE/examples" ] && cp -r "$HERE/examples/." "$PREFIX/share/mojou/examples/"
echo "Installed mojou to $PREFIX/bin  (add it to PATH if needed:  export PATH=\"$PREFIX/bin:\$PATH\")"
"$PREFIX/bin/mojou" --version

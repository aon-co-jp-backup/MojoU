#!/usr/bin/env sh
# MojoU installer for macOS (Intel / Apple silicon). Usage: ./install.sh [--prefix DIR]   (default: ~/.local, no admin needed)
set -eu
PREFIX="${HOME}/.local"
[ "${1:-}" = "--prefix" ] && PREFIX="$2"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$PREFIX/bin" "$PREFIX/share/mojou/examples"
install -m 755 "$HERE/mojou" "$PREFIX/bin/mojou"
xattr -d com.apple.quarantine "$PREFIX/bin/mojou" 2>/dev/null || true   # downloaded, unsigned binary
[ -d "$HERE/examples" ] && cp -R "$HERE/examples/." "$PREFIX/share/mojou/examples/"
echo "Installed mojou to $PREFIX/bin  (add it to PATH if needed:  export PATH=\"$PREFIX/bin:\$PATH\")"
"$PREFIX/bin/mojou" --version

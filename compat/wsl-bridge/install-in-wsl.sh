#!/usr/bin/env bash
# Runs inside WSL: installs pixi and a Mojo project at ~/.mojow (nightly channel; override with MOJOW_CHANNEL).
set -euo pipefail
export PATH="$HOME/.pixi/bin:$PATH"
command -v curl >/dev/null || { echo "curl is required (sudo apt install curl)"; exit 1; }
command -v pixi >/dev/null || curl -fsSL https://pixi.sh/install.sh | bash
export PATH="$HOME/.pixi/bin:$PATH"
P="$HOME/.mojow"
CH="${MOJOW_CHANNEL:-https://conda.modular.com/max-nightly}"
if [ ! -f "$P/pixi.toml" ]; then
  pixi init "$P" -c "$CH" -c conda-forge
  pixi add --manifest-path "$P/pixi.toml" mojo
fi
pixi run --manifest-path "$P/pixi.toml" mojo --version

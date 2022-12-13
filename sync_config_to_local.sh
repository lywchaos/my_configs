#!/bin/bash
set -xeuo pipefail

P0=${BASH_SOURCE[0]:-$0}
BASEDIR=$(dirname -- "$P0")
ROOT=$(realpath "$BASEDIR")

cp "${ROOT}/.tmux.conf" ~/.tmux.conf
cp "${ROOT}/.zshrc" ~/.zshrc

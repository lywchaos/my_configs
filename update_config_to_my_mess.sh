#!/bin/bash

set -xeuo pipefail

P0=${BASH_SOURCE[0]:-$0}
BASEDIR=$(dirname -- "$P0")
ROOT=$(realpath "$BASEDIR")

cp ~/.tmux.conf "${ROOT}/.tmux.conf"
cp ~/.zshrc "${ROOT}/.zshrc"

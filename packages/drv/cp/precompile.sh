#!/usr/bin/env bash

set -e

TARGET_DIR="$HOME/.config/scripts/bits"
mkdir -p "$TARGET_DIR"

echo ":: Getting path to stdc++.h ::"
BASE_PATH=$(nix eval --raw nixpkgs#gcc.cc)/include/c++/
GCC_PATH=$(find "$BASE_PATH" -type f -path "*/x86_64-unknown-linux-gnu/bits/stdc++.h")

if [ ! -f "$GCC_PATH" ]; then
    echo ":: Could not find bits/stdc++.h in GCC package ::"
    exit 1
fi

echo ":: Found bits/stdc++.h at: $GCC_PATH ::"

echo ":: Precompiling ::"
g++ -x c++-header "$GCC_PATH" -fsanitize=address,undefined -std=c++20 -O2 -o "$TARGET_DIR/stdc++.h.gch"

echo ":: Precompiled header saved to $TARGET_DIR/stdc++.h.gch ::"

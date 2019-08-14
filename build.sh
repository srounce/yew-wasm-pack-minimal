#!/usr/bin/env sh

set -e

TARGET_ARG=$1
TARGET=${TARGET_ARG:=web}

FORMAT_ARG=$2
FORMAT=${FORMAT_ARG:=iife}

echo "Using target \`${TARGET}\`"
echo "Using format \`${FORMAT}\`"

wasm-pack build -t $TARGET
rollup ./src/index --file ./pkg/bundle.js --format $FORMAT
mkdir -p dist
cp -v pkg/*.wasm dist/
cp -rv static/* dist/
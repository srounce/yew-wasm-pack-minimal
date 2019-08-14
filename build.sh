#!/usr/bin/env sh

wasm-pack build -t web && rollup ./src/index.js --file ./dist/bundle.js --format cjs
mkdir -p dist
cp -v pkg/*.wasm dist/
cp -rv static/* dist/
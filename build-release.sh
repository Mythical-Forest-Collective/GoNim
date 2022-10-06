#!/bin/sh

# Build the go library
go build -ldflags "-s -w" -buildmode c-shared -o build/libcgorand.so src/go/main.go

# Build the Nim binary
nim c --passL:build/libcgorand.so \
  --define:release                \
  --outdir:build                  \
  -o:build/main src/nim/main.nim

# Run the Nim binary
./build/main

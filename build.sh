#!/bin/sh

# Build the go library
go build -buildmode c-shared -o build/libcgorand.so src/go/main.go

# Build the Nim binary
nim c --passL:build/libcgorand.so \
  --outdir:build                  \
  -o:build/main src/nim/main.nim

# Run the Nim binary
./build/main

# Nim imports
import os

# Constants
const headerLoc = currentSourcePath().splitPath.head & "/../../build/libcgorand.h"

# Just some basic glue
proc cgoCurrentMillis(): int32 {.importc: "cgoCurrentMillis", header: headerLoc.}

proc cgoSeed(m: int32) {.importc: "cgoSeed", header: headerLoc.}

proc cgoRandom(m: int32): int {.importc: "cgoRandom", header: headerLoc.}

# Set the seed
cgoSeed(cgoCurrentMillis())

# Print the output
echo cgoRandom(10)


# Note that there's probably a better way to include headers

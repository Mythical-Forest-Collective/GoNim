package main

import "C"

import (
    "math/rand"
    "time"
)

//export cgoCurrentMillis
func cgoCurrentMillis() C.long {
    return C.long(time.Now().Unix())
}

//export cgoSeed
func cgoSeed(m C.long) {
    rand.Seed(int64(m))
}

//export cgoRandom
func cgoRandom(m C.int) C.int {
    return C.int(rand.Intn(int(m)))
}

// Empty main function since that's required
func main() {
}

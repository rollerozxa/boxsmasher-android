#!/bin/bash
# Build in RAM if your /tmp/ is mounted as tmpfs (cool!).

mkdir -p /tmp/boxsmasher_android_deps/
mkdir -p /tmp/boxsmasher_android_deps/{build,src}/
ln -sf /tmp/boxsmasher_android_deps/build build
ln -sf /tmp/boxsmasher_android_deps/src src

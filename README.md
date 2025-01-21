# Box Smasher Android project
This repository contains the project for building Box Smasher on Android.

If you just want to see the Lua code for the actual game, see [this repository](https://github.com/rollerozxa/boxsmasher) instead.

## Details
The repository is based off of [this commit of love-android](https://github.com/love2d/love-android/commit/07088eee88e6e212b05d22f2725fbd5be5feb8f6) equivalent to LÖVE 11.5, with some significant modifications.

All third-party dependencies in the love-android repository (SDL2, LuaJIT, etc.) has been replaced with some buildscripts which will download the sources and compile libraries that will then be linked against building the app. This fixes the issue in upstream LÖVE where binary blobs are present in the dependencies such as in LuaJIT.

The version of LÖVE that Box Smasher uses on Android has been cut down to remove some stuff that the game does not need, e.g. removing all image and sound formats except for PNG and Ogg Vorbis, and removing the video module along with the corresponding libtheora library. It resides [in a separate repository](https://github.com/rollerozxa/boxsmasher-android-love) and pulled in through a submodule at the root of this repository.

## Building
There are some steps to getting it built. A summary:

1. Set up an Android development environment
2. Build the dependencies in `deps/` using `./build.sh`
3. Prepare the game which will be placed in a folder in `app/src/main/assets/`
4. Build the whole app with Gradle

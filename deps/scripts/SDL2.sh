#!/bin/bash -e
sdl2_ver=2.30.9

download () {
	get_tar_archive sdl2 "https://github.com/libsdl-org/SDL/releases/download/release-${sdl2_ver}/SDL2-${sdl2_ver}.tar.gz"
}

build () {
	# SDL2
	cmake $srcdir/sdl2 "${CMAKE_FLAGS[@]}" \
		-DSDL_{SHARED,AUDIO,TEST,RENDER,VULKAN}=OFF \
		-DCMAKE_C_FLAGS="-DSDL_LEAN_AND_MEAN=1"

	make
	make_install_copy
}

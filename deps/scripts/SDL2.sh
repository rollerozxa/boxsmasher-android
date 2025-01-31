#!/bin/bash -e
sdl2_ver=2.30.9

download () {
	get_tar_archive sdl2 "https://github.com/libsdl-org/SDL/releases/download/release-${sdl2_ver}/SDL2-${sdl2_ver}.tar.gz" \
		"24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4"
}

build () {
	# SDL2
	cmake $srcdir/sdl2 "${CMAKE_FLAGS[@]}" \
		-DSDL_{SHARED,AUDIO,TEST,RENDER,VULKAN}=OFF \
		-DCMAKE_C_FLAGS="-DSDL_LEAN_AND_MEAN=1"

	make
	make_install_copy
}

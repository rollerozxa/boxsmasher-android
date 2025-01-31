#!/bin/bash -e
ver=1.23.1

download () {
	get_tar_archive openal-soft "https://github.com/kcat/openal-soft/archive/refs/tags/${ver}.tar.gz" \
		"dfddf3a1f61059853c625b7bb03de8433b455f2f79f89548cbcbd5edca3d4a4a"
}

build () {
	cmake $srcdir/openal-soft "${CMAKE_FLAGS[@]}" \
		-DLIBTYPE=STATIC -DALSOFT_BACKEND_WAVE=FALSE -DALSOFT_NO_CONFIG_UTIL=TRUE
	make

	make_install_copy
}

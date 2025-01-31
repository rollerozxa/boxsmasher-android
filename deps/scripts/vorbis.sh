#!/bin/bash -e
ogg_ver=1.3.5
vorbis_ver=1.3.7

download () {
	get_tar_archive libogg "http://downloads.xiph.org/releases/ogg/libogg-${ogg_ver}.tar.xz" \
		"c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705"
	get_tar_archive libvorbis "http://downloads.xiph.org/releases/vorbis/libvorbis-${ogg_ver}.tar.xz" \
		"54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"

	# Remove a flag that breaks the x86 build, configure adds it without checking...
	sed 's|-mno-ieee-fp||g' -i libvorbis/configure
}

build () {
	# Build libogg first
	mkdir -p libogg
	pushd libogg
	$srcdir/libogg/configure --host=$CROSS_PREFIX
	make

	make_install_copy
	popd

	OGG_CFLAGS="-I$pkgdir/include" OGG_LIBS="-L$pkgdir -logg" \
	$srcdir/libvorbis/configure --host=$CROSS_PREFIX
	make

	make_install_copy
}

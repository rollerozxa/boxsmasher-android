#!/bin/bash -e
ver=2.13.3

download () {
	get_tar_archive freetype "https://download.savannah.gnu.org/releases/freetype/freetype-${ver}.tar.xz" \
		"0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289"
}

build () {
	$srcdir/freetype/configure --host=$CROSS_PREFIX \
		--enable-static --disable-shared \
		--with-png=no \
		--with-harfbuzz=no \
		--with-bzip2=no
	make

	make_install_copy
}

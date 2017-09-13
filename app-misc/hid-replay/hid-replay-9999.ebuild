# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="HID replay - HID recorder for Linux"
HOMEPAGE="http://bentiss.github.io/hid-replay-docs/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/bentiss/hid-replay.git https://github.com/bentiss/hid-replay.git"

LICENSE="GPL v2+"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND=""

src_compile(){
	./autogen.sh
	./configure --prefix=/usr
	make
}

src_install(){
	default
}

# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="LibThai is a set of Thai language support routines"
HOMEPAGE="https://linux.thai.net/projects/libthai"

SRC_URI="https://linux.thai.net/pub/thailinux/software/libthai/libthai-${PV}.tar.xz"
KEYWORDS="~amd64 ~x86"

LICENSE="GNU LESSER GPL"
SLOT="0"
IUSE="doxygen"

RDEPEND=""
DEPEND="${RDPEND}
		doxygen? ( app-doc/doxygen )
		>=dev-libs/libdatrie-0.2.12"

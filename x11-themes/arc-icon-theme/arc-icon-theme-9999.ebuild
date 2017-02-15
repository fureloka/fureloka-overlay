# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Arc Icon Theme"
HOMEPAGE="https://github.com/horst3180/arc-icon-theme"

SRC_URI=""
EGIT_REPO_URI="https://github.com/horst3180/arc-icon-theme.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3.0"
SLOT="0"
IUSE=""

DEPEND="x11-themes/moka-icon-theme"
RDEPEND="${DEPEND}"

src_prepare() {
	default
    eautoreconf
}

src_install(){
	emake DESTDIR="${D}" install
}

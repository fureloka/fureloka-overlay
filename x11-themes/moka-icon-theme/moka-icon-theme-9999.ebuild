# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Moka is a stylized Linux desktop icon set, designed to be clear, simple and consistent."
HOMEPAGE="https://github.com/snwh/moka-icon-theme"

SRC_URI=""
EGIT_REPO_URI="https://github.com/moka-project/moka-icon-theme.git"
KEYWORDS="~x86 ~amd64"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
    eautoreconf
}

src_install(){
	emake DESTDIR="${D}" install
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools

DESCRIPTION="Icon theme"
HOMEPAGE="https://github.com/horst3180/arc-icon-theme"
SRC_URI=""
EGIT_REPO_URI="https://github.com/horst3180/arc-icon-theme.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-themes/moka-icon-theme"
RDEPEND="${DEPEND}"

src_prepare() {
    eautoreconf
}

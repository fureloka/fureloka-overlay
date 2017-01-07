# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools

DESCRIPTION="Moka is a stylized Linux desktop icon set, designed to be clear, simple and consistent."
HOMEPAGE="https://snwh.org/moka"
SRC_URI=""
EGIT_REPO_URI="https://github.com/moka-project/moka-icon-theme.git"
LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
    eautoreconf
}

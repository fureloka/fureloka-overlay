# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Freedesktop.org menu and desktop icons support for Awesome WM 4.x"
HOMEPAGE="https://github.com/copycat-killer/awesome-freedesktop"

SRC_URI=""
EGIT_REPO_URI="https://github.com/copycat-killer/awesome-freedesktop.git"

LICENSE="GNU-GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="curl"

DEPEND="
    >=x11-wm/awesome-4.0"
    
RDEPEND="${DEPEND}"

AWESOME_DIR="/usr/share/awesome/lib"

pkg_setup()
{
    if ! [ -d ${AWESOME_DIR} ]; then
        eerror "Awesome lib directory does not exist,"
        eerror "using a non standard install directory?"
        eerror "${AWESOME_DIR}"
        eerror
        die
    fi
}

src_install()
{
	dodir "${AWESOME_DIR}/freedesktop"
	cp "${S}/desktop.lua" "${D}/${AWESOME_DIR}/freedesktop/" || die
	cp "${S}/init.lua" "${D}/${AWESOME_DIR}/freedesktop/" || die
	cp "${S}/menu.lua" "${D}/${AWESOME_DIR}/freedesktop/" || die
    dodoc LICENSE README.rst
}

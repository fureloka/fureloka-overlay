# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Layouts, widgets and utilities for Awesome WM 4.x"
HOMEPAGE="https://github.com/copycat-killer/lain"

SRC_URI=""
EGIT_REPO_URI="https://github.com/copycat-killer/lain.git"

LICENSE="GNU-GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="curl"

DEPEND="
    >=x11-wm/awesome-4.0"
RDEPEND="${DEPEND}
    curl? ( net-misc/curl )"

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
    dodir "${AWESOME_DIR}/lain"
    cp -R "${S}/icons/" "${D}/${AWESOME_DIR}/lain/" || die
    cp -R "${S}/layout/" "${D}/${AWESOME_DIR}/lain/" || die
    cp -R "${S}/scripts/" "${D}/${AWESOME_DIR}/lain/" || die
    cp -R "${S}/util/" "${D}/${AWESOME_DIR}/lain/" || die
    cp -R "${S}/widget/" "${D}/${AWESOME_DIR}/lain/" || die
    cp "${S}/helpers.lua" "${D}/${AWESOME_DIR}/lain/" || die
    cp "${S}/init.lua" "${D}/${AWESOME_DIR}/lain/" || die
    dodoc LICENSE README.rst

    chmod -R 644 "${D}/${AWESOME_DIR}/lain/scripts/" || die
}
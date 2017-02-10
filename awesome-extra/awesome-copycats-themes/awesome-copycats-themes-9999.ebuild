# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="A set of themes for the Awesome window manager"
HOMEPAGE="https://github.com/copycat-killer/awesome-copycats"

SRC_URI=""
EGIT_REPO_URI="https://github.com/copycat-killer/awesome-copycats.git"
EGIT_SUBMODULES=()

LICENSE="BY-NC-SA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mpd"

DEPEND="
    >=x11-wm/awesome-4.0
    awesome-extras/lain
    awesome-extra/awesome-freedesktop
    mpd? ( media-sound/mpd )"
    
RDEPEND="${DEPEND}"

AWESOME_DIR="/usr/share/awesome"

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
	dodir "${AWESOME_DIR}/eminent"
	cp -R "${S}/eminent/" "${D}/${AWESOME_DIR}" || die
	dodir "${AWESOME_DIR}/themes"
	cp -R "${S}/themes/" "${D}/${AWESOME_DIR}" || die
	cp "${S}/rc.lua.template" "${D}/${AWESOME_DIR}" || die
    dodoc README.rst
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit gnome2

DESCRIPTION="Nautilus plugin for opening terminals in arbitrary local paths and on SSH servers"
HOMEPAGE="https://git.gnome.org/browse/nautilus-open-terminal/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    >=dev-util/intltool-0.35
    virtual/pkgconfig "

RDEPEND="${DEPEND}
	x11-libs/gtk+ "

src_prepare(){
	gnome2_src_prepare
}

src_configure(){
    gnome2_src_configure
}
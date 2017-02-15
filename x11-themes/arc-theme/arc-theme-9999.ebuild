# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 autotools

DESCRIPTION="A flat theme with transparent elements for GTK 3, GTK2 and GNOME Shell"
HOMEPAGE="https://github.com/horst3180/arc-theme"

SRC_URI=""
EGIT_REPO_URI="https://github.com/horst3180/arc-theme.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3.0"
SLOT="0"
IUSE="cinnamon +dark darker gnome +gtk2 gtk3 light mate plank transparency unity xfce"

DEPEND=" gtk3? ( >=x11-libs/gtk+-3.14:3 ) "
RDEPEND="${DEPEND}
		gtk2? ( x11-themes/gnome-themes-standard )
		x11-themes/gtk-engines-murrine "

src_prepare(){
	default
	eautoreconf
}

src_configure(){
	econf \
		$(use_enable cinnamon) \
		$(use_enable dark) \
		$(use_enable darker) \
		$(use_enable gnome gnome-shell) \
		$(use_enable gtk2) \
		$(use_enable gtk3) \
		$(use_enable light) \
		$(use_enable mate metacity) \
		$(use_enable transparency) \
		$(use_enable unity) \
		$(use_enable xfce xfwm)
}

src_install(){
	emake DESTDIR="${D}" install
	
	if use "plank"; then
		cp -r "${S}/extra/plank" "${D}/share/plank/themes/"
		chown -R root:root "${D}/share/plank/themes"
	fi
}

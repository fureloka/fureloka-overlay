# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit eutils python-single-r1

DESCRIPTION="Preparing comics and manga for your E-Ink device"
HOMEPAGE="https://kcc.iosphe.re/"
SRC_URI="https://github.com/ciromattia/kcc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC License"
SLOT="0"
KEYWORDS="~amd64 ~x86"
USE="unrar kindlegen"

RDEPEND="${PYTHON_DEPS}
	 >=dev-python/PyQt5-5.6.0
	 >=dev-python/pillow-4.0.0
	 >=dev-python/psutil-5.0.0
	 >=dev-python/python-slugify-1.2.1
	 >=dev-python/raven-6.0.0
	 unrar? ( app-arch/unrar )
	 kindlegen? (app-misc/kindlegen )
"
DEPEND=""

pkg_setup(){
	python-single-r1_pkg_setup
}

src_prepare() {
	default
	sed -i -e "s#/usr/share/kindlecomicconverter/comic2ebook.png#comic2ebook#" \
		other/linux/kindlecomicconverter.desktop || die
	sed -i -e "s#/usr/bin/kcc#kcc#" \
		other/linux/kindlecomicconverter.desktop || die
}

src_install() {
	doicon -s 256 icons/comic2ebook.png
	domenu other/linux/kindlecomicconverter.desktop

	dodoc README.md

	python_domodule kindlecomicconverter gui
	python_newscript kcc.py kcc 
	python_newscript kcc-c2e.py kcc-c2e 
	python_newscript kcc-c2p.py kcc-c2p
}
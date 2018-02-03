# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_6 )
PYTHON_REQ_USE="sqlite"

inherit eutils xdg-utils python-single-r1 versionator

MY_PV=$(delete_version_separator 3)
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

SRC_URI="https://apps.ankiweb.net/downloads/beta/${MY_P}-source.tgz"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="https://apps.ankiweb.net"

LICENSE="GPL-3"
SLOT="0"
IUSE="latex +recording +sound"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt5[svg,webengine,webchannel,${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup-4.5[${PYTHON_USEDEP}]
	dev-python/send2trash[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.7.4[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	recording? (
		media-sound/lame
		>=dev-python/pyaudio-0.2.4[${PYTHON_USEDEP}] )
	sound? ( media-video/mpv )
	latex? (
		app-text/texlive
		app-text/dvipng
	)
"
DEPEND=""

pkg_setup(){
	python-single-r1_pkg_setup
}

pkg_postinst(){
	xdg_desktop_database_update
}

pkg_postrm(){
	xdg_desktop_database_update
}

src_prepare() {
	default

	sed -i -e "s/updates=True/updates=False/" \
		aqt/profiles.py || die
}

src_configure() {
	default
}

src_compile() {
	default
}

src_install() {
	doicon ${PN}.png
	domenu ${PN}.desktop
	doman ${PN}.1

	python_domodule aqt anki web
	python_newexe runanki anki

	# Localization files go into the anki directory:
	python_moduleinto anki
	python_domodule locale
}


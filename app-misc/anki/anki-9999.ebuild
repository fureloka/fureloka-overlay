 # Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python3_5)
PYTHON_REQ_USE="sqlite"

inherit eutils python-single-r1 git-r3

DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="http://ichi2.net/anki/"
EGIT_REPO_URI="git://github.com/dae/anki.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="latex +recording +sound"

RDEPEND="${PYTHON_DEPS}
	 >=dev-python/beautifulsoup-4.4.1[python_targets_python3_5]
	 dev-python/send2trash[python_targets_python3_5]
	 >=dev-python/httplib2-0.9.2-r2[python_targets_python3_5]
	 dev-python/requests[python_targets_python3_5]
	 dev-python/sip[python_targets_python3_5]
	 recording? ( media-sound/lame
				  >=dev-python/pyaudio-0.2.9-r1[python_targets_python3_5] )
	 sound? ( media-video/mplayer )
	 latex? ( app-text/texlive
			  app-text/dvipng )"

DEPEND="${RDEPEND}
    >=dev-python/PyQt5-5.7.1[svg,webengine,webchannel,python_targets_python3_5]"

pkg_setup(){
	python-single-r1_pkg_setup
}

src_prepare() {
	sed -i -e "s/updates=True/updates=False/" \
		aqt/profiles.py || die
	default
}

# Nothing to configure
src_configure() {
	true;
}

src_compile() {
	./tools/build_ui.sh
}

src_install() {
	doicon anki.png
	domenu anki.desktop
	doman anki.1

	dodoc README.md README.development
	python_domodule aqt anki
	python_newscript runanki anki
}

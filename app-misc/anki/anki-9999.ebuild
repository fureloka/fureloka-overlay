 # Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=(python3_5)
PYTHON_REQ_USE="sqlite"

inherit eutils python-single-r1 git-r3


DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="http://ichi2.net/anki/"
EGIT_REPO_URI="git://github.com/dae/anki.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="latex +recording +sound"

RDEPEND="${PYTHON_DEPS}
	 >=dev-python/PyQt5-5.6[designer,svg,webchannel,webengine,webkit]
	 dev-python/httplib2
	 dev-python/send2trash
	 dev-python/beautifulsoup
	 dev-python/sip
	 recording? ( media-sound/lame
				  >=dev-python/pyaudio-0.2.9 )
	 sound? ( media-video/mplayer )
	 latex? ( app-text/texlive
			  app-text/dvipng )"

DEPEND=""

pkg_setup(){
	python-single-r1_pkg_setup
}

src_prepare() {
	sed -i -e "s/updates=True/updates=False/" \
		aqt/profiles.py || die
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

	dodoc README.development
	python_domodule aqt anki
	python_newscript runanki anki
}

 # Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit cmake-multilib

DESCRIPTION="Accuracy-focused XAudio reimplementation for open platforms"
HOMEPAGE="https://fna-xna.github.io/"

SRC_URI="https://github.com/FNA-XNA/FAudio/archive/${PV}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="ZLIB"
SLOT="0"
IUSE="debug ffmpeg xnasong"

RDEPEND=">=media-libs/libsdl2-2.0.9[${MULTILIB_USEDEP}]
	ffmpeg? ( media-video/ffmpeg[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}"

src_unpack() {
	default
	mv "${WORKDIR}/FAudio-${PV}" "${WORKDIR}/faudio-${PV}"
}

multilib_src_configure() {
    local mycmakeargs=(
        -DFFMPEG=$(usex ffmpeg)
        -DXNASONG=$(usex xnasong)
        -DFORCE_ENABLE_DEBUGCONFIGURATION=$(usex debug)
        -DLOG_ASSERTIONS=$(usex debug)
    )
    cmake-utils_src_configure
}

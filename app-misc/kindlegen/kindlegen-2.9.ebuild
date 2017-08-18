# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

NEW_PV="${PV/./_}"

DESCRIPTION="Command line tool for converting documents to kindle formats"
HOMEPAGE="https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211"
SRC_URI="http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v${NEW_PV}.tar.gz"

SLOT="0"
LICENSE="Amazon"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"

RESTRICT="strip mirror"

S=${WORKDIR}

rdos2unix() {
    find . -name '*'.$1 -type f -print0 | while read -d $'\0' file
    do
        edos2unix "$file" || die "Failed to convert line-endings of all .$1 files";
    done
}

src_prepare() {
	default
    rdos2unix txt
    rdos2unix html
}

src_install() {
    exeinto /opt/bin
    doexe kindlegen || die
    dodoc EULA.txt "KindleGen Legal Notices 2013-02-19 Linux.txt" docs/english/*.*
}

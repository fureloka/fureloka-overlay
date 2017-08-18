# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A Python slugify application that handles unicode"
HOMEPAGE="https://github.com/un33k/python-slugify https://pypi.python.org/pypi/python-slugify"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/unidecode[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"
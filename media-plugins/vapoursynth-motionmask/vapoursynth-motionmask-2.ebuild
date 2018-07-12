# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson

DESCRIPTION="Creates a mask of moving pixels. Every output pixel will be set to the absolute difference between the current frame and the previous frame"
HOMEPAGE="https://github.com/dubhater/vapoursynth-motionmask"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dubhater/${PN}.git"
	KEYWORDS=""
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/dubhater/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND+="
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}
	>=dev-util/meson-0.46
"
src_configure() {
	meson_src_configure  --libdir="/usr/$(get_libdir)/vapoursynth/"
}
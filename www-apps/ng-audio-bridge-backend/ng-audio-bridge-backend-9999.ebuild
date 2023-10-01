EAPI=8

EGIT_REPO_URI="https://github.com/Mord3rca/ng-audio-bridge-backend"

inherit cmake git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/Mord3rca/ng-audio-bridge-backend"

LICENSE="LGPL-3"
SLOT=0
KEYWORDS="~amd64 ~x86"

IUSE="-compat"

RDEPEND="
	dev-cpp/pistache
	dev-libs/jsoncpp
	dev-db/sqlite
"
DEPEND=""
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DNG_AUDIO_COMPATIBILITY_ENDPOINTS=$(usex compat)
	)
	cmake_src_configure
}

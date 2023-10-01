EAPI=8

EGIT_REPO_URI="https://github.com/pistacheio/pistache"
if [[ ${PV} != *9999* ]]; then
	EGIT_COMMIT="${PV}"
fi

inherit git-r3 meson-multilib

DESCRIPTION="A mordern and elegant HTTP / REST framework for C++"
HOMEPAGE="https://github.com/pistacheio/pistache"

LICENSE="Apache-2.0"
SLOT=0
KEYWORDS="~amd64 ~x86"

IUSE="deflate -doc -examples -rapidjson ssl -test"
REQUIRED_USE="test? ( rapidjson )"

RDEPEND="
	deflate? ( sys-libs/zlib )
	ssl? ( dev-lib/openssl )
	rapidjson? ( dev-libs/rapidjson )
"
DEPEND="${RDEPEND}"
BDEPEND=""

multilib_src_configure() {
	local emesonargs=(
		$(meson_use deflate PISTACHE_USE_CONTENT_ENCODING_DEFLATE)
		$(meson_use doc PISTACHE_BUILD_DOCS)
		$(meson_use examples PISTACHE_BUILD_EXAMPLES)
		$(meson_use rapidjson PISTACHE_USE_RAPIDJSON)
		$(meson_use ssl PISTACHE_USE_SSL)
		$(meson_use test PISTACHE_BUILD_TESTS)
	)
	meson_src_configure
}

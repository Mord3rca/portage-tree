EAPI=8

EGIT_REPO_URI="https://github.com/pistacheio/pistache"
if [[ ${PV} != *9999* ]]; then
	EGIT_COMMIT="v${PV}"
fi

inherit git-r3 meson-multilib

DESCRIPTION="A mordern and elegant HTTP / REST framework for C++"
HOMEPAGE="https://github.com/pistacheio/pistache"

LICENSE="Apache-2.0"
SLOT=0
KEYWORDS="~amd64 ~x86"

IUSE="brotli deflate -doc -examples -rapidjson ssl -test zstd"
REQUIRED_USE="test? ( rapidjson )"

RDEPEND="
	brotli? ( app-arch/brotli )
	deflate? ( sys-libs/zlib )
	dev-libs/libevent
	dev-libs/date
	ssl? ( dev-libs/openssl )
	rapidjson? ( dev-libs/rapidjson )
	zstd? ( app-arch/zstd )
"
DEPEND="${RDEPEND}"
BDEPEND="
	doc? ( app-text/doxygen )
	test? ( dev-cpp/gtest )
"

multilib_src_configure() {
	local emesonargs=(
		$(meson_use brotli PISTACHE_USE_CONTENT_ENCODING_BROTLI)
		$(meson_use deflate PISTACHE_USE_CONTENT_ENCODING_DEFLATE)
		$(meson_use doc PISTACHE_BUILD_DOCS)
		$(meson_use examples PISTACHE_BUILD_EXAMPLES)
		$(meson_use rapidjson PISTACHE_USE_RAPIDJSON)
		$(meson_use ssl PISTACHE_USE_SSL)
		$(meson_use test PISTACHE_BUILD_TESTS)
		$(meson_use zstd PISTACHE_USE_CONTENT_ENCODING_ZSTD)
	)
	meson_src_configure
}

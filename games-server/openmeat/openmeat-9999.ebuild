EAPI=8

EGIT_REPO_URI="https://github.com/Mord3rca/openmeat"

inherit cmake git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/Mord3rca/openmeat"

LICENSE="LGPL-3"
SLOT=0
KEYWORDS="~amd64 ~x86"

IUSE="-static -test wireshark"

RDEPEND="
	acct-user/openmeat
	test? ( dev-util/cppunit )
	wireshark? ( net-analyzer/wireshark )
"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
		-DBUILD_DISSECTOR=$(usex wireshark)
	)
	cmake_src_configure
}

src_test() {
	"${BUILD_DIR}/tests/openmeat_tests" || die "Error while running cppunit tests"
}

src_install() {
	cmake_src_install
	use static || find "${D}" -name '*.a' -exec rm {} \;
}

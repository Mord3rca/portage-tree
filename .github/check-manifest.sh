#!/bin/bash

# This recreate the wheel ... But I don't want to install portage on Ubuntu.

set -eu

if [ -v V ]; then
	set -x
fi

cd "$(dirname "${0}")/.."

die() {
	echo "Error: $1" >&2
	exit 1
}

check_blake2b() {
	local rsum=$1
	local rname=$2
	local rsize=$3
	read -r _ name size _ sum _

	[ "${name}" == "${rname}" ] || die "Name mismatch for ${rname}"
	[ "${size}" == "${rsize}" ] || die "Size mismatch for ${rname}"
	[ "${sum}" == "${rsum}" ] || die "Blake2b mismatch for ${rname}"
}

while read -r file; do
	dir=$(dirname "${file}")
	name=$(basename "${file}")
	manifest="${dir}/Manifest"
        if [[ "${name}" == *.patch ]]; then
		manifest="${dir}/../Manifest"
	fi
	read -r sum _ < <(b2sum "${file}")
	read -r _ _ size _ < <(wc "${file}")
	check_blake2b "${sum}" "${name}" "${size}"<<<"$(grep "${name}" "${manifest}")"
done < <(find . -name '*.ebuild' -or -name '*.patch')

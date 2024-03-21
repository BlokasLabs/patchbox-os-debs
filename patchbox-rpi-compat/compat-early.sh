#!/bin/bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/compat-common.sh"

rm -rf ${DST}
mkdir ${DST}

PI_TYPE=$(get_pi_type)

if [ "$PI_TYPE" = -1 ]; then
	echo "Failed detecting the Pi version! Make sure you're using up to date raspi-config!"
	exit 1
fi

touch "${DST}/on_pi${PI_TYPE}"

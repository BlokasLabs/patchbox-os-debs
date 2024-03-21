#!/bin/bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/compat-common.sh"

# Create empty files that can be used with systemd path monitoring services
# to start the correct services, according to the current system type.
if is_wayland; then
	touch "${DST}/wayland"
else
	touch "${DST}/x11"
fi

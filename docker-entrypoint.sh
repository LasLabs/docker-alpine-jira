#!/bin/sh
# Copyright 2017-TODAY LasLabs Inc.
# License Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0.html).

set -e

COMMAND=ash

# Add $COMMAND if needed
if [ "${1:0:1}" = '-' ]; then
	set -- $COMMAND "$@"
fi

# As argument is not related to $COMMAND,
# then assume that user wants to run their own process,
# for example a `bash` shell to explore this image
exec "$@"

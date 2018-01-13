#!/bin/sh
# Copyright 2017-TODAY LasLabs Inc.
# License Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0.html).

# Execute scripts in the directory on entry
DIR=/entrypoint.d

if [[ -d "${DIR}" ]]
then
  /bin/run-parts "${DIR}"
fi

# Now run the command
exec "$@"

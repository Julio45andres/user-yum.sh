#!/bin/sh
#
# em
# em.sh
# usEr-yuM
# Make based yum / rpm wrapper to insatll packages without privileges

SCRIPT="$(readlink -f "$0")"

for MF in {"$SCRIPT.d/",""}"Makefile"; do
    if [ -f "$MF" ]; then
        if head "$MF" | grep 'user-yum.sh'  2>&1 >/dev/null; then
            cd "$(dirname "$MF")"
            make "$@"
            exit
        fi
    fi
done

exit "Couldn't find the Makefile with \"user-yum.sh\" in head."

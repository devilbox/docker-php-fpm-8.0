#!/usr/bin/env bash

set -e
set -u
set -o pipefail

IMAGE="${1:-devilbox/php-fpm-8.0}"
ARCH="${2:-linux/amd64}"

MODULES="$( docker run --rm -t --platform "${ARCH}" --entrypoint=php "${IMAGE}" -m \
	| grep -vE '(^\[)|(^\s*$)' \
	| sort -u -f
)"

echo "| Module       | Built-in  |"
echo "|--------------|-----------|"
echo "${MODULES}" | while read -r line; do
	line="$( echo "${line}" | sed 's/\r//g' | xargs )"
	printf "| %-12s | ✔         |\n" "${line}"
done

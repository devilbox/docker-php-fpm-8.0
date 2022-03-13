#!/usr/bin/env bash

set -e
set -u
set -o pipefail


IMAGE="${1}"
#NAME="${2}"
#VERSION="${3}"
TAG="${4}"
ARCH="${5}"

MODULES="$( docker run --rm -t --platform "${ARCH}" --entrypoint=php "${IMAGE}:${TAG}" -m \
	| grep -vE '(^\[)|(^\s*$)' \
	| sort -u -f
)"

echo "| Module       | Built-in  |"
echo "|--------------|-----------|"
echo "${MODULES}" | while read -r line; do
	line="$( echo "${line}" | sed 's/\r//g' | xargs )"
	printf "| %-12s | ✔         |\n" "${line}"
done

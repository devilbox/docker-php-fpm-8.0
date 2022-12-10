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

echo "| Extension                      | Built-in  |"
echo "|--------------------------------|-----------|"
echo "${MODULES}" | while read -r line; do
	name="$( printf "%s" "${line}" )"
	nick="$( echo "${name}" | awk '{print tolower($0)}' | sed 's/\r//g' | xargs )"
	link="$( echo "[${name}][lnk_${nick}]" | sed 's/\r//g' | xargs )"
	if [ "${nick}" = "core" ] || [ "${nick}" = "standard" ]; then
		continue
	fi
	printf "| %-30s | ✓         |\n" "${link}"
done
echo

echo "${MODULES}" | while read -r line; do
	name="$( printf "%s" "${line}" )"
	nick="$( echo "${name}" | awk '{print tolower($0)}' | sed 's/\r//g' | xargs )"
	link="$( printf "%s" "[lnk_${nick}]" | sed 's/\r//g' | xargs )"
	addr="$( printf "%s: %s" "${link}" "https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/${nick}" | sed 's/\r//g' | xargs )"
	if [ "${nick}" = "core" ] || [ "${nick}" = "standard" ]; then
		continue
	fi
	printf "%s\n" "${addr}"
done

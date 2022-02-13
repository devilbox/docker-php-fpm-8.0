#!/usr/bin/env bash

set -e
set -u
set -o pipefail

IMAGE="${1:-devilbox/php-fpm-8.0}"
ARCH="${2:-linux/amd64}"

echo
echo "\$ docker run --rm --platform ${ARCH} --entrypoint=php ${IMAGE} -v | grep -E '^PHP 8\.0'"
docker run --rm --platform "${ARCH}" --entrypoint=php "${IMAGE}" -v | grep -E '^PHP 8\.0'

echo
echo "\$ docker run --rm --platform ${ARCH} --entrypoint=php-fpm ${IMAGE} -v | grep -E '^PHP 8\.0'"
docker run --rm --platform "${ARCH}" --entrypoint=php-fpm "${IMAGE}" -v | grep -E '^PHP 8\.0'

#!/usr/bin/env bash
set -eu
set -o pipefail

IMAGE="${1}"
#NAME="${2}"
VERSION="${3}"
TAG="${4}"
ARCH="${5}"


echo
echo "\$ docker run --rm --platform ${ARCH} --entrypoint=php ${IMAGE}:${TAG} -v | grep -E '^PHP ${VERSION}'"
docker run --rm --platform "${ARCH}" --entrypoint=php "${IMAGE}:${TAG}" -v | grep -E "^PHP ${VERSION}"
echo

echo
echo "\$ docker run --rm --platform ${ARCH} --entrypoint=php-fpm ${IMAGE}:${TAG} -v | grep -E '^PHP ${VERSION}'"
docker run --rm --platform "${ARCH}" --entrypoint=php-fpm "${IMAGE}:${TAG}" -v | grep -E "^PHP ${VERSION}"
echo

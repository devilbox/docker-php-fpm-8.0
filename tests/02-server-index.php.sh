#!/usr/bin/env bash
set -eu
set -o pipefail

IMAGE="${1}"
#NAME="${2}"
VERSION="${3}"
TAG="${4}"
ARCH="${5}"



###
### Variables
###
WWW_PORT="81"
DOC_ROOT_HOST="$( mktemp -d )"
DOC_ROOT_CONT="/var/www/default"

CONFIG_HOST="$( mktemp -d )"
CONFIG_CONT="/etc/nginx/conf.d"

NAME_PHP="devilbox-php-fpm-${VERSION}"

NAME_WEB="nginx-stable-devilbox"
CONT_WEB="nginx:stable"


###
### Create required files
###

# PHP Index File
{
	echo '<?php'
	echo '$array = array("i", "t", "w", "o", "r", "k", "s");'
	echo 'for ($i=0; $i<count($array); $i++) {'
	echo '    printf("%s", $array[$i]);'
	echo '}'
	echo 'printf("\n");'
} > "${DOC_ROOT_HOST}/index.php"
# PHP Error File
{
	echo '<?php'
	echo 'echo "should give errors";'
	echo '$array = ;'
	echo 'test'
} > "${DOC_ROOT_HOST}/error.php"

# Nginx conf
{
	echo "server {"
	echo "    server_name _;"
	echo "    listen 80;"
	echo "    root ${DOC_ROOT_CONT};"
	echo "    index index.php;"
	echo "    location ~* \.php\$ {"
	echo "        fastcgi_index index.php;"
	echo "        fastcgi_pass ${NAME_PHP}:9000;"
	echo "        include fastcgi_params;"
	echo "        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;"
	echo "        fastcgi_param SCRIPT_NAME     \$fastcgi_script_name;"
	echo "    }"
	echo "}"
} > "${CONFIG_HOST}/php.conf"


###
### Fix mount permissions
###
chmod 0777 "${CONFIG_HOST}"
chmod 0777 "${DOC_ROOT_HOST}"
chmod 0644 "${DOC_ROOT_HOST}/index.php"
chmod 0644 "${DOC_ROOT_HOST}/error.php"


###
### Start containers
###
PHP_DID="$( docker run -d --platform "${ARCH}" --name "${NAME_PHP}" -v "${DOC_ROOT_HOST}:${DOC_ROOT_CONT}" "${IMAGE}:${TAG}" )"
sleep 4
WEB_DID="$( docker run -d --platform "${ARCH}" --name "${NAME_WEB}" -v "${DOC_ROOT_HOST}:${DOC_ROOT_CONT}" -v "${CONFIG_HOST}:${CONFIG_CONT}" -p "${WWW_PORT}:80" --link "${NAME_PHP}" "${CONT_WEB}" )"
sleep 4


###
### Test PHP ini
###
#docker exec "${PHP_DID}"

###
### Test for PHP success
###
echo "[TEST] curl index.php:"
echo "------------------------------------"
if ! curl -sS 127.0.0.1:${WWW_PORT}/index.php 2>/dev/null | grep 'itworks'; then
	echo "[FAILED], could not connect to index.php"
	echo

	echo "index.php:"
	echo "------------------------------------"
	cat "${DOC_ROOT_HOST}/index.php"
	echo

	echo "curl:"
	echo "------------------------------------"
	curl -v 127.0.0.1:${WWW_PORT}/index.php
	echo

	echo "docker logs php"
	echo "------------------------------------"
	docker logs "${PHP_DID}"
	echo

	echo "docker logs web"
	echo "------------------------------------"
	docker logs "${WEB_DID}"
	echo

	docker stop "${WEB_DID}" || true
	docker stop "${PHP_DID}" || true

	docker rm -f "${NAME_WEB}" || true
	docker rm -f "${NAME_PHP}" || true

	rm -rf "${DOC_ROOT_HOST}"
	rm -rf "${CONFIG_HOST}"
	exit 1
fi
echo "[SUCCESS]"
echo

###
### Test for Docker access logs
###
echo "[TEST] docker logs 'GET /index.php':"
echo "------------------------------------"
if ! docker logs "${WEB_DID}" 2>&1 | grep 'GET /index.php'; then
	echo "[FAILED], could not find access requests in docker logs."
	echo

	echo "docker logs php"
	echo "------------------------------------"
	docker logs "${PHP_DID}"
	echo

	echo "docker logs web"
	echo "------------------------------------"
	docker logs "${WEB_DID}"
	echo

	docker stop "${WEB_DID}" || true
	docker stop "${PHP_DID}" || true

	docker rm -f "${NAME_WEB}" || true
	docker rm -f "${NAME_PHP}" || true

	rm -rf "${DOC_ROOT_HOST}"
	rm -rf "${CONFIG_HOST}"
	exit 1
fi
echo "[SUCCESS]"
echo


###
### Test for PHP errors
###
echo "[TEST] curl error.php:"
echo "------------------------------------"
if ! curl -sS 127.0.0.1:${WWW_PORT}/error.php 2>/dev/null | grep 'syntax error'; then
	echo "[FAILED], could not connect to error.php"
	echo

	echo "error.php:"
	echo "------------------------------------"
	cat "${DOC_ROOT_HOST}/index.php"
	echo

	echo "curl:"
	echo "------------------------------------"
	curl -v 127.0.0.1:${WWW_PORT}/error.php
	echo

	echo "docker logs php"
	echo "------------------------------------"
	docker logs "${PHP_DID}"
	echo

	echo "docker logs web"
	echo "------------------------------------"
	docker logs "${WEB_DID}"
	echo

	docker stop "${WEB_DID}" || true
	docker stop "${PHP_DID}" || true

	docker rm -f "${NAME_WEB}" || true
	docker rm -f "${NAME_PHP}" || true

	rm -rf "${DOC_ROOT_HOST}"
	rm -rf "${CONFIG_HOST}"
	exit 1
fi
echo "[SUCCESS]"
echo

###
### Test for Docker error logs
###
echo "[TEST] docker logs 'syntax error':"
echo "------------------------------------"

if ! docker logs "${WEB_DID}" 2>&1 | grep 'syntax error'; then
	echo "[FAILED], could not find error message in docker logs."
	echo

	echo "docker logs php"
	echo "------------------------------------"
	docker logs "${PHP_DID}"
	echo

	echo "docker logs web"
	echo "------------------------------------"
	docker logs "${WEB_DID}"
	echo

	docker stop "${WEB_DID}" || true
	docker stop "${PHP_DID}" || true

	docker rm -f "${NAME_WEB}" || true
	docker rm -f "${NAME_PHP}" || true

	rm -rf "${DOC_ROOT_HOST}"
	rm -rf "${CONFIG_HOST}"
	exit 1
fi
echo "[SUCCESS]"
echo


###
### Clean-up
###
echo "[CLEANUP] shutdown:"
echo "------------------------------------"
docker stop "${WEB_DID}" >/dev/null 2>&1 || true
docker stop "${PHP_DID}" >/dev/null 2>&1 || true

docker rm -f "${NAME_WEB}" >/dev/null 2>&1 || true
docker rm -f "${NAME_PHP}" >/dev/null 2>&1 || true

rm -rf "${DOC_ROOT_HOST}" >/dev/null 2>&1 || true
rm -rf "${CONFIG_HOST}"   >/dev/null 2>&1 || true

exit 0

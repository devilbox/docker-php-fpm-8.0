# PHP-FPM 8.0

[![lint](https://github.com/devilbox/docker-php-fpm-8.0/workflows/lint/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Alint)
[![build](https://github.com/devilbox/docker-php-fpm-8.0/workflows/build/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Abuild)
[![nightly](https://github.com/devilbox/docker-php-fpm-8.0/workflows/nightly/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Anightly)

[![Tag](https://img.shields.io/github/tag/devilbox/docker-php-fpm-8.0.svg)](https://github.com/devilbox/docker-php-fpm-8.0/releases)
[![Gitter](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697)](https://devilbox.discourse.group)
[![](https://images.microbadger.com/badges/version/devilbox/php-fpm-8.0.svg)](https://microbadger.com/images/devilbox/php-fpm-8.0 "php-fpm-8.0")
[![](https://images.microbadger.com/badges/image/devilbox/php-fpm-8.0.svg)](https://microbadger.com/images/devilbox/php-fpm-8.0 "php-fpm-8.0")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

**Available Architectures:**  `amd64`, `arm64`, `386`, `arm/v7`, `arm/v6`

This repository will provide you a fully functional PHP-FPM 8.0 Docker image built from [official sources](https://github.com/php/php-src) nightly. It provides the base for [Devilbox PHP-FPM Docker images](https://github.com/devilbox/docker-php-fpm).

| Docker Hub | Upstream Project |
|------------|------------------|
| <a href="https://hub.docker.com/r/devilbox/php-fpm-8.0"><img height="82px" src="http://dockeri.co/image/devilbox/php-fpm-8.0" /></a> | <a href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |

## Similar Base Images

Have a look at the following similar Devilbox base images for which no official versions exist yet:

* [PHP-FPM 5.2](https://github.com/devilbox/docker-php-fpm-5.2)
* [PHP-FPM 5.3](https://github.com/devilbox/docker-php-fpm-5.3)
* [PHP-FPM 7.4](https://github.com/devilbox/docker-php-fpm-7.4)
* [PHP-FPM 8.0](https://github.com/devilbox/docker-php-fpm-8.0)
* [PHP-FPM 8.1](https://github.com/devilbox/docker-php-fpm-8.1)
* [PHP-FPM 8.2](https://github.com/devilbox/docker-php-fpm-8.2)

In case you are looking for development and production ready PHP-FPM images for all versions,
which have a vast amount of modules enabled by default go here:

* [PHP-FPM](https://github.com/devilbox/docker-php-fpm)

## Documentation

In case you seek help, go and visit the community pages.

<table width="100%" style="width:100%; display:table;">
 <thead>
  <tr>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.readthedocs.io">Documentation</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://gitter.im/devilbox/Lobby">Chat</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.discourse.group">Forum</a></h3></th>
  </tr>
 </thead>
 <tbody style="vertical-align: middle; text-align: center;">
  <tr>
   <td>
    <a target="_blank" href="https://devilbox.readthedocs.io">
     <img title="Documentation" name="Documentation" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/readthedocs.png" />
    </a>
   </td>
   <td>
    <a target="_blank" href="https://gitter.im/devilbox/Lobby">
     <img title="Chat on Gitter" name="Chat on Gitter" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/gitter.png" />
    </a>
   </td>
   <td>
    <a target="_blank" href="https://devilbox.discourse.group">
     <img title="Devilbox Forums" name="Forum" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/discourse.png" />
    </a>
   </td>
  </tr>
  <tr>
  <td><a target="_blank" href="https://devilbox.readthedocs.io">devilbox.readthedocs.io</a></td>
  <td><a target="_blank" href="https://gitter.im/devilbox/Lobby">gitter.im/devilbox</a></td>
  <td><a target="_blank" href="https://devilbox.discourse.group">devilbox.discourse.group</a></td>
  </tr>
 </tbody>
</table>

## Build

```bash
# Build the Docker image locally
make build

# Rebuild the Docker image locally without cache
make rebuild

# Test the Docker image after building
make test
```

## Usage

Add the following `FROM` line into your Dockerfile:

```dockerfile
FROM devilbox/php-fpm-8.0:latest
```

## Available Modules

If you need a dockerized version of **PHP 8.0** or **PHP-FPM 8.0** which provides a vast amount of
modules enabled by default visit: **[devilbox/docker-php-fpm](https://github.com/devilbox/docker-php-fpm)**

<!-- modules -->
| Module       | Built-in  |
|--------------|-----------|
| Core         | ✔         |
| ctype        | ✔         |
| curl         | ✔         |
| date         | ✔         |
| dom          | ✔         |
| FFI          | ✔         |
| fileinfo     | ✔         |
| filter       | ✔         |
| ftp          | ✔         |
| hash         | ✔         |
| iconv        | ✔         |
| json         | ✔         |
| libxml       | ✔         |
| mbstring     | ✔         |
| mysqlnd      | ✔         |
| openssl      | ✔         |
| pcre         | ✔         |
| PDO          | ✔         |
| pdo_sqlite   | ✔         |
| Phar         | ✔         |
| posix        | ✔         |
| readline     | ✔         |
| Reflection   | ✔         |
| session      | ✔         |
| SimpleXML    | ✔         |
| sodium       | ✔         |
| SPL          | ✔         |
| sqlite3      | ✔         |
| standard     | ✔         |
| tokenizer    | ✔         |
| xml          | ✔         |
| xmlreader    | ✔         |
| xmlwriter    | ✔         |
| zlib         | ✔         |
<!-- /modules -->

## Example

Create a temporary directory, navigate into it and copy/paste the commands below to get started.

#### 1. Setup hello world webpage
```bash
mkdir htdocs
echo "<?php echo 'hello world';" > htdocs/index.php
```

#### 2. Start PHP container
```bash
docker run -d --rm --name devilbox-php-fpm-8-0 \
  -v $(pwd)/htdocs:/var/www/default/htdocs devilbox/php-fpm-8.0
```

#### 3. Start Nginx container
```bash
docker run -d --rm --name devilbox-nginx-stable \
  -v $(pwd)/htdocs:/var/www/default/htdocs \
  -e PHP_FPM_ENABLE=1 \
  -e PHP_FPM_SERVER_ADDR=devilbox-php-fpm-8-0 \
  -p 8080:80 \
  --link devilbox-php-fpm-8-0 \
  devilbox/nginx-stable
```

#### 4. Open browser

Open up your browser at http://127.0.0.1:8080

## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)

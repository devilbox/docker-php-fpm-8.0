# PHP-FPM 8.0

[![Build Status](https://travis-ci.org/devilbox/docker-php-fpm-8.0.svg?branch=master)](https://travis-ci.org/devilbox/docker-php-fpm-8.0)
[![Tag](https://img.shields.io/github/tag/devilbox/docker-php-fpm-8.0.svg)](https://github.com/devilbox/docker-php-fpm-8.0/releases)
[![Gitter](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697)](https://devilbox.discourse.group)
[![](https://images.microbadger.com/badges/version/devilbox/php-fpm-8.0.svg)](https://microbadger.com/images/devilbox/php-fpm-8.0 "php-fpm-8.0")
[![](https://images.microbadger.com/badges/image/devilbox/php-fpm-8.0.svg)](https://microbadger.com/images/devilbox/php-fpm-8.0 "php-fpm-8.0")
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

This repository will provide you a fully functional PHP-FPM 8.0 Docker image built from [official sources](https://github.com/php/php-src) nightly. It provides the base for [Devilbox PHP-FPM Docker images](https://github.com/devilbox/docker-php-fpm).


| Docker Hub | Upstream Project |
|------------|------------------|
| <a href="https://hub.docker.com/r/devilbox/php-fpm-8.0"><img height="82px" src="http://dockeri.co/image/devilbox/php-fpm-8.0" /></a> | <a href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |


## Similar Base Images

* [PHP-FPM 5.2](https://github.com/devilbox/docker-php-fpm-5.2)
* [PHP-FPM 5.3](https://github.com/devilbox/docker-php-fpm-5.3)
* [PHP-FPM 7.4](https://github.com/devilbox/docker-php-fpm-7.4)
* [PHP-FPM](https://github.com/devilbox/docker-php-fpm) (all PHP versions)


## Build

```bash
# Build the Docker image locally
make build

# Rebuild (without cache) the Docker image locally
make rebuild

# Test the Docker image after building
make test
```


## Usage

Add the following `FROM` line into your Dockerfile:

```dockerfile
FROM devilbox/php-fpm-8.0:latest
```


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

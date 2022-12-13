# PHP-FPM 8.0

[![Tag](https://img.shields.io/github/tag/devilbox/docker-php-fpm-8.0.svg)](https://github.com/devilbox/docker-php-fpm-8.0/releases)
[![](https://img.shields.io/badge/github-devilbox%2Fdocker--php--fpm--8.0-red.svg)](https://github.com/devilbox/docker-php-fpm-8.0 "github.com/devilbox/docker-php-fpm-8.0")
[![lint](https://github.com/devilbox/docker-php-fpm-8.0/workflows/lint/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Alint)
[![build](https://github.com/devilbox/docker-php-fpm-8.0/workflows/build/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Abuild)
[![nightly](https://github.com/devilbox/docker-php-fpm-8.0/workflows/nightly/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Anightly)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![Gitter](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697)](https://devilbox.discourse.group)

**Available Architectures:**  `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`

[![](https://img.shields.io/docker/pulls/devilbox/php-fpm-8.0.svg)](https://hub.docker.com/r/devilbox/php-fpm-8.0)


This repository will provide you a fully functional PHP-FPM 8.0 Docker image built from [official sources](https://github.com/php/php-src) nightly. It provides the base for [Devilbox PHP-FPM Docker images](https://github.com/devilbox/docker-php-fpm).

> ##### 🐱 GitHub: [devilbox/docker-php-fpm-8.0](https://github.com/devilbox/docker-php-fpm-8.0)

| Upstream Project | Reference Implementation |
|:----------------:|:------------------------:|
| <a title="Docker PHP-FMP" href="https://github.com/devilbox/docker-php-fpm" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/02/png/banner_256_trans.png" /></a> | <a title="Devilbox" href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |
| Streamlined [PHP-FPM](https://github.com/devilbox/docker-php-fpm) images | The [Devilbox](https://github.com/cytopia/devilbox) |



## 🐋 Available Docker tags

[![](https://img.shields.io/docker/pulls/devilbox/php-fpm-8.0.svg)](https://hub.docker.com/r/devilbox/php-fpm-8.0)

[`latest`][tag_latest]
```bash
docker pull devilbox/php-fpm-8.0
```

#### Rolling releases

The following Docker image tags are rolling releases and are built and updated every night.

[![nightly](https://github.com/devilbox/docker-php-fpm-8.0/workflows/nightly/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Anightly)

| Docker Tag                      | Git Ref      |  Available Architectures                      |
|---------------------------------|--------------|-----------------------------------------------|
| **[`latest`][tag_latest]**      | master       |  `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6` |

[tag_latest]: https://github.com/devilbox/docker-php-fpm-8.0/blob/master/Dockerfiles/Dockerfile


#### Point in time releases

The following Docker image tags are built once and can be used for reproducible builds. Its version never changes so you will have to update tags in your pipelines from time to time in order to stay up-to-date.

[![build](https://github.com/devilbox/docker-php-fpm-8.0/workflows/build/badge.svg)](https://github.com/devilbox/docker-php-fpm-8.0/actions?query=workflow%3Abuild)

| Docker Tag                      | Git Ref      |  Available Architectures                      |
|---------------------------------|--------------|-----------------------------------------------|
| **[`<tag>`][tag_latest]**       | git: `<tag>` |  `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6` |

> 🛈 Where `<tag>` refers to the chosen git tag from this repository.


## ∑ Environment Variables

None


## 🖧 Exposed Ports

PHP-FPM listening port `9000`


## 📂 Volumes

None


## ✰ Available Extensions

If you need a dockerized version of **PHP 8.0** or **PHP-FPM 8.0** which provides a vast amount of
extensions enabled by default visit: **[devilbox/docker-php-fpm](https://github.com/devilbox/docker-php-fpm)**

> 🛈 Click below listed extensions for details:

<!-- modules -->
| Extension                      | Built-in  |
|--------------------------------|-----------|
| [ctype][lnk_ctype]             | ✓         |
| [curl][lnk_curl]               | ✓         |
| [date][lnk_date]               | ✓         |
| [dom][lnk_dom]                 | ✓         |
| [FFI][lnk_ffi]                 | ✓         |
| [fileinfo][lnk_fileinfo]       | ✓         |
| [filter][lnk_filter]           | ✓         |
| [ftp][lnk_ftp]                 | ✓         |
| [hash][lnk_hash]               | ✓         |
| [iconv][lnk_iconv]             | ✓         |
| [json][lnk_json]               | ✓         |
| [libxml][lnk_libxml]           | ✓         |
| [mbstring][lnk_mbstring]       | ✓         |
| [mysqlnd][lnk_mysqlnd]         | ✓         |
| [openssl][lnk_openssl]         | ✓         |
| [pcre][lnk_pcre]               | ✓         |
| [PDO][lnk_pdo]                 | ✓         |
| [pdo_sqlite][lnk_pdo_sqlite]   | ✓         |
| [Phar][lnk_phar]               | ✓         |
| [posix][lnk_posix]             | ✓         |
| [readline][lnk_readline]       | ✓         |
| [Reflection][lnk_reflection]   | ✓         |
| [session][lnk_session]         | ✓         |
| [SimpleXML][lnk_simplexml]     | ✓         |
| [sodium][lnk_sodium]           | ✓         |
| [SPL][lnk_spl]                 | ✓         |
| [sqlite3][lnk_sqlite3]         | ✓         |
| [tokenizer][lnk_tokenizer]     | ✓         |
| [xml][lnk_xml]                 | ✓         |
| [xmlreader][lnk_xmlreader]     | ✓         |
| [xmlwriter][lnk_xmlwriter]     | ✓         |
| [zlib][lnk_zlib]               | ✓         |

[lnk_ctype]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/ctype
[lnk_curl]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/curl
[lnk_date]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/date
[lnk_dom]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/dom
[lnk_ffi]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/ffi
[lnk_fileinfo]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/fileinfo
[lnk_filter]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/filter
[lnk_ftp]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/ftp
[lnk_hash]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/hash
[lnk_iconv]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/iconv
[lnk_json]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/json
[lnk_libxml]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/libxml
[lnk_mbstring]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/mbstring
[lnk_mysqlnd]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/mysqlnd
[lnk_openssl]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/openssl
[lnk_pcre]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/pcre
[lnk_pdo]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/pdo
[lnk_pdo_sqlite]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/pdo_sqlite
[lnk_phar]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/phar
[lnk_posix]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/posix
[lnk_readline]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/readline
[lnk_reflection]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/reflection
[lnk_session]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/session
[lnk_simplexml]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/simplexml
[lnk_sodium]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/sodium
[lnk_spl]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/spl
[lnk_sqlite3]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/sqlite3
[lnk_tokenizer]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/tokenizer
[lnk_xml]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/xml
[lnk_xmlreader]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/xmlreader
[lnk_xmlwriter]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/xmlwriter
[lnk_zlib]: https://github.com/devilbox/docker-php-fpm/tree/master/php_modules/zlib
<!-- /modules -->


## ∢ Build

Build the Docker image locally
```bash
make build
```
Rebuild the Docker image locally without cache
```bash
make rebuild
```
Test the Docker image after building
```bash
make test
```


## 🖳 Usage

Add the following `FROM` line into your Dockerfile:

```dockerfile
FROM devilbox/php-fpm-8.0:latest
```


## 💡 Examples

Create a temporary directory, navigate into it and copy/paste the commands below to get started.

#### 1. Setup hello world webpage
```bash
mkdir htdocs
echo "<?php echo 'hello world';" > htdocs/index.php
```

#### 2. Start PHP container
```bash
docker run -d --rm --name devilbox-php-fpm-8.0 \
  -v $(pwd)/htdocs:/var/www/default/htdocs devilbox/php-fpm-8.0
```

#### 3. Start Nginx container
```bash
docker run -d --rm --name devilbox-nginx-stable \
  -v $(pwd)/htdocs:/var/www/default/htdocs \
  -e PHP_FPM_ENABLE=1 \
  -e PHP_FPM_SERVER_ADDR=devilbox-php-fpm-8.0 \
  -p 8080:80 \
  --link devilbox-php-fpm-8.0 \
  devilbox/nginx-stable
```

#### 4. Open browser

Open up your browser at http://127.0.0.1:8080


## 🔁 Similar Base Images

Have a look at the following similar Devilbox base images for which no official versions exist yet:

* **[`PHP-FPM 5.2`](https://github.com/devilbox/docker-php-fpm-5.2)** **[`PHP-FPM 5.3`](https://github.com/devilbox/docker-php-fpm-5.3)** **[`PHP-FPM 5.4`](https://github.com/devilbox/docker-php-fpm-5.4)** **[`PHP-FPM 5.5`](https://github.com/devilbox/docker-php-fpm-5.5)**
* **[`PHP-FPM 8.0`](https://github.com/devilbox/docker-php-fpm-8.0)** **[`PHP-FPM 8.1`](https://github.com/devilbox/docker-php-fpm-8.1)** **[`PHP-FPM 8.2`](https://github.com/devilbox/docker-php-fpm-8.2)** **[`PHP-FPM 8.3`](https://github.com/devilbox/docker-php-fpm-8.3)**

In case you are looking for development and production ready PHP-FPM images for all versions,
which have a vast amount of modules enabled by default go here: **[PHP-FPM](https://github.com/devilbox/docker-php-fpm)**

> 🛈 For details see **[Documentation: Base Images](https://github.com/devilbox/docker-php-fpm/blob/master/doc/base-images.md)**


## 🖤 Sister Projects

Show some love for the following sister projects.

<table>
 <tr>
  <th>🖤 Project</th>
  <th>🐱 GitHub</th>
  <th>🐋 DockerHub</th>
 </tr>
 <tr>
  <td><a title="Devilbox" href="https://github.com/cytopia/devilbox" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/cytopia/devilbox"><code>Devilbox</code></a></td>
  <td></td>
 </tr>
 <tr>
  <td><a title="Docker PHP-FMP" href="https://github.com/devilbox/docker-php-fpm" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/02/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-php-fpm"><code>docker-php-fpm</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/php-fpm"><code>devilbox/php-fpm</code></a></td>
 </tr>
 <tr>
  <td><a title="Docker PHP-FMP-Community" href="https://github.com/devilbox/docker-php-fpm-community" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/03/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-php-fpm-community"><code>docker-php-fpm-community</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/php-fpm-community"><code>devilbox/php-fpm-community</code></a></td>
 </tr>
 <tr>
  <td><a title="Docker MySQL" href="https://github.com/devilbox/docker-mysql" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/04/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-mysql"><code>docker-mysql</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/mysql"><code>devilbox/mysql</code></a></td>
 </tr>
 <tr>
  <td><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/05/png/banner_256_trans.png" /></td>
  <td>
   <a href="https://github.com/devilbox/docker-apache-2.2"><code>docker-apache-2.2</code></a><br/>
   <a href="https://github.com/devilbox/docker-apache-2.4"><code>docker-apache-2.4</code></a><br/>
   <a href="https://github.com/devilbox/docker-nginx-stable"><code>docker-nginx-stable</code></a><br/>
   <a href="https://github.com/devilbox/docker-nginx-mainline"><code>docker-nginx-mainline</code></a>
  </td>
  <td>
   <a href="https://hub.docker.com/r/devilbox/apache-2.2"><code>devilbox/apache-2.2</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/apache-2.4"><code>devilbox/apache-2.4</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/nginx-stable"><code>devilbox/nginx-stable</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/nginx-mainline"><code>devilbox/nginx-mainline</code></a>
  </td>
 </tr>
</table>


## 👫 Community

In case you seek help, go and visit the community pages.

<table width="100%" style="width:100%; display:table;">
 <thead>
  <tr>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.readthedocs.io">📘	Documentation</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://discord.gg/2wP3V6kBj4">🎮 Discord</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.discourse.group">🗪 Forum</a></h3></th>
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
    <a target="_blank" href="https://discord.gg/2wP3V6kBj4">
     <img title="Chat on Discord" name="Chat on Discord" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/discord.png" />
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
  <td><a target="_blank" href="https://discord.gg/2wP3V6kBj4">discord/devilbox</a></td>
  <td><a target="_blank" href="https://devilbox.discourse.group">devilbox.discourse.group</a></td>
  </tr>
 </tbody>
</table>


## 🧘 Maintainer

**[@cytopia](https://github.com/cytopia)**

I try to keep up with literally **over 100 projects** besides a full-time job.
If my work is making your life easier, consider contributing. 🖤

* [GitHub Sponsorship](https://github.com/sponsors/cytopia)
* [Patreon](https://www.patreon.com/devilbox)
* [Open Collective](https://opencollective.com/devilbox)

**Findme:**
**🐱** [cytopia](https://github.com/cytopia) / [devilbox](https://github.com/devilbox) |
**🐋** [cytopia](https://hub.docker.com/r/cytopia/) / [devilbox](https://hub.docker.com/r/devilbox/) |
**🐦** [everythingcli](https://twitter.com/everythingcli) / [devilbox](https://twitter.com/devilbox) |
**📖** [everythingcli.org](http://www.everythingcli.org/)

**Contrib:** PyPI: [cytopia](https://pypi.org/user/cytopia/) **·**
Terraform: [cytopia](https://registry.terraform.io/namespaces/cytopia) **·**
Ansible: [cytopia](https://galaxy.ansible.com/cytopia)


## 🗎 License

**[MIT License](LICENSE)**

Copyright (c) 2022 [cytopia](https://github.com/cytopia)

# oauth-proxy-nginx

> Basic OAuth proxy and nginx setup

`oauth-proxy-nginx` combines [oauth2_proxy](https://github.com/bitly/oauth2_proxy)
with [nginx](http://nginx.org/).

This repository contains sources and documentation
for the docker cloud repository [marionebl/oauth-proxy-nginx](https://cloud.docker.com/app/marionebl/repository/docker/marionebl/oauth-proxy-nginx/general).

## Installation

```
docker pull marionebl/oauth-proxy-nginx:stable-2.1
```

## Usage

```sh
# Dockerfile
FROM marionebl/oauth-proxy-nginx:stable-2.1

COPY ./www /var/www/ # nginx hosts from /var/www
COPY ./oauth-templates /etc/oauth2_proxy # oauth2_proxy reads templates from /etc/oauth2_proxy
COPY ./nginx-config /etc/
```

## Configuration

* Provide static assets by copying them to `/var/www`
* Provide custom oauth2 templates by copying them to `/etc/oauth2_proxy`
* Override nginx config by copying to `/etc/nginx/conf.d/default.conf`
* `OAUTH_LOGIN_URL` - login url to use for oauth flow
* `OAUTH_REDEEM_URL` - url to redeem access tokens from
* `OAUTH_VALIDATE_URL`- url to validate login state at
* `OAUTH_EMAIL_DOMAIN` - emails to allow for username entries
* `OAUTH_UPSTREAM`- upstream resource to protect
* `OAUTH_COOKIE_SECRET`
* `OAUTH_PROVIDER` - oAuth2 provider to use
* `OAUTH_CLIENT_ID`
* `OAUTH_CLIENT_SECRET`

## Examples

```shell
docker run \
 -e OAUTH_LOGIN_URL=https://gitlab.com/oauth/auth/authenticate \
 -e OAUTH_REDEEM_URL=https://gitlab.com/oauth/auth/accessToken \
 -e OAUTH_VALIDATE_URL=https://gitlab.com/oauth/api/user \
 -e OAUTH_EMAIL_DOMAIN=* \
 -e OAUTH_UPSTREAM=http://localhost:1337 \
 -e OAUTH_PROVIDER=gitlab \
 -e OAUTH_COOKIE_SECRET=cMmyYrM7HkX3WCty4haQXsXw \
 -e OAUTH_CLIENT_ID=nUYnx23tVFhWgoBVyqd7vjXpwdUhcxisecPhvPmCoeZuCGjGbuims8HdMY2WHJZ6 \
 -e OAUTH_CLIENT_SECRET=z2iDapWU8VQnn6jWjTJ9KXqFyfgtymrWJFMGjZxfwqGixVrEjvp8iKaLQBwkFFb6 \
 marionebl/oauth-proxy-nginx:stable-2.1
```

---
(c) Mario Nebl. MIT License

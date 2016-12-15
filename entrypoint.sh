#!/usr/bin/env sh

oauth2_proxy \
	-login-url="$OAUTH_LOGIN_URL" \
	-redeem-url="$OAUTH_REDEEM_URL" \
	--validate-url="$OAUTH_VALIDATE_URL" \
	--email-domain=$OAUTH_EMAIL_DOMAIN \
	--upstream=$OAUTH_UPSTREAM \
	--cookie-secret=$OAUTH_COOKIE_SECRET \
	--cookie-secure=true \
	--cookie-refresh=30s \
	--custom-templates-dir="/etc/oauth2_proxy" \
	--cookie-expire=1h \
	--provider=$OAUTH_PROVIDER \
	--scope="user" \
	--client-id=$OAUTH_CLIENT_ID \
	--client-secret=$OAUTH_CLIENT_SECRET \
	--skip-provider-button=true \
	&

nginx -g "daemon off;"

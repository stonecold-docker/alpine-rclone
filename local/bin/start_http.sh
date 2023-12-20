#!/bin/sh

if [ "${USE_HTTP}" = "Y" ]; then
	HTTP_USER_NAME=${HTTP_USER_NAME}
	HTTP_USER_PASSWD=$([ ! -z "${HTTP_USER_EPASSWD}" ] && echo ${HTTP_USER_EPASSWD} | base64 -d 2>/dev/null || echo ${HTTP_USER_PASSWD})
	if [ ! -z "${HTTP_USER_NAME}" ]; then
		USER_NAME=${HTTP_USER_NAME}
	else
		USER_NAME=${USER_NAME:-forumi0721}
	fi
	if [ ! -z "${HTTP_USER_PASSWD}" ]; then
		USER_PASSWD=${HTTP_USER_PASSWD}
	else
		USER_PASSWD=$([ ! -z "${USER_EPASSWD}" ] && echo ${USER_EPASSWD} | base64 -d 2>/dev/null || echo ${USER_PASSWD:-passwd})
	fi
	USER_UID=${USER_UID:-1000}
	USER_GID=${USER_GID:-100}

	HTTP_SHARE=${HTTP_SHARE:-/data}
	HTTP_ADDR=${HTTP_ADDR:-0.0.0.0:8000}
	HTTP_BASEURL=${HTTP_BASEURL:-/}

	exec rclone serve http ${HTTP_SHARE} --addr ${HTTP_ADDR} --user ${USER_NAME} --pass ${USER_PASSWD} --uid ${USER_UID} --gid ${USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L --baseurl ${HTTP_BASEURL}
fi


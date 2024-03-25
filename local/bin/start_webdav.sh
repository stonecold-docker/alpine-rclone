#!/bin/sh

if [ "${USE_WEBDAV}" = "Y" ]; then
	RUN_USER_NAME=${RUN_USER_NAME:-forumi0721}
	RUN_USER_UID=${RUN_USER_UID:-1000}
	RUN_USER_GID=${RUN_USER_GID:-100}

	WEBDAV_USER_NAME=${WEBDAV_USER_NAME}
	WEBDAV_USER_PASSWD=$([ ! -z "${WEBDAV_USER_EPASSWD}" ] && echo ${WEBDAV_USER_EPASSWD} | base64 -d 2>/dev/null || echo ${WEBDAV_USER_PASSWD})
	if [ ! -z "${WEBDAV_USER_NAME}" ]; then
		USER_NAME=${WEBDAV_USER_NAME}
	else
		USER_NAME=${USER_NAME:-forumi0721}
	fi
	if [ ! -z "${WEBDAV_USER_PASSWD}" ]; then
		USER_PASSWD=${WEBDAV_USER_PASSWD}
	else
		USER_PASSWD=$([ ! -z "${USER_EPASSWD}" ] && echo ${USER_EPASSWD} | base64 -d 2>/dev/null || echo ${USER_PASSWD:-passwd})
	fi

	WEBDAV_SHARE=${WEBDAV_SHARE:-/data}
	WEBDAV_ADDR=${WEBDAV_ADDR:-0.0.0.0:8080}
	WEBDAV_BASEURL=${WEBDAV_BASEURL:-/}

	exec su-exec ${RUN_USER_NAME} rclone serve webdav ${WEBDAV_SHARE} --addr ${WEBDAV_ADDR} --user ${USER_NAME} --pass ${USER_PASSWD} --uid ${RUN_USER_UID} --gid ${RUN_USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L --baseurl ${WEBDAV_BASEURL}
fi


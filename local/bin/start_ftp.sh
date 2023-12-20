#!/bin/sh

if [ "${USE_FTP}" = "Y" ]; then
	FTP_USER_NAME=${FTP_USER_NAME}
	FTP_USER_PASSWD=$([ ! -z "${FTP_USER_EPASSWD}" ] && echo ${FTP_USER_EPASSWD} | base64 -d 2>/dev/null || echo ${FTP_USER_PASSWD})
	if [ ! -z "${FTP_USER_NAME}" ]; then
		USER_NAME=${FTP_USER_NAME}
	else
		USER_NAME=${USER_NAME:-forumi0721}
	fi
	if [ ! -z "${FTP_USER_PASSWD}" ]; then
		USER_PASSWD=${FTP_USER_PASSWD}
	else
		USER_PASSWD=$([ ! -z "${USER_EPASSWD}" ] && echo ${USER_EPASSWD} | base64 -d 2>/dev/null || echo ${USER_PASSWD:-passwd})
	fi
	USER_UID=${USER_UID:-1000}
	USER_GID=${USER_GID:-100}

	FTP_SHARE=${FTP_SHARE:-/data}
	FTP_ADDR=${FTP_ADDR:-0.0.0.0:2121}
	FTP_PASV_MIN_PORT=${FTP_PASV_MIN_PORT:-62100}
	FTP_PASV_MAX_PORT=${FTP_PASV_MAX_PORT:-62199}

	exec rclone serve ftp ${FTP_SHARE} --addr ${FTP_ADDR} --user ${USER_NAME} --pass ${USER_PASSWD} --uid ${USER_UID} --gid ${USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L --passive-port ${FTP_PASV_MIN_PORT}-${FTP_PASV_MAX_PORT}
fi


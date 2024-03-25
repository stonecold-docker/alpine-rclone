#!/bin/sh

if [ "${USE_SFTP}" = "Y" ]; then
	RUN_USER_NAME=${RUN_USER_NAME:-forumi0721}
	RUN_USER_UID=${RUN_USER_UID:-1000}
	RUN_USER_GID=${RUN_USER_GID:-100}

	SFTP_USER_NAME=${SFTP_USER_NAME}
	SFTP_USER_PASSWD=$([ ! -z "${SFTP_USER_EPASSWD}" ] && echo ${SFTP_USER_EPASSWD} | base64 -d 2>/dev/null || echo ${SFTP_USER_PASSWD})
	if [ ! -z "${SFTP_USER_NAME}" ]; then
		USER_NAME=${SFTP_USER_NAME}
	else
		USER_NAME=${USER_NAME:-forumi0721}
	fi
	if [ ! -z "${SFTP_USER_PASSWD}" ]; then
		USER_PASSWD=${SFTP_USER_PASSWD}
	else
		USER_PASSWD=$([ ! -z "${USER_EPASSWD}" ] && echo ${USER_EPASSWD} | base64 -d 2>/dev/null || echo ${USER_PASSWD:-passwd})
	fi

	SFTP_SHARE=${SFTP_SHARE:-/data}
	SFTP_ADDR=${SFTP_ADDR:-0.0.0.0:2020}
	SFTP_AUTHORIZED_KEYS=${SFTP_AUTHORIZED_KEYS}
	SFTP_KEYS=${SFTP_KEYS}

	exec su-exec ${RUN_USER_NAME} rclone serve sftp ${SFTP_SHARE} --addr ${SFTP_ADDR} --user ${USER_NAME} --pass ${USER_PASSWD} --uid ${RUN_USER_UID} --gid ${RUN_USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L $([ ! -z "${SFTP_AUTHORIZED_KEYS}" ] && echo "--authorized-keys ${SFTP_AUTHORIZED_KEYS}") $([ ! -z "${SFTP_KEYS}" ] && echo "--keys ${SFTP_KEYS}")
fi


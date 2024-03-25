#!/bin/sh

if [ "${USE_NFS}" = "Y" ]; then
	RUN_USER_NAME=${RUN_USER_NAME:-forumi0721}
	RUN_USER_UID=${RUN_USER_UID:-1000}
	RUN_USER_GID=${RUN_USER_GID:-100}

	NFS_SHARE=${NFS_SHARE:-/data}
	NFS_ADDR=${NFS_ADDR:-0.0.0.0:2049}
	NFS_BASEURL=${NFS_BASEURL:-/}

	exec su-exec ${RUN_USER_NAME} rclone serve nfs ${NFS_SHARE} --addr ${NFS_ADDR} --uid ${RUN_USER_UID} --gid ${RUN_USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L
fi


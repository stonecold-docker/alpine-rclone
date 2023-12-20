#!/bin/sh

if [ "${USE_NFS}" = "Y" ]; then
	USER_UID=${USER_UID:-1000}
	USER_GID=${USER_GID:-100}

	NFS_SHARE=${NFS_SHARE:-/data}
	NFS_ADDR=${NFS_ADDR:-0.0.0.0:2049}
	NFS_BASEURL=${NFS_BASEURL:-/}

	exec rclone serve nfs ${NFS_SHARE} --addr ${NFS_ADDR} --uid ${USER_UID} --gid ${USER_GID} --dir-perms 0755 --file-perms 0644 --no-modtime -L
fi

